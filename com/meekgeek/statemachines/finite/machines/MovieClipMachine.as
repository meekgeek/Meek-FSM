package com.meekgeek.statemachines.finite.machines
{
	import com.meekgeek.statemachines.finite.events.StateManagerEvent;
	import com.meekgeek.statemachines.finite.manager.StateManager;
	import com.meekgeek.statemachines.finite.states.State;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;

	public class MovieClipMachine extends MovieClip
	{
		private var _manager:StateManager;
		
		public function MovieClipMachine( context:DisplayObject=null )
		{
			super();
			
			this._manager = context==null ? new StateManager( this ) : new StateManager(context);
			
			this._manager.addEventListener( StateManagerEvent.ON_ACTION, onActive);
			this._manager.addEventListener( StateManagerEvent.ON_INTRO_START, onIntroStart);
			this._manager.addEventListener( StateManagerEvent.ON_INTRO_COMPLETE, onOutroComplete);
			this._manager.addEventListener( StateManagerEvent.ON_OUTRO_START, onOutroStart);
			this._manager.addEventListener( StateManagerEvent.ON_OUTRO_COMPLETE, onIntroComplete);
		}
		
		public function addState( key:String, state:State, startState:Boolean=false ):void
		{
			this._manager.addState( key, state, startState )
		}
		
		public function setState( key:String ):void
		{
			this._manager.setState( key );
		}
		
		public function getStateManager():StateManager
		{
			return this._manager;
		}
		
		protected function onActive(e:StateManagerEvent):void{/*override*/}
		protected function onOutroStart(e:StateManagerEvent):void{/*override*/}
		protected function onIntroStart(e:StateManagerEvent):void{/*override*/}
		protected function onOutroComplete(e:StateManagerEvent):void{/*override*/}
		protected function onIntroComplete(e:StateManagerEvent):void{/*override*/}
	}
}