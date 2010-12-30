package  
{
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		[Embed(source = '../assets/runner.mp3')]
		private var BgMusRunner:Class;
		
		override public function create():void
		{
			bgColor = 0x967F6B;
			
			var title:FlxText;
			title = new FlxText(0, 0, FlxG.width, "Run Along, Now");
			title.setFormat(null, 16, 0x7A604B, "center");
			add(title);
			
			var information:FlxText;
			information = new FlxText(205, 30, 200, "Z: Jump\nX: Slide\nDon't hit the walls!");
			information.setFormat(null, 8, 0xCC9241, "left");
			add(information);
			
			var instructions:FlxText;
			instructions = new FlxText(0, 20, FlxG.width, "Press SPACE to play");
			instructions.setFormat(null, 8, 0xCC9241, "center");
			add(instructions);
		}
		
		override public function update():void
		{
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.playMusic(BgMusRunner, 0.1);
				FlxG.state = new PlayState();
			}
		}
		
		public function MenuState() 
		{
			super();
		}
		
	}

}