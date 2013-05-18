package entities
{
	import com.saia.starlingPunk.SPMask;
	import com.voltic.starlingpunk.SPAnimatedEntity;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	import com.saia.starlingPunkExamples.embeds.ExampleAssets;
	
	public class BurgerFlag extends SPAnimatedEntity
	{
		public function BurgerFlag(x:Number=0, y:Number=0, type:String="", mask:SPMask=null)
		{
			super(x, y, type, mask);
		}		
		
		/* Normal Overrides
		* ================
		*/
		
		override public function added():void 
		{
			super.added();
		}
		
		override public function removed():void 
		{
			removeChildren(0, -1, true);
			super.removed();
		}
		
		override public function update():void 
		{
			super.update();
			
		}
		
		override protected function setupAnimations():void
		{
			var textureAtlas:TextureAtlas = new TextureAtlas(Texture.fromBitmap(new ExampleAssets.ATLAS_TEXTURE()),
				XML(new ExampleAssets.ATLAS_DATA()));
			
			addFrame(textureAtlas, "burger");
			addFrame(textureAtlas, "goal");
			
			addAnimation("normal", [getFrame("burger"), getFrame("goal")], 7, true);
			
			setAnimation("normal");
		}
	}
}