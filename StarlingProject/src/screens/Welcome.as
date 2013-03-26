package screens
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;

	public class Welcome extends Sprite
	{
		private var bg:Image;
		private var logo:Image;
		private var sun:Image;
		public function Welcome()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		public function onAddedToStage(event:Event):void
		{
			drawScreen();
		}
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("WelcomeBackground"));
			this.addChild(bg);
			
			logo = new Image(Assets.getTexture("WelcomeTownLogo"));
			logo.x = 200
			logo.y = 150
			this.addChild(logo);
			
			sun = new Image(Assets.getTexture("WelcomeSun"));
			sun.x = 100;
			sun.x = 100;
			this.addChild(sun);
			
			
		}
	}
}