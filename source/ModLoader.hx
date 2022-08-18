package;

import flixel.FlxG;
import flixel.FlxState;
import Menu.MenuSelection;
import flixel.FlxState;
import flixel.util.FlxColor;
import haxe.Log;
import lime.app.Application;

class ModLoader extends FlxState
{
	var substateColor:FlxColor;

	override public function create()
	{
		substateColor = new FlxColor();

		// Create menu
		Menu.title = "Mod Loader (UNFINISHED)";
		#if !web
		Menu.options = ['Back'];
		#else
		Menu.options = ['Back'];
		#end
		Menu.includeExitBtn = false;
		Menu.callback = (option:MenuSelection) ->
		{
			trace('Epic menu option ${option}');
			// Option check
			switch (option.id)
			{
				case 0:
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