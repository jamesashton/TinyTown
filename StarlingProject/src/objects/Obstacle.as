package objects
{
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Obstacle extends Sprite
	{
		private var _type:int;
		private var _speed:int;
		private var _distance:int;
		private var _watchOut:Boolean;
		private var _alreadyHit:Boolean;
		private var _position:String;
		private var obstacleImage:Image;
		private var obstacleCrashImage:Image;
		private var obstacleAnimation:MovieClip;
		private var watchOutAnimation:MovieClip;
		
		
		public function Obstacle(_type:int, _distance:int, _watchOut:Boolean, _speed:int)
		{
			super();
			this._type = _type;
			this._distance= _distance; 
			this._watchOut = _watchOut;
			this._speed = _speed;
			
			_alreadyHit = false;
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			createObstacleArt();
			createObstacleCrashArt();
		}
		
		public function get distance():int
		{
			return _distance;
		}

		public function set distance(value:int):void
		{
			_distance = value;
		}

		public function get speed():int
		{
			return _speed;
		}

		public function set speed(value:int):void
		{
			_speed = value;
		}

		public function get position():String
		{
			return _position;
		}

		public function set position(value:String):void
		{
			_position = value;
		}

		public function get alreadyHit():Boolean
		{
			return _alreadyHit;
		}

		public function set alreadyHit(value:Boolean):void
		{
			_alreadyHit = value;
			if(value)
			{
				obstacleCrashImage.visible = true;
				if(_type==4) obstacleAnimation.visible = false;
				else obstacleImage.visible = false;
					
			}
		}

		public function get watchOut():Boolean
		{
			return _watchOut;
		}

		public function set watchOut(value:Boolean):void
		{
			_watchOut = value;
			
		}

		private function onAddedToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function createObstacleArt():void
		{
			//if(_type == 4)
			//{
				obstacleAnimation = new MovieClip(InGameAssets.getObstacleAtlas().getTextures("SmallFiat500"),12);
				
				Starling.juggler.add(obstacleAnimation);
				obstacleAnimation.x = 0;
				obstacleAnimation.y = 0;
				this.addChild(obstacleAnimation);
			//}
			//else
			//{
			//	obstacleImage = new Image(InGameAssets.getObstacleAtlas().getTexture("SmallFiat5000000"));
			//	obstacleImage.x = 0;
			//	obstacleImage.y = 0;
			//	this.addChild(obstacleImage);
			//}
				
		}
		private function createObstacleCrashArt():void
		{
			obstacleCrashImage = new Image(InGameAssets.getTexture("ObstacleCrashImage"));// new Image(InGameAssets.getObstacleAtlas().getTexture("SmallFiat500Crash0000"));
			obstacleCrashImage.visible = false;
			this.addChild(obstacleCrashImage);
		}
	}
}