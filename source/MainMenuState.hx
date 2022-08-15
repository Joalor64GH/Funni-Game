package;

import flixel.FlxG;
import flixel.FlxState;
import Menu.MenuSelection;
import flixel.FlxState;
import flixel.util.FlxColor;
import haxe.Log;
import lime.app.Application;

class MainMenuState extends FlxState
{
	var substateColor:FlxColor;

	override public function create()
	{
		substateColor = new FlxColor();

		// Create menu
		Menu.title = "Remind me to come up with a name later";
		#if !web
		Menu.options = ['Play', 'Mods', 'Webm Loader', 'Options', 'Exit'];
		#else
		Menu.options = ['Play', 'Mods', 'Webm Loader', 'Options'];
		#end
		Menu.includeExitBtn = false;
		Menu.callback = (option:MenuSelection) ->
		{
			trace('Epic menu option ${option}');
			// Option check
			switch (option.id)
			{
				case 0:
					trace('Play');
					FlxG.switchState(new PlayState());
				case 1:
					trace('Mods');
				case 2:
					trace('Webm Loader');
					FlxG.switchState(new VideoState());
				case 3:
					trace('Options');
				case 4:
					trace('Exit');
					#if (windows || cpp)
					Sys.exit(0);
					#else
					openfl.system.System.exit(0);
					#end
					#if web
					lime.utils.Log.error('I dunno how you did this but you can\'t use exit button on web idoit');
					#end
				default:
					trace('something is fucked');
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