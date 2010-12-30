package  
{
	import org.flixel.*;
	
	public class Obstacle extends FlxSprite
	{
		[Embed(source = '../assets/spikes.png')]
		private var ImgSpikeStrip: Class;
		
		[Embed(source = '../assets/topspike.png')]
		private var ImgHangSpike: Class;
		
		private var ObImg: Class;
		private var _type:String;
		
		public function Obstacle(x:Number, y:Number, type:String, vel:Number) 
		{
			switch (type)
			{
				case "spikeStrip":
					ObImg = ImgSpikeStrip;
				break;
				case "hangSpike":
					ObImg = ImgHangSpike;
				break;
			}
			super(x, y, ObImg);
			_type = type;
			velocity.x = vel;
		}
		
		override public function update():void
		{
			super.update();
			
			if ((x <= 50) && (_type == "hangSpike"))
			{
				velocity.y = 140;
			}
		}
		
	}

}