package com.meekgeek.statemachines.finite.manager
{
	import com.meekgeek.statemachines.finite.events.StateEvent;
	import com.meekgeek.statemachines.finite.events.StateManagerEvent;
	import com.meekgeek.statemachines.finite.statemachine;
	import com.meekgeek.statemachines.finite.states.State;
	
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	
	public class StateManager extends EventDispatcher
	{
		private var _context:DisplayObject;
		private var _currentState:State;
		private var _newState:State;
		private var _states:Object;
		private var _status:StateManagerStatus = StateManagerStatus.STANDBY;
		
		public function StateManager( context:DisplayObject )
		{
			this._context = context;
			this._states = new Object();
		}
		
		public function addState( key:String, state:State, startState:Boolean = false ):void
		{
			if( this._states[key] == null )
			{
				this._states[key] = state;
				this._states[key].statemachine::setContext( this._context );
				this._states[key].statemachine::setKey( key );
				this._states[key].addEventListener( StateEvent.ON_INTRO_COMPLETE, onIntroComplete );
				this._states[key].addEventListener( StateEvent.ON_OUTRO_COMPLETE, onOutroComplete );
			}
			
			if( startState ) this.initState( key );
		}
		
		public function setState( key:String ):void
		{	
			if( this._states[key] == null )
				throw Error( 'No Such State: '+key );
				
			//if no state has been set to initialize
			// init new state
			//else change
			if( this._currentState == null )
			{	
				this.initState( key );
			}else
			{
				this._newState = this._states[key];
				if( this._status == StateManagerStatus.STANDBY )
					this.changeState();
			}
		}
		
		public function getState():String
		{
			return this._currentState.statemachine::getKey();
		}
		
		private function initState( key:String ):void
		{
			this._status = StateManagerStatus.INTRO_ACTION;
			this._newState = this._states[key];
			this._currentState = this._newState;
			this.dispatchEvent( new StateManagerEvent( StateManagerEvent.ON_INTRO_START, false, false, this.currentKey) );
			this._newState.doIntro();
		}
		
		private function changeState():void
		{
			this._status = StateManagerStatus.OUTRO_ACTION;
			this.dispatchEvent( new StateManagerEvent( StateManagerEvent.ON_OUTRO_START, false, false, this.currentKey) );
			this._currentState.doOutro();
		}
		
		private function onIntroComplete( e:StateEvent ):void
		{
			if( _status != StateManagerStatus.INTRO_ACTION )
				throw Error( 'You cant dispatch introComplete from the outro method: ' );
			
			this.dispatchEvent( new StateManagerEvent( StateManagerEvent.ON_INTRO_COMPLETE, false, false, this.currentKey) );
			
			if( this._currentState == this._newState )
			{
				this._currentState.action();
				this._status = StateManagerStatus.STANDBY;
				this.dispatchEvent( new StateManagerEvent( StateManagerEvent.ON_ACTION, false, false, this.currentKey) );
			}else
				this.changeState();
		}
		
		private function onOutroComplete( e:StateEvent ):void
		{
			if( _status != StateManagerStatus.OUTRO_ACTION )
				throw Error( 'You cant dispatch OutroComplete from the intro method: ' );
			
			this.dispatchEvent( new StateManagerEvent( StateManagerEvent.ON_OUTRO_COMPLETE, false, false, this.currentKey) );
			
			this._status = StateManagerStatus.INTRO_ACTION
				
			this._currentState = this._newState;
			
			this.dispatchEvent( new StateManagerEvent( StateManagerEvent.ON_INTRO_START, false, false, this.currentKey) );
			
			this._currentState.doIntro();
		}
		
		private function get currentKey():String
		{
			return this._currentState.statemachine::getKey();
		}
	}
}