package
{
	import events.NavigationEvent;
	
	import objects.BgLayer;
	
	import screens.InGame;
	import screens.Welcome;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		
		
		private var screenWelcome:Welcome;
		private var screenInGame:InGame;
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
	
		
		private function onAddedToStage(e:Event):void
		{	
			trace("starling framework initialized");
			
			this.addEventListener(events.NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			screenInGame = new InGame();
			screenInGame.disposeTemporarily();
			this.addChild(screenInGame);
			screenWelcome = new Welcome();
			
			this.addChild(screenWelcome);
			
			screenWelcome.initialize();
			
		}
		
		private function onChangeScreen(e:NavigationEvent):void
		{
			switch(e.params.id)
			{
				case "play":
					screenWelcome.disposeTemporarily();
					screenInGame.initialize();
					break;
				
				
			}
		}
			
	}
}