package  
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source = '../assets/pickup.mp3')]
		private var SndPickUp:Class;
		[Embed(source = '../assets/death.mp3')]
		private var SndDeath:Class;
		
		[Embed(source = '../assets/boulder.png')]
		private var _ImgBoulder:Class;
		
		private var _Boulder:FlxSprite;
		private var _rotCount:Number = 0;
		
		private var _Background1:BGTile;
		private var _Background2:BGTile;
		
		private var _Floor1:Floor;
		private var _Floor2:Floor;
		
		private var _player:Player;
		private var _walls:FlxGroup;
		private var _traps:FlxGroup;
		private var _floor:FlxGroup;
		private var _powerup:FlxGroup;
		
		private var _obstalceTimer: Number;
		private var _obstacleInterval: Number = 2.1;
		
		private var _scoreText:FlxText;
		private var _gameOverText:FlxText;
		
		override public function create():void
		{
			bgColor = 0x967F6B;
			
			_Background1 = new BGTile(0, 0, -80);
			add(_Background1);
			
			_Background2 = new BGTile(FlxG.width, 0, -80);
			add(_Background2);
			
			_Floor1 = new Floor(0, 50, -200);
			add(_Floor1);
			
			_Floor2 = new Floor(FlxG.width, 50, -200);
			add(_Floor2);
			
			_floor = new FlxGroup();
			_floor.add(_Floor1);
			_floor.add(_Floor2);
			
			FlxG.score = 0;
			_scoreText = new FlxText(20, 2, 200, "Score: 0");
			_scoreText.setFormat(null, 16, 0x7A604B, "left");
			add(_scoreText);
			
			_gameOverText = new FlxText(0, 0, FlxG.width, " ");
			_gameOverText.setFormat(null, 8, 0xCC9241, "left");
			add(_gameOverText);
			
			
			_walls = new FlxGroup();
			add(_walls);
			
			_traps = new FlxGroup();
			add(_traps);
			
			_powerup = new FlxGroup();
			add(_powerup);
			
			_player = new Player();
			add(_player);
			
			_Boulder = new FlxSprite( -20, 20, _ImgBoulder);
			add(_Boulder);
			
			resetObstacleTimer();
			
			super.create();
			
		}
		
		override public function update():void
		{
			_Boulder.angle++;
			
			FlxU.overlap(_player, _powerup, overlapPlayerPowerUp);
			
			_obstalceTimer -= FlxG.elapsed;
			
			if (!_player.dead)
			{
				FlxG.score += 1;
			}
			
			_scoreText.text = "Score: " + FlxG.score.toString();
			
			if (_obstalceTimer < 0)
			{
				var r : Number = Math.round(Math.random() * 8) + 1;
				
				//r = 5;
				
				//jump, then jump again
				if (r == 1)
				{
					
					createWall(FlxG.width + 100, 30, -200);
					createWall(FlxG.width, 40, -200);
					createWall(FlxG.width + 50, 40, -200);
					
					if ( (Math.round(Math.random() * 5) + 1) == 1 )
					{
						createPowerUp(FlxG.width + 130, 10, -200);
					}
					
					resetObstacleTimer();
				}
				//slide, from the floor
				else if (r == 2)
				{
					createWall(FlxG.width, -4, -200);
					createWall(FlxG.width, 4, -200);
					createWall(FlxG.width, 14, -200);
					createWall(FlxG.width, 24, -200);
					createWall(FlxG.width, 34, -200);
					
					if ( (Math.round(Math.random() * 5) + 1) == 1 )
					{
						createPowerUp(FlxG.width + 100, 24, -200);
					}
					
					resetObstacleTimer();
				}
				//jump and then slide
				else if (r == 3)
				{
					createWall(FlxG.width + 100, -4, -200);
					createWall(FlxG.width + 100, 4, -200);
					createWall(FlxG.width + 100, 14, -200);
					createWall(FlxG.width + 100, 24, -200);
					
					if ( (Math.round(Math.random() * 5) + 1) == 1 )
					{
						createPowerUp(FlxG.width + 120, 40, -200);
					}
					
					createWall(FlxG.width, 40, -200);
					createWall(FlxG.width + 50, 40, -200);
					resetObstacleTimer();
				}
				//slide or jump
				else if (r == 4)
				{
					createWall(FlxG.width, 34, -200);
					createWall(FlxG.width + 50, 24, -200);
					
					if ( (Math.round(Math.random() * 5) + 1) == 1 )
					{
						createPowerUp(FlxG.width + 80, 40, -200);
					}
					if ( (Math.round(Math.random() * 5) + 1) == 1 )
					{
						createPowerUp(FlxG.width + 80, 10, -200);
					}
					
					resetObstacleTimer();
				}
				//jump wall
				else if (r == 5)
				{
					createWall(FlxG.width, 40, -200);
					createWall(FlxG.width, 30, -200);
					
					if ( (Math.round(Math.random() * 5) + 1) == 1 )
					{
						createPowerUp(FlxG.width + 25, 20, -200);
					}
					
					createTrap(FlxG.width + 80, 0, "hangSpike", -200);
					createTrap(FlxG.width + 90, 0, "hangSpike", -200);
					
					if ( (Math.round(Math.random() * 5) + 1) == 1 )
					{
						createTrap(FlxG.width + 100, 0, "hangSpike", -200);
						createTrap(FlxG.width + 110, 0, "hangSpike", -200);
					}
					
					resetObstacleTimer();
				}
				//jump spikes
				else if (r == 6)
				{
					createTrap(FlxG.width, 40, "spikeStrip", -200);
					
					if ( (Math.round(Math.random() * 5) + 1) == 1 )
					{
						createPowerUp(FlxG.width + 75, 40, -200);
					}
					
					createTrap(FlxG.width + 100, 40, "spikeStrip", -200);
					
					resetObstacleTimer();
				}
				//slide spikes
				else if (r == 7)
				{
					createTrap(FlxG.width, 0, "hangSpike", -200);
					createTrap(FlxG.width + 10, 0, "hangSpike", -200);
					createTrap(FlxG.width + 20, 0, "hangSpike", -200);
					
					if ( (Math.round(Math.random() * 5) + 1) == 1 )
					{
						createPowerUp(FlxG.width + 50, 34, -200);
						
						createTrap(FlxG.width + 70, 0, "hangSpike", -200);
						createTrap(FlxG.width + 80, 0, "hangSpike", -200);
						createTrap(FlxG.width + 90, 0, "hangSpike", -200);
					}
					else
					{
						createTrap(FlxG.width + 30, 0, "hangSpike", -200);
						createTrap(FlxG.width + 40, 0, "hangSpike", -200);
						createTrap(FlxG.width + 50, 0, "hangSpike", -200);
					}
					
					resetObstacleTimer();
				}
				//slide then jump
				else if (r == 8)
				{
					createTrap(FlxG.width, 0, "hangSpike", -200);
					createTrap(FlxG.width + 10, 0, "hangSpike", -200);
					createTrap(FlxG.width + 20, 0, "hangSpike", -200);
					createTrap(FlxG.width + 30, 0, "hangSpike", -200);
					
					createTrap(FlxG.width + 80, 40, "spikeStrip", -200);
					
					if ( (Math.round(Math.random() * 5) + 1) == 1 )
					{
						createPowerUp(FlxG.width + 100, 20, -200);
					}
					
					resetObstacleTimer();
				}
				//reverse of 8
				else if (r == 9)
				{
					createTrap(FlxG.width, 40, "spikeStrip", -200);
					
					createTrap(FlxG.width + 85, 0, "hangSpike", -200);
					createTrap(FlxG.width + 95, 0, "hangSpike", -200);
					createTrap(FlxG.width + 105, 0, "hangSpike", -200);
					createTrap(FlxG.width + 115, 0, "hangSpike", -200);
					
					if ( (Math.round(Math.random() * 5) + 1) == 1 )
					{
						createPowerUp(FlxG.width + 65, 40, -200);
					}
					
					resetObstacleTimer();
				}
			}
			
			if (FlxU.overlap(_player, _traps))
			{
				_player.kill();
				FlxG.play(SndDeath);
				FlxG.quake.start(0.02);
			}
			
			if (FlxU.collide(_player, _walls))
			{
				_player.didAction = false;
				_player.jump = 0;
			}
			if (FlxU.collide(_player, _floor))
			{
				_player.didAction = false;
				_player.jump = 0;
			}
			
			if (_player.dead)
			{
				_gameOverText.text = "GAME OVER  SCORE: "+ FlxG.score +"\nPRESS ENTER TO PLAY AGAIN";
				_scoreText.text = " ";
				
				if (FlxG.keys.ENTER)
				{
					FlxG.state = new PlayState();
				}
			}
			
			_player.onWall = false;
			
			super.update();
		}
		
		private function overlapPlayerPowerUp(player: Player, powerup: PowerUp):void
		{
			powerup.kill();
			FlxG.play(SndPickUp);
			FlxG.score += 500;
			_scoreText.text = "Score: " + FlxG.score.toString();
		}
		
		private function createWall(x: Number, y: Number, vel: Number):void
		{
			_walls.add(new Wall(x, y, vel));
		}
		
		private function resetObstacleTimer():void
		{
			
			_obstalceTimer = _obstacleInterval;
			_obstacleInterval *= 0.98;
			if (_obstacleInterval < .97)
			{
				_obstacleInterval = 0.97;
			}
		}
		
		private function createPowerUp(x: Number, y: Number, vel: Number):void
		{
			_powerup.add(new PowerUp(x, y, vel));
		}
		
		private function createTrap(x:Number, y:Number, type:String, vel:Number):void
		{
			_traps.add(new Obstacle(x, y, type, vel));
		}
		
	}

}