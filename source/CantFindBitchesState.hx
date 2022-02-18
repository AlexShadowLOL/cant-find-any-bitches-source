package;

import flash.system.System;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class CantFindBitchesState extends FlxState
{
	var idkwhyiaddedthis:Bool = false;
	var canSelect:Bool = false;

	var bg:FlxSprite;
	var bg2:FlxSprite;
	var popup:FlxSprite;
	var reloadButton:FlxSprite;
	var reloadButton2:FlxSprite;
	var reloadingButton:FlxSprite;

	override public function create():Void
	{
		FlxG.mouse.visible = true;

		bg = new FlxSprite();
		bg.loadGraphic('assets/images/bg.png');
		bg.setGraphicSize(FlxG.width, FlxG.height);
		add(bg);

		bg2 = new FlxSprite();
		bg2.loadGraphic('assets/images/bg2.png');
		bg2.setGraphicSize(FlxG.width, FlxG.height);
		bg2.alpha = 0;
		add(bg2);

		popup = new FlxSprite();
		popup.loadGraphic('assets/images/popup.png');
		popup.screenCenter();
		popup.scale.set(0.6, 0.6);
		popup.alpha = 0;
		add(popup);

		reloadButton = new FlxSprite();
		reloadButton.loadGraphic('assets/images/reloadButton.png');
		reloadButton.screenCenter(X);
		reloadButton.y += 400;
		reloadButton.scale.set(0.6, 0.6);
		reloadButton.alpha = 0;
		add(reloadButton);

		reloadButton2 = new FlxSprite();
		reloadButton2.loadGraphic('assets/images/reloadButton2.png');
		reloadButton2.screenCenter(X);
		reloadButton2.y += 400;
		reloadButton2.scale.set(0.6, 0.6);
		reloadButton2.alpha = 0;
		add(reloadButton2);

		reloadingButton = new FlxSprite();
		reloadingButton.loadGraphic('assets/images/reloadingButton.png');
		reloadingButton.screenCenter(X);
		reloadingButton.y += 400;
		reloadingButton.scale.set(0.6, 0.6);
		reloadingButton.visible = false;
		add(reloadingButton);

		popupError();

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (canSelect)
		{
			if (FlxG.mouse.overlaps(reloadButton))
			{
				reloadButton2.alpha = 1;
			}
			else
			{
				reloadButton2.alpha = 0;
			}
		}

		if (canSelect)
		{
			if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(reloadButton2))
			{
				reloadPage();
			}
		}

		if (FlxG.keys.justPressed.ESCAPE)
		{
			System.exit(0);
		}
	}

	// get trolled
	function popupError()
	{
		idkwhyiaddedthis = true;

		new FlxTimer().start(3, function(tmr:FlxTimer)
		{
			FlxTween.tween(FlxG.camera, {zoom: 1.1}, 1, {ease: FlxEase.cubeOut});

			FlxTween.tween(bg2, {alpha: 1}, 0.6);
			FlxTween.tween(popup, {alpha: 1}, 0.6);
			FlxTween.tween(reloadButton, {alpha: 1}, 0.6);

			canSelect = true;
		});
	}

	// eewwwwwww soft errpr
	function popupErrorButSoft()
	{
		reloadButton.alpha = 1;
		reloadButton2.alpha = 1;
		reloadingButton.visible = false;

		canSelect = true;
	}

	// obv goes wrong :troll:
	function reloadPage()
	{
		FlxG.sound.play('assets/sounds/click.ogg');
		canSelect = false;

		reloadButton.alpha = 0;
		reloadButton2.alpha = 0;
		reloadingButton.visible = true;

		new FlxTimer().start(3, function(tmr:FlxTimer)
		{
			popupErrorButSoft();
		});
	}
}
