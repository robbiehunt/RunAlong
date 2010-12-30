package  
{
	import org.flixel.*;
	
	public class Floor extends FlxTileblock
	{
		
		[Embed(source = '../assets/floor.png')]
		private var ImgFloor:Class;
		
		public function Floor(x: Number, y: Number, vel: Number):void 
		{
			super(x, y, FlxG.width, 10); 
			loadGraphic(ImgFloor, 0);
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