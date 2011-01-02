package 
{
	import flash.net.SharedObject;
	import org.flixel.*;
	
	[SWF(width="600", height="240", backgroundColor="#967F6B")]
    [Frame(factoryClass = "Preloader")]
	
	public class Main extends FlxGame
	{
		
		public function Main():void 
		{
			super(300, 120, MenuState, 2);
			this.pause = new PauseScreen();
		}
		
	}
	
}