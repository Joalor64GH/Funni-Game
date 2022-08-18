package;

import flixel.FlxG;
import flixel.FlxState;
import Menu.MenuSelection;
import flixel.FlxState;
import flixel.util.FlxColor;
import haxe.Log;
import lime.app.Application;

class OptionsState extends FlxState
{
	var substateColor:FlxColor;

	override public function create()
	{
		substateColor = new FlxColor();

		// Create menu
		Menu.title = "Options Menu";
		#if !web
		Menu.options = ['Webm Loader', 'Back'];
		#else
		Menu.options = ['Webm Loader', 'Back'];
		#end
		Menu.includeExitBtn = false;
		Menu.callback = (option:MenuSelection) ->
		{
			trace('Epic menu option ${option}');
			// Option check
			switch (option.id)
			{
				case 0:
					trace('Webm Loader');
					FlxG.switchState(new VideoState());
				case 1:
					trace('Back');
                    FlxG.switchState(new MainMenuState());
			}
		}
		// Open menu
		FlxG.switchState(new Menu(substateColor.setRGB(0, 0, 0, 125)));

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}