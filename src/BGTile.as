package  
{
	import org.flixel.*;
	
	public class BGTile extends FlxSprite
	{
		[Embed(source = '../assets/bg.png')]
		private var _ImgBG:Class;
		
		public function BGTile(x: Number, y:Number, vel:Number)
		{
			super(x, y, _ImgBG);
			velocity.x = vel;
		}
		
		override public function update():void
		{
			super.update();
			
			var screenXPos:Number = getScreenXY().x;
			
			if (screenXPos > FlxG.width)
			{
				x -= FlxG.width * 2;
			}
			else if (screenXPos < ( -FlxG.width))
			{
				x += FlxG.width * 2;
			}
		}
		
	}

}