package screens
{
	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;

	public class Welcome extends Sprite
	{
		private var bg:Image;
		private var logo:Image;
		private var sun:Image;
		private var sign:Button;
		var signPositionX:Number;
		
		
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
			logo.x = this.width-logo.width +20;
			logo.y = 200
			this.addChild(logo);
			
			sun = new Image(Assets.getTexture("WelcomeSun"));
			sun.y = 0;
			sun.x = 0;
			this.addChild(sun);
			
			sign = new Button(Assets.getTexture("WelcomePlayButton"));
			sign.y=this.height-sign.height-40;
			sign.x=20;
			this.addChild(sign);
			
			this.addEventListener(Event.TRIGGERED, onMainMenuClick);
		}
		
		
		public function initialize():void
		{
			signPositionX = sign.x;
			
			this.visible = true;		
			this.addEventListener(Event.ENTER_FRAME, signAnimation)
			
		}
		private function signAnimation(e:Event):void
		{
			sign.x = signPositionX + (Math.cos(new Date().getTime() * 0.003) * 5);
			
		}
		public function onMainMenuClick(e:Event):void
		{
			var buttonClicked:Button = e.target as Button;
			if((e.target as Button) == sign)
			{
				this.dispatchEvent( new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true) );
			}
		}
		public function disposeTemporarily():void
		{
			this.visible = false;	
			if(this.hasEventListener(Event.ENTER_FRAME)) this.removeEventListener(Event.ENTER_FRAME, signAnimation);
			
		}
		
	}
}