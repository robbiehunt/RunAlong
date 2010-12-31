package  
{
	import org.flixel.*;
	
	public class PauseScreen extends FlxGroup
	{
		[Embed(source = '../assets/key_x.png')]
		private var ImgKeyX:Class;
		[Embed(source = '../assets/key_z.png')]
		private var ImgKeyZ:Class;
		[Embed(source = '../assets/powerup_orange.png')]
		private var ImgPowerup:Class;
		
		public function PauseScreen(){
			super();
			scrollFactor.x = 0;
			scrollFactor.y = 0;
			var w:uint = 80;
			var h:uint = 22;
			x = (FlxG.width-w)/2;
			y = (FlxG.height-h)/2;
			
			add((new FlxSprite()).createGraphic(w,h,0xaa000000,true),true);			
			//(add(new FlxText(0,0,w,"this game is"),true) as FlxText).alignment = "center";
			add((new FlxText(0,0,w,"PAUSED")).setFormat(null,16,0xffffff,"center"),true);
			/*add(new FlxSprite(4,36,ImgKeyZ),true);
			add(new FlxText(16,36,w-16,"Jump"),true);
			add(new FlxSprite(4,50,ImgKeyX),true);
			add(new FlxText(16,50,w-16,"Slide"),true);*/
		}
		
	}

}