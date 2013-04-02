package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class InGameAssets
	{
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		
		
		
		
		[Embed(source="../media/parallax/textures.png")]
		public static const AtlasTextureGame:Class;
		
		[Embed(source="../media/parallax/textures.xml",mimeType="application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		[Embed(source="../media/parallax/bgLayer1.png")]
		public static const BgLayer1:Class;
		
		
		
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
				var bitmap:Bitmap = new InGameAssets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
		
	}
}