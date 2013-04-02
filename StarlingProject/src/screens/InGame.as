package screens
{
	import objects.GameBackground;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class InGame extends Sprite
	{
		private var bg:GameBackground;
		private var hero:Hero;
		//private var parallaxImages:Array = new Array();
		public function InGame()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			drawGame();
		}
		
		private function drawGame():void
		{
			
			bg = new GameBackground();
			
			bg.speed = 0.05;
			this.addChild(bg);
			
			hero = new Hero();
			hero.x = 100;
			hero.y = stage.stageHeight - 160;
			this.addChild(hero);		
		}
		
		public function disposeTemporarily():void
		{	
			this.visible = false;
		}
		public function initialize():void
		{
			this.visible = true;
		}
	}
}