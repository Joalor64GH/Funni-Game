package;

import flixel.text.FlxText;
import flixel.FlxState;

/*#if SWF_ALLOWED
import swf.SWF;
#end*/

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		add(new FlxText("XBOX LIVE", 32).screenCenter());
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
