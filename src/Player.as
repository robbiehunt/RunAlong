package  
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source='../assets/jump_noise.mp3')]
		private var SndJump:Class;
		[Embed(source='../assets/slide.mp3')]
		private var SndSlide:Class;
		[Embed(source = '../assets/death.mp3')]
		private var SndDeath:Class;
		
		[Embed(source='../assets/running_strip_hat.png')]
		private var ImgRun:Class;
		
		private var InitHeight:Number;
		private var tempY:Number;
		
		public var jump:Number;
		public var didAction: Boolean = false;
		public var onWall: Boolean = false;
		
		public function Player()
		{
			super(10, 20);
			loadGraphic(ImgRun, true, false, 10, 10, false);
			
			addAnimation("running", [0, 1, 2, 3], 5, true);
			addAnimation("jumping", [4], 0, false);
			addAnimation("sliding", [5], 0, false);
			
			InitHeight = height;
			
			acceleration.y = 1200;
			maxVelocity.y = 200;
		}
		
		override public function update():void
		{
			
			velocity.x = 0;
			x = 10;
			
			if (FlxG.keys.justPressed("X"))
			{
				FlxG.play(SndJump);
			}
			if (FlxG.keys.justPressed("Z"))
			{
				FlxG.play(SndSlide);
			}
			
			//slide
			if ((FlxG.keys.Z) && (didAction == false))
			{
				didAction = true;
				height = InitHeight / 2;
				play("sliding");
			}
			//jump
			else if ((FlxG.keys.X) && (jump >= 0))
			{
				didAction = true;
				
				jump += FlxG.elapsed * 2;
				if (jump > 0.25)
				{
					jump = -1;
				}
				height = InitHeight;
				play("jumping");
			}
			//run
			else
			{
				jump = -1;
				
				if ((didAction == false) && (jump <= 0))
				{
					height = InitHeight;
					play("running");
				}
			}
			
			if (jump > 0)
			{
				if (jump < 0.065)
				{
					velocity.y = -180;
				}
				else
				{
					velocity.y = -maxVelocity.y;
				}
			}
			
			super.update();
			
		}
		
		public override function hitRight(Contact: FlxObject, Velocity:Number):void
		{
			
			if (Contact is Wall)
			{
				this.kill();
				FlxG.play(SndDeath);
				FlxG.quake.start(0.02);
			}
			
			onWall = true;
			super.hitRight(Contact, Velocity);
			
		}
		
	}

}