package;

import massive.munit.Assert;

import flixel.FlxGame;
import flixel.FlxG;

import flash.events.Event;

class FlxGTest 
{
	private var game:FlxGame;
	
	public function new() {}
	
	@Before
	public function setup():Void
	{
		game = new FlxGame(640, 480, TestState, 1, 60, 60);
		game.dispatchEvent(new flash.events.Event(Event.ADDED_TO_STAGE));
	}
	
	@Test
	public function testFlxGDimensions():Void
	{
		Assert.isTrue(FlxG.width == 640);
		Assert.isFalse(FlxG.width == 480);

		Assert.isTrue(FlxG.height == 480);
		Assert.isFalse(FlxG.height == 640);
	}

	@Test
	public function testFlxCamera():Void
	{
		Assert.isTrue(FlxG.camera != null);

		Assert.isTrue(FlxG.cameras.bgColor == 0xff131c1b);

		Assert.isTrue(FlxG.camera.zoom == 1);

		Assert.isTrue(FlxG.cameras.list.length == 1);
		
		var camera = new flixel.FlxCamera();
		FlxG.cameras.add(camera);

		Assert.isTrue(FlxG.cameras.list.length == 2);

		FlxG.cameras.remove(camera);

		Assert.isTrue(FlxG.cameras.list.length == 1);

		Assert.isTrue(FlxG.cameras.bgColor == 0xff131c1b);
	}

}