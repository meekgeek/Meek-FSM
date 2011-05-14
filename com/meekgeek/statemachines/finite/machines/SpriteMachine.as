package com.meekgeek.statemachines.finite.machines
{
	import com.meekgeek.statemachines.finite.manager.StateManager;
	import com.meekgeek.statemachines.finite.states.State;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class SpriteMachine extends Sprite
	{
		private var _manager:StateManager;
		
		public function SpriteMachine( context:DisplayObject=null )
		{
			super();
			
			this._manager = context==null ? new StateManager( this ) : new StateManager(context);
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
	}
}