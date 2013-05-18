
package {

import flash.display.Sprite;
import starling.core.Starling;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

[SWF(width = "800", height = "600", frameRate = "60", backgroundColor = "#dddddd")]
public class Main extends Sprite {
	private var _starling:Starling;

	public function Main () {
		_starling = new Starling(GameEngine, stage);
		_starling.showStats = true;
		
		_starling.start();
	}
}

}
