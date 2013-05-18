package entities 
{
	import media.Assets;
	
	import com.saia.starlingPunk.SPEntity;
	import com.saia.starlingPunkExamples.platformer.entities.PlatformerPlayer;
	import com.voltic.starlingpunk.SkeletonSPEntity;
	import com.voltic.starlingpunk.WorldUtil;
	
	public class GreenGuy extends SkeletonSPEntity
	{
		
		private var player:SPEntity;
		
		public function GreenGuy(x:Number=0, y:Number=0)
		{
			super(x, y, "GreenGuy", new Assets.GreenGuyAtlasXml(),
				   					new Assets.GreenGuyAtlasTexture(),
									new Assets.GreenGuyJson());
		}
		
		override public function added():void 
		{
			super.added();
		}
		
		override public function setupAnimations():void
		{
			skeleton.setAnimation("Run", true);
		}
		
		override public function removed():void 
		{
			removeChildren(0, -1, true);
			super.removed();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (player == null)
			{
				var e:Vector.<SPEntity> = WorldUtil.getEntitiesByClass(world, PlatformerPlayer);
				
				if (e.length != 0) player = e[0];
			} else
			{
				x = player.x;
			}
		}
	}
}