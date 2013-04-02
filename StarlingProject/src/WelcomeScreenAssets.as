package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class WelcomeScreenAssets
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
		private static var gameTextureAtlas:TextureAtlas;
		
		[Embed(source="../media/walkingMan/WalkingMan.png")]
		public static const AtlasTextureGame:Class;
		
		[Embed(source="../media/walkingMan/WalkingMan.xml",mimeType="application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		public static function getAtlas():TextureAtlas
		{
			if(gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML = XML(new AtlasXmlGame());
				gameTextureAtlas = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas;
			
		}
		public static function getTexture(name:String):Texture
		{
			if(gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new WelcomeScreenAssets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
		
	}
}