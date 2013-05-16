package
{
	include "aMain_Imports.as"
	public class aMain_setupPlayer
	{
		private var playerMesh:Mesh = null;
		public function aMain_setupPlayer()
		{
			init();
		}
		private function init():void{
			createPlayer();
		}
		private function createPlayer():void{
			playerMesh = new Mesh(new CubeGeometry(200, 200, 200, 1, 1, 1, false), null);
		}
		public function returnPlayer():Mesh{
			return playerMesh;
		}
	}
}