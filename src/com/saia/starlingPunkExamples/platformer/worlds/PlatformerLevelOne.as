package com.saia.starlingPunkExamples.platformer.worlds 
{
	import media.Assets;
	
	import com.saia.starlingPunkExamples.embeds.ExampleAssets;
	
	import spine.atlas.Atlas;
	import entities.GreenGuy;
	import entities.SpineBoy;
	
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
			
		}
	}

}