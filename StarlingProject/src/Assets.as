package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;

	public class Assets
	{
		[Embed("../media/welcomeimages/Background.png")]
		public static const WelcomeBackground:Class;
		
		[Embed("../media/welcomeimages/SignPost.png")]
		public static const WelcomePlayButton:Class;
		
		[Embed("../media/welcomeimages/Sun.png")]
		public static const WelcomeSun:Class;
		
		[Embed("../media/welcomeimages/TownLogo.png")]
		public static const WelcomeTownLogo:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static function getTexture(name:String):Texture
		{
			if(gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
		
	}
}