package com.meekgeek.statemachines.finite.events
{
	import flash.events.Event;
	
	public class StateEvent extends Event
	{
		public static const ON_INTRO_COMPLETE:String 	= "onIntroComplete";
		public static const ON_OUTRO_COMPLETE:String	= "onOutroComplete";
		
		public function StateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
        	return new StateEvent(type, this.bubbles, this.cancelable);
        }
	}
}