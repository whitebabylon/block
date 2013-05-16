package
{
	include "aMain_Imports.as"
	public class aMain_setupMaterials
	{
		[Embed(source="/../embeds/blockskin/512/stone3.jpg")]
		public static var TrinketDiffuse:Class;
		
		[Embed(source="/../embeds/blockskin/512/TopRock.jpg")]
		public static var TopRocks:Class;
		
		[Embed(source="/../embeds/blockskin/512/stackedStone.jpg")]
		public static var StackedStone:Class;
		
		[Embed(source="/images/st1.jpg")]
		public static var StackedStone2:Class;
		[Embed(source="/images/st2.jpg")]
		public static var StackedStone3:Class;
		[Embed(source="/images/st3.jpg")]
		public static var StackedStone4:Class;
		[Embed(source="/images/st4.jpg")]
		public static var StackedStone5:Class;
		[Embed(source="/images/st5.jpg")]
		public static var StackedStone6:Class;
		[Embed(source="/images/st6.jpg")]
		public static var StackedStone7:Class;
		
		[Embed(source="/../embeds/trinket_specular3.jpg")]
		public static var TrinketSpecular:Class;
		[Embed(source="/../embeds/trinket_normal3.jpg")]
		public static var TrinketNormals:Class;
		
		private var cubeMaterial:TextureMaterial;
		private var topRockMaterial:TextureMaterial;
		private var stackedStoneMaterial:TextureMaterial;
		private var stackedStoneMaterial2:TextureMaterial;
		private var stackedStoneMaterial3:TextureMaterial;
		private var stackedStoneMaterial4:TextureMaterial;
		private var stackedStoneMaterial5:TextureMaterial;
		private var stackedStoneMaterial6:TextureMaterial;
		private var stackedStoneMaterial7:TextureMaterial;
		public function aMain_setupMaterials()
		{
			init();
		}
		
		private function init():void{
			
			cubeMaterial = new TextureMaterial(Cast.bitmapTexture(TrinketDiffuse));
			//cubeMaterial.specularMap = Cast.bitmapTexture(TrinketSpecular);
			//cubeMaterial.normalMap = Cast.bitmapTexture(TrinketNormals);
			//cubeMaterial.lightPicker = lightPicker;
			cubeMaterial.mipmap = false;
			
			topRockMaterial = new TextureMaterial (Cast.bitmapTexture(TopRocks));
			topRockMaterial.mipmap = false;
			
			stackedStoneMaterial = new TextureMaterial (Cast.bitmapTexture(StackedStone));
			stackedStoneMaterial.mipmap = false;
			
			stackedStoneMaterial2 = new TextureMaterial (Cast.bitmapTexture(StackedStone2));
			stackedStoneMaterial2.mipmap = false;
			
			stackedStoneMaterial3 = new TextureMaterial (Cast.bitmapTexture(StackedStone3));
			stackedStoneMaterial3.mipmap = false;
			
			stackedStoneMaterial4 = new TextureMaterial (Cast.bitmapTexture(StackedStone4));
			stackedStoneMaterial4.mipmap = false;
			
			stackedStoneMaterial5 = new TextureMaterial (Cast.bitmapTexture(StackedStone5));
			stackedStoneMaterial5.mipmap = false;
			
			stackedStoneMaterial6 = new TextureMaterial (Cast.bitmapTexture(StackedStone6));
			stackedStoneMaterial6.mipmap = false;
			
			stackedStoneMaterial7 = new TextureMaterial (Cast.bitmapTexture(StackedStone7));
			stackedStoneMaterial7.mipmap = false;
			
		}
		
		public function return_cubeMaterial():TextureMaterial {
			return cubeMaterial;
		}
		public function return_topRockMaterial():TextureMaterial {
			return topRockMaterial;
		}
		public function return_stackedStoneMaterial():TextureMaterial {
			return stackedStoneMaterial;
		}
		public function return_stackedStoneMaterial2():TextureMaterial {
			return stackedStoneMaterial2;
		}
		public function return_stackedStoneMaterial3():TextureMaterial {
			return stackedStoneMaterial3;
		}
		public function return_stackedStoneMaterial4():TextureMaterial {
			return stackedStoneMaterial4;
		}
		public function return_stackedStoneMaterial5():TextureMaterial {
			return stackedStoneMaterial5;
		}
		public function return_stackedStoneMaterial6():TextureMaterial {
			return stackedStoneMaterial6;
		}
		public function return_stackedStoneMaterial7():TextureMaterial {
			return stackedStoneMaterial7;
		}
	}
}