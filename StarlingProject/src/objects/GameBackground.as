package objects
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class GameBackground extends Sprite
	{
		private var bgLayer1:BgLayer;
		private var bgLayer2:BgLayer;
		private var bgLayer3:BgLayer;
		private var bgLayer4:BgLayer;
		private var bgLayer5:BgLayer;
		private var bgLayer6:BgLayer;
		
		private var _speed:Number = 0;
		
		public function GameBackground()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function get speed():Number
		{
			return _speed;
		}

		public function set speed(value:Number):void
		{
			_speed = value;
		}

		private function onAddedToStage(e:Event):void
		{	
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
			bgLayer1 = new BgLayer(1);
			bgLayer1.parallax = 1;
			this.addChild(bgLayer1);
			
			bgLayer2 = new BgLayer(2);
			bgLayer2.parallax = 1.2;
			this.addChild(bgLayer2);
			
			bgLayer3 = new BgLayer(3);
			bgLayer3.parallax = 1.4;
			this.addChild(bgLayer3);
			
			bgLayer4 = new BgLayer(4);
			bgLayer4.parallax = 5;
			this.addChild(bgLayer4);
			
			bgLayer5 = new BgLayer(5);
			bgLayer5.parallax = 15;
			this.addChild(bgLayer5);
			
			bgLayer6 = new BgLayer(6);
			bgLayer6.parallax = 15;
			this.addChild(bgLayer6);
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void
		{
			bgLayer6.x -=/*Math.ceil(*/_speed * bgLayer6.parallax/*)*/;
			bgLayer6.y = stage.stageHeight - bgLayer6.height;
			if(bgLayer6.x < -(bgLayer6.width / 2) /*-stage.stageWidth*/) bgLayer6.x = 0;
			
			bgLayer5.x -= /*Math.ceil(*/_speed * bgLayer5.parallax/*)*/;
			bgLayer5.y = bgLayer6.y - bgLayer5.height;
			if(bgLayer5.x < -(bgLayer5.width / 2)/*-stage.stageWidth*/) bgLayer5.x = 0;
			
			bgLayer4.x -= /*Math.ceil(*/_speed * bgLayer4.parallax/*)*/;
			bgLayer4.y = bgLayer5.y - bgLayer4.height;
			if(bgLayer4.x < -(bgLayer4.width / 2)/*-stage.stageWidth*/) bgLayer4.x = 0;
			
			bgLayer3.x -= /*Math.ceil(*/_speed * bgLayer3.parallax/*)*/;
			bgLayer3.y = 0;
			if(bgLayer3.x < -(bgLayer3.width / 2)/*stage.stageWidth*/) bgLayer3.x = 0;
			
			bgLayer2.x -= /*Math.ceil(*/_speed * bgLayer2.parallax/*)*/;
			bgLayer2.y = 0;
			if(bgLayer2.x < -(bgLayer2.width / 2)/*stage.stageWidth*/) bgLayer2.x = 0;
			
			bgLayer1.x -= /*Math.ceil(*/_speed * bgLayer1.parallax/*)*/;
			bgLayer1.y = 0;
			if(bgLayer1.x < -(bgLayer1.width / 2)) bgLayer1.x = 0;
			
		}
	}
}