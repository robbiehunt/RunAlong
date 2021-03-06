package  
{
	import org.flixel.*;
	
	public class PowerUp extends FlxSprite
	{
		
		[Embed(source = '../assets/powerup_orange.png')]
		private var ImgOrange:Class;
		
		public function PowerUp(x: Number, y: Number, vel: Number) 
		{
			super(x, y, ImgOrange);
			velocity.x = vel;
		}
		
		override public function update():void
		{
			var screenXPos:Number = getScreenXY().x;
			if (screenXPos < 0)
			{
			}
			super.update();
		}
		
	}

}