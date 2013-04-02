package screens
{
	
	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Hero extends Sprite
	{
		private var heroArt:MovieClip;
		public function Hero()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:starling.events.Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createHeroArt();
		}
		
		private function createHeroArt():void
		{
			heroArt = new MovieClip(WelcomeScreenAssets.getAtlas().getTextures("walkingMan"),20);
			heroArt.x = Math.ceil(-heroArt.width /2);
			heroArt.y = Math.ceil(-heroArt.height/2);
			starling.core.Starling.juggler.add(heroArt);
			this.addChild(heroArt);
		}
	}
}