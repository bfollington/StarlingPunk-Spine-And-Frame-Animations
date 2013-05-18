package com.saia.starlingPunkExamples.platformer.worlds 
{
	import com.saia.starlingPunkExamples.embeds.ExampleAssets;
	import com.voltic.starlingpunk.SPAnimatedEntity;
	
	import entities.GreenGuy;
	import entities.SpineBoy;
	import entities.BurgerFlag;
	
	import media.Assets;
	
	import spine.atlas.Atlas;
	
	/**
	 * ...
	 * @author Andy Saia
	 */
	public class PlatformerLevelOne extends PlatformerWorld 
	{

		override public function begin():void 
		{
			super.begin();
			loadLevel(ExampleAssets.LEVEL01);
			
			var greenGuy:GreenGuy = new GreenGuy(128, 128);
			greenGuy.layer = 3;
			add(greenGuy);
			
			var spineBoy:SpineBoy = new SpineBoy(400, 450);
			spineBoy.layer = 3;
			add(spineBoy);
			
			var anim:BurgerFlag = new BurgerFlag(500, 500);
			anim.layer = 3;
			add(anim);
			
		}
	}

}