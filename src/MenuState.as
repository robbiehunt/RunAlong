package  
{
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		[Embed(source = '../assets/runner.mp3')]
		private var BgMusRunner:Class;
		
		[Embed(source = '../assets/play_button.png')]
		private var ImgBtn:Class;
		
		[Embed(source = '../assets/powerup_orange.png')]
		private var ImgPwrUp:Class;
		
		private var PwrUpSprite:FlxSprite;
		
		private var BtnSprite:FlxSprite;
		
		private var title:FlxText;
		private var information:FlxText;
		private var instructions:FlxText;
		private var instructionsBtn:FlxButton;
		
		override public function create():void
		{
			FlxG.mouse.show();
			
			bgColor = 0x967F6B;
			
			title = new FlxText(0, 0, FlxG.width, "Run Along, Now");
			title.setFormat(null, 16, 0x7A604B, "center");
			add(title);
			
			
			information = new FlxText(0, 48, 300, "[Z]:Jump [X]:Slide   Collect:       Don't hit the Walls or Spikes!");
			information.setFormat(null, 8, 0xCC9241, "left");
			add(information);
			
			PwrUpSprite = new FlxSprite(135, 50, ImgPwrUp);
			add(PwrUpSprite);
			
			instructions = new FlxText(0, 0, 70, "Click To Play");
			instructions.setFormat(null, 8, 0xCC9241, "center");
			add(instructions);
			
			BtnSprite = new FlxSprite(0, 0, ImgBtn);
			
			instructionsBtn = new FlxButton(110, 20, playGame);
			instructionsBtn.loadText(instructions);
			instructionsBtn.loadGraphic(BtnSprite);
			instructionsBtn.width = 70;
			instructionsBtn.height = 10
			add(instructionsBtn);
			
		}
		
		override public function update():void
		{
			super.update();
		}
		
		private function playGame():void
		{
			FlxG.playMusic(BgMusRunner, 0.1);
			FlxG.state = new PlayState();
		}
		
		public function MenuState() 
		{
			super();
		}
		
	}

}