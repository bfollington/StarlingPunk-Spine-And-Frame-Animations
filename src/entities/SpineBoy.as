package entities 
{
	import com.saia.starlingPunk.SPEntity;
	import com.saia.starlingPunk.utils.Key;
	import com.saia.starlingPunk.utils.SPInput;
	import com.saia.starlingPunkExamples.platformer.entities.PlatformerPlayer;
	import com.voltic.starlingpunk.SkeletonSPEntity;
	import com.voltic.starlingpunk.WorldUtil;
	
	import media.Assets;
	
	import spine.AnimationStateData;
	
	public class SpineBoy extends SkeletonSPEntity
	{
		
		public function SpineBoy(x:Number=0, y:Number=0)
		{
			super(x, y, "SpineBoy", new Assets.SpineBoyAtlasXml(),
				new Assets.SpineBoyAtlasTexture(),
				new Assets.SpineBoyJson());
		}
		
		override public function added():void 
		{
			super.added();
			
			SPInput.define("jump", [Key.A]);
		}
		
		override public function removed():void 
		{
			removeChildren(0, -1, true);
			super.removed();
		}
		
		override public function update():void 
		{ 
			super.update();
			
			if (SPInput.pressed("jump"))
			{
					skeleton.setAnimation("jump", false);
					skeleton.addAnimation("walk", true);
			}
			
		}
		
		override public function setupMixing(stateData:AnimationStateData):void
		{
			stateData.setMixByName("walk", "jump", 0.2);
			stateData.setMixByName("jump", "walk", 0.4);
			stateData.setMixByName("jump", "jump", 0.2);
		}
		
		override public function setupAnimations():void
		{
			skeleton.setAnimation("walk", true);
			skeleton.addAnimation("jump", false, 3);
			skeleton.addAnimation("walk", true);
		}
		

	}
}