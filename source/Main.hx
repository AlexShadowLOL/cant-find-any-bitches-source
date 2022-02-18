package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();

		// cant find any bitches
		addChild(new FlxGame(0, 0, CantFindBitchesState));
	}
}
