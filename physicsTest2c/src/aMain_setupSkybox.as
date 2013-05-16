package
{
	//import away3d.materials.BitmapMaterial;
	import away3d.materials.*;
	import away3d.materials.ColorMaterial;
	import away3d.materials.MaterialBase;
	import away3d.materials.SegmentMaterial;
	import away3d.materials.SkyBoxMaterial;
	import away3d.materials.TextureMaterial;
	import away3d.primitives.SkyBox;
	import away3d.textures.*;
	import away3d.textures.BitmapTexture;
	import away3d.textures.CubeTextureBase;
	public class aMain_setupSkybox
	{
		/*********************************************************************************
		 * 									skybox vars
		 ********************************************************************************/
		//[Embed(source="images/posx.jpg")]
		[Embed(source="images/blu.gif")]
		private var EnvPosX:Class;
		
		//[Embed(source="images/posy.jpg")]
		[Embed(source="images/blu.gif")]
		private var EnvPosY:Class;
		
		//[Embed(source="images/negz.jpg")]
		[Embed(source="images/blu.gif")]
		private var EnvPosZ:Class;
		
		//[Embed(source="images/negx.jpg")]
		[Embed(source="images/blu.gif")]
		private var EnvNegX:Class;
		
		//[Embed(source="images/negy.jpg")]
		[Embed(source="images/blu.gif")]
		private var EnvNegY:Class;
		
		//[Embed(source="images/posz.jpg")]
		[Embed(source="images/blu.gif")]
		private var EnvNegZ:Class;
		

		[Embed(source="images/blu.gif")]
		private var EnvPosX1:Class;
		[Embed(source="images/blu.gif")]
		private var EnvPosY1:Class;
		[Embed(source="images/blu.gif")]
		private var EnvPosZ1:Class;
		[Embed(source="images/blu.gif")]
		private var EnvNegX1:Class;
		[Embed(source="images/blu.gif")]
		private var EnvNegY1:Class;
		[Embed(source="images/blu.gif")]
		private var EnvNegZ1:Class;
		
		[Embed(source="images/blu2.gif")]
		private var EnvPosX2:Class;
		[Embed(source="images/blu2.gif")]
		private var EnvPosY2:Class;
		[Embed(source="images/blu2.gif")]
		private var EnvPosZ2:Class;
		[Embed(source="images/blu2.gif")]
		private var EnvNegX2:Class;
		[Embed(source="images/blu2.gif")]
		private var EnvNegY2:Class;
		[Embed(source="images/blu2.gif")]
		private var EnvNegZ2:Class;
		
		[Embed(source="images/blu3.gif")]
		private var EnvPosX3:Class;
		[Embed(source="images/blu3.gif")]
		private var EnvPosY3:Class;
		[Embed(source="images/blu3.gif")]
		private var EnvPosZ3:Class;
		[Embed(source="images/blu3.gif")]
		private var EnvNegX3:Class;
		[Embed(source="images/blu3.gif")]
		private var EnvNegY3:Class;
		[Embed(source="images/blu3.gif")]
		private var EnvNegZ3:Class;
		
		[Embed(source="images/blu4.gif")]
		private var EnvPosX4:Class;
		[Embed(source="images/blu4.gif")]
		private var EnvPosY4:Class;
		[Embed(source="images/blu4.gif")]
		private var EnvPosZ4:Class;
		[Embed(source="images/blu4.gif")]
		private var EnvNegX4:Class;
		[Embed(source="images/blu4.gif")]
		private var EnvNegY4:Class;
		[Embed(source="images/blu4.gif")]
		private var EnvNegZ4:Class;
		
		[Embed(source="images/blu5.gif")]
		private var EnvPosX5:Class;
		[Embed(source="images/blu5.gif")]
		private var EnvPosY5:Class;
		[Embed(source="images/blu5.gif")]
		private var EnvPosZ5:Class;
		[Embed(source="images/blu5.gif")]
		private var EnvNegX5:Class;
		[Embed(source="images/blu5.gif")]
		private var EnvNegY5:Class;
		[Embed(source="images/blu5.gif")]
		private var EnvNegZ5:Class;
		
		[Embed(source="images/blu6.gif")]
		private var EnvPosX6:Class;
		[Embed(source="images/blu6.gif")]
		private var EnvPosY6:Class;
		[Embed(source="images/blu6.gif")]
		private var EnvPosZ6:Class;
		[Embed(source="images/blu6.gif")]
		private var EnvNegX6:Class;
		[Embed(source="images/blu6.gif")]
		private var EnvNegY6:Class;
		[Embed(source="images/blu6.gif")]
		private var EnvNegZ6:Class;
		
		
		private var _skyBox:SkyBox; 
		private var _skyBox2:SkyBox; 
		private var _skyBox3:SkyBox; 
		private var _skyBox4:SkyBox; 
		private var _skyBox5:SkyBox; 
		private var _skyBox6:SkyBox; 
		
		private var cubeTexture:BitmapCubeTexture
		private var cubeTexture2:BitmapCubeTexture
		private var cubeTexture3:BitmapCubeTexture
		private var cubeTexture4:BitmapCubeTexture
		private var cubeTexture5:BitmapCubeTexture
		private var cubeTexture6:BitmapCubeTexture
		public function aMain_setupSkybox()
		{
			create_sky_box();
		}
		
		private function create_sky_box():void{
			
			
			// Setup a cube map for the skybox to use
			cubeTexture = new BitmapCubeTexture(
				new EnvPosX().bitmapData, new EnvNegX().bitmapData,
				new EnvPosY().bitmapData, new EnvNegY().bitmapData,
				new EnvPosZ().bitmapData, new EnvNegZ().bitmapData
			);
			
			cubeTexture2 = new BitmapCubeTexture(
				new EnvPosX2().bitmapData, new EnvNegX2().bitmapData,
				new EnvPosY2().bitmapData, new EnvNegY2().bitmapData,
				new EnvPosZ2().bitmapData, new EnvNegZ2().bitmapData
			);
			
			cubeTexture3 = new BitmapCubeTexture(
				new EnvPosX3().bitmapData, new EnvNegX3().bitmapData,
				new EnvPosY3().bitmapData, new EnvNegY3().bitmapData,
				new EnvPosZ3().bitmapData, new EnvNegZ3().bitmapData
			);
			
			cubeTexture4 = new BitmapCubeTexture(
				new EnvPosX4().bitmapData, new EnvNegX4().bitmapData,
				new EnvPosY4().bitmapData, new EnvNegY4().bitmapData,
				new EnvPosZ4().bitmapData, new EnvNegZ4().bitmapData
			);
			
			cubeTexture5 = new BitmapCubeTexture(
				new EnvPosX5().bitmapData, new EnvNegX5().bitmapData,
				new EnvPosY5().bitmapData, new EnvNegY5().bitmapData,
				new EnvPosZ5().bitmapData, new EnvNegZ5().bitmapData
			);
			
			cubeTexture6 = new BitmapCubeTexture(
				new EnvPosX6().bitmapData, new EnvNegX6().bitmapData,
				new EnvPosY6().bitmapData, new EnvNegY6().bitmapData,
				new EnvPosZ6().bitmapData, new EnvNegZ6().bitmapData
			);
			
			
			_skyBox = new SkyBox(cubeTexture);
			_skyBox2 = new SkyBox(cubeTexture2);
			_skyBox3 = new SkyBox(cubeTexture3);
			_skyBox4 = new SkyBox(cubeTexture4);
			_skyBox5 = new SkyBox(cubeTexture5);
			_skyBox6 = new SkyBox(cubeTexture6);
			
			
			EnvPosZ = null;
			EnvPosY = null;
			EnvPosX = null;
			EnvNegX = null;
			EnvNegY = null;
			EnvNegZ = null;
			
			cubeTexture= null
		}
		
		public function returnSkyBox():SkyBox{
			return _skyBox;	
		}
		public function returnSkyBox2():SkyBox{
			return _skyBox2;	
		}
		public function returnSkyBox3():SkyBox{
			return _skyBox3;	
		}
		public function returnSkyBox4():SkyBox{
			return _skyBox4;	
		}
		public function returnSkyBox5():SkyBox{
			return _skyBox5;	
		}
		public function returnSkyBox6():SkyBox{
			return _skyBox6;	
		}
		
		public function returnTexture(num:int):BitmapCubeTexture {
			if (num == 1)
			return cubeTexture;
			if (num == 2)
				return cubeTexture2;
			if (num == 3)
				return cubeTexture3;
			if (num == 4)
				return cubeTexture4;
			if (num == 5)
				return cubeTexture5;
			if (num == 6)
				return cubeTexture6;
			
			return cubeTexture;
		}
		
		
		
	}
}