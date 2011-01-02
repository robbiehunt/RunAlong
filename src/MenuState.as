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
		
		[Embed(source = '../assets/yes_sound.png')]
		private var ImgSnd:Class;
		[Embed(source = '../assets/no_sound.png')]
		private var ImgMute:Class;
		
		private var PwrUpSprite:FlxSprite;
		private var BtnSprite:FlxSprite;
		private var SpriteMute:FlxSprite;
		private var SpriteSnd:FlxSprite;
		
		private var BlinkTimer:Number = 0;
		private var BlinkInterval:Number = 0.25;
		
		private var BtnSound:FlxButton;
		
		private var title:FlxText;
		private var information:FlxText;
		private var instructions:FlxText;
		private var instructionsBtn:FlxButton;
		
		override public function create():void
		{
			FlxG.mouse.show();
			
			BlinkTimer = BlinkInterval;
			
			bgColor = 0x967F6B;
			
			title = new FlxText(0, 40, FlxG.width, "Run Along, Now");
			title.setFormat(null, 16, 0x7A604B, "center");
			add(title);
			
			
			information = new FlxText(0, 108, 300, "[Z]:Slide [X]:Jump   Collect:       Don't hit the Walls or Spikes!");
			information.setFormat(null, 8, 0xCC9241, "left");
			add(information);
			
			PwrUpSprite = new FlxSprite(135, 110, ImgPwrUp);
			add(PwrUpSprite);
			
			instructions = new FlxText(0, 0, 70, "Click To Play");
			instructions.setFormat(null, 8, 0xCC9241, "center");
			add(instructions);
			
			BtnSprite = new FlxSprite(0, 0, ImgBtn);
			SpriteSnd = new FlxSprite(0, 0, ImgSnd);
			SpriteMute = new FlxSprite(280, 2, ImgMute);
			
			BtnSound = new FlxButton(280, 2, handleSound);
			BtnSound.loadGraphic(SpriteSnd);
			add(BtnSound);
			
			instructionsBtn = new FlxButton(110, 60, playGame);
			instructionsBtn.loadText(instructions);
			instructionsBtn.loadGraphic(BtnSprite);
			instructionsBtn.width = 70;
			instructionsBtn.height = 10
			add(instructionsBtn);
			
		}
		
		override public function update():void
		{
			BlinkTimer -= FlxG.elapsed;
			
			if (BlinkTimer < 0)
			{
				
				if (instructions.color != bgColor)
				{
					instructions.color = bgColor;
					BlinkTimer = BlinkInterval;
				}
				else
				{
					instructions.color = 0xCC9241;
					BlinkTimer = BlinkInterval * 4;
				}
				
			}
			
			if (FlxG.volume == 0.0)
			{
				BtnSound.loadGraphic(SpriteMute);
			}
			else
			{
				BtnSound.loadGraphic(SpriteSnd);
			}
			
			super.update();
		}
		
		private function handleSound():void
		{
			if (FlxG.volume == 0.0)
			{
				FlxG.volume = 1.0;
			}
			else
			{
				FlxG.volume = 0.0;
			}
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