package; // this state is useless

// how about you import some bitches
import flixel.FlxState;
import flixel.text.FlxText;

// how about you class some bitches
class PlayState extends FlxState
{
	// how about you create some bitches
	override public function create()
	{
		// how about you super some bitches
		super.create();

		// how about you flxtext some bitches
		add(new FlxText("Hello World", 32).screenCenter());
	}

	// how about you update some bitches
	override public function update(elapsed:Float)
	{
		// how about you super some bitches
		super.update(elapsed);
	}
}
