package com.meekgeek.statemachines.finite.states
{
	import com.meekgeek.statemachines.finite.events.StateEvent;
	import com.meekgeek.statemachines.finite.interfaces.IState;
	import com.meekgeek.statemachines.finite.statemachine;
	
	import flash.events.EventDispatcher;
	
	public class State extends EventDispatcher implements IState
	{
		private var _status:int;
		private var _key:String;
		
		protected var context:Object;
		
		public function State()
		{
		}
		
		public function doIntro():void
		{
			//override
			this.signalIntroComplete();
		}
		
		public function action():void
		{
			//override
		}
		
		public function doOutro():void
		{
			//override
			this.signalOutroComplete();
		}
		
		protected function signalIntroComplete():void
		{
			this.dispatchEvent( new StateEvent( StateEvent.ON_INTRO_COMPLETE ) );
		}
		
		protected function signalOutroComplete():void
		{
			this.dispatchEvent( new StateEvent( StateEvent.ON_OUTRO_COMPLETE ) );
		}
		
		statemachine function setContext(context:Object):void
		{
			this.context = context;
		}
		
		statemachine function setKey( key:String ):void
		{
			this._key = key;
		}
		
		statemachine function getKey():String
		{
			return this._key;
		}
	}
}