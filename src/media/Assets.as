package media
{
	public class Assets
	{
		[Embed(source = "/media/spine/greenguy/GreenGuy.xml", mimeType = "application/octet-stream")]
		static public const GreenGuyAtlasXml:Class;
		
		[Embed(source = "/media/spine/greenguy/GreenGuy.png")]
		static public const GreenGuyAtlasTexture:Class;
		
		[Embed(source = "/media/spine/greenguy/GreenGuy.json", mimeType = "application/octet-stream")]
		static public const GreenGuyJson:Class;
		
		[Embed(source = "/media/spine/spineboy/spineboy.xml", mimeType = "application/octet-stream")]
		static public const SpineBoyAtlasXml:Class;
		
		[Embed(source = "/media/spine/spineboy/spineboy.png")]
		static public const SpineBoyAtlasTexture:Class;
		
		[Embed(source = "/media/spine/spineboy/spineboy.json", mimeType = "application/octet-stream")]
		static public const SpineBoyJson:Class;
	}
}