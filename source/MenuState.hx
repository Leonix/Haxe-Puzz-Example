package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import hud.ScoreBoard;
import puzzlebase.PuzzleRow;
import puzzlebase.PuzzMain;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		// Set a background color
		FlxG.cameras.bgColor = 0xff131c1b;
		// Show the mouse (in case it hasn't been disabled)
		#if !FLX_NO_MOUSE
		FlxG.mouse.visible = true;
		#end
		
		super.create();
		
		Reg.scoreboard = new ScoreBoard();
		
		Reg.puzzleMain = new PuzzMain();
		add(Reg.puzzleMain);		
		
		add(Reg.scoreboard);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed: Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.R)
		{
			FlxG.switchState(new MenuState());
		}
	}	
}