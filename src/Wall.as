package  
{
	import org.flixel.*;
	
	public class Wall extends FlxTileblock
	{
		
		[Embed(source = '../assets/floor.png')]
		private var ImgFloor:Class;
		
		public function Wall(x: Number, y: Number, vel: Number):void 
		{
			super(x, y, 50, 10);
			_tileSize = 10
			loadGraphic(ImgFloor, 0);
			velocity.x = vel;
		}
		
	}

}