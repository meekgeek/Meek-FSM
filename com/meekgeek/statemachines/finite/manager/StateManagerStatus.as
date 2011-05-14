package com.meekgeek.statemachines.finite.manager
{
	public class StateManagerStatus
	{
		public static const OUTRO_ACTION:StateManagerStatus 	= new StateManagerStatus( 0, 'outro_action' );
		public static const INTRO_ACTION:StateManagerStatus 	= new StateManagerStatus( 1, 'intro_action' );
		public static const STANDBY:StateManagerStatus 			= new StateManagerStatus( 2, 'standby' );
		
		public var code:int;
		public var description:String;
		
		public function StateManagerStatus( code:int, description:String )
		{
			this.code = code;
			this.description = description;
		}
	}
}