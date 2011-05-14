package com.meekgeek.statemachines.finite.events
{
	import flash.events.Event;
	
	public class StateManagerEvent extends Event
	{
		public static const ON_ACTION:String			= "onSMActive";
		public static const ON_OUTRO_START:String		= "onSMOutroStart";
		public static const ON_OUTRO_COMPLETE:String	= "onSMOutroComplete";
		public static const ON_INTRO_START:String		= "onSMInterStart";
		public static const ON_INTRO_COMPLETE:String	= "onSMIntroComplete";
		
		public var key:String;
		
		public function StateManagerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, key:String=null)
		{
			super(type, bubbles, cancelable);
			this.key = key;
		}
		
		public override function clone():Event
		{
        	return new StateManagerEvent(type, this.bubbles, this.cancelable, this.key);
        }
	}
}