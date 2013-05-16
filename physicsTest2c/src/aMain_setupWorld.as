package
{
	include "aMain_Imports.as"
	
	public class aMain_setupWorld
	{
		[Embed(source="../embeds/blockskin/8/stone3.jpg")]
		private var Grass : Class;

		[Embed(source="../embeds/Heightmap.jpg")]
		private var HeightMap : Class;

		private var _terrainMethod : TerrainDiffuseMethod;
		private var terrain : AWPTerrain ;
		private var FinalMesh : Mesh;
		
		private var _light : PointLight//DirectionalLight;
		private var _lightPicker : StaticLightPicker;
		
		private var worldArray:Array = new Array();
		private var topBlockType:Array = new Array();
		private var topBlockHeight:Array = new Array();
		
		public var counting:int = 0;
		private var cubeMaterial:TextureMaterial;
		private var returnMesh:Mesh = null;
		
		public var myCube:Mesh = null;
		public function aMain_setupWorld(cubeM:TextureMaterial):void
		{
			startTerrain();
			createArray();
			createWorld();
			cubeMaterial = cubeM;
		}
		
		private function startTerrain():void{
			_terrainMethod = new TerrainDiffuseMethod([new BitmapTexture(new Grass().bitmapData), new BitmapTexture(new Grass().bitmapData), new BitmapTexture(new Grass().bitmapData)], new BitmapTexture(new Grass().bitmapData), [1, 50, 150, 100]);
			
			var bmaterial : TextureMaterial = new TextureMaterial(new BitmapTexture(new Grass().bitmapData));
			bmaterial.diffuseMethod = _terrainMethod;
			bmaterial.normalMap = new BitmapTexture(new Grass().bitmapData);
			bmaterial.ambientColor = 0x202030;
			bmaterial.specular = .2;
			
			
			var terrainBMD : Bitmap = new HeightMap();
			terrain = new AWPTerrain(bmaterial, terrainBMD.bitmapData, 1500, 15*15, 1500, 5, 5, (1280*15), 0, false);
			
			terrain.position = new Vector3D(0, -50, 0);
		}
		
		private function createArray():void{
			var x:int = 0;
			var y:int = 0;
			var z:int = 0;
			
			for (x = 0; x < 169; x++){
				worldArray[x] = new Array(169);
				topBlockType[x] = new Array(169);
				topBlockHeight[x] = new Array(169);
			}
			
			for (x = 0; x < 169; x++)
				for (y = 0; y < 169; y++){
					worldArray[x][y] = new Array(169);
					topBlockType[x][y] = new Array(169);
					topBlockHeight[x][y] = new Array(169);
				}
			
			for (x = 0; x < 169; x++)
				for (y = 0; y < 169; y++)
					for (z = 0; z < 169; z++){
						worldArray[x][y][z] = null;
					}
			
		}
		
		private function createWorld():void{
			var terrainTemp :AWPTerrain;
			terrainTemp = terrain;
			//terrainy = class_aMainWorldGen.getTerrain();
			var x : int;
			var y : int;
			var z : int;
			
			var tempyX:int = 0;
			var tempyY:int = 0;
			var tempyZ:int = 0;
			
			var maxX : int = 148;
			var maxY : int = 148;
			var maxZ : int = 148;
			var boxLength:int = 15;
			var heighestY : int = 0
			
			
			var newX : int = (tempyX / 15)
			var newY : int = (tempyY / 15)
			var newZ : int = (tempyZ / 15)
			var e : int = 0;
			
			var blockType:int = 0;
			
			for (x = 20; x < maxX; x++){
				
				for (y = 20; y < maxY; y++){
					for (z = 20; z < maxZ; z++){
						tempyX = x * boxLength
						tempyY = y * boxLength
						tempyZ = z * boxLength
						
						//gather the y position of my cube
						if (Math.round(terrainTemp.getHeightAt(x, z)) > 15)
							tempyY = Math.round(terrainTemp.getHeightAt(x, z)) * boxLength
						tempyY -= (boxLength * y)
						
						newX = (tempyX / 15);
						newY = (tempyY / 15);
						newZ = (tempyZ / 15);
						e = 0;
						
						//if (newY > maxHeightArray[x][z])
						//	maxHeightArray[x][z] = newY;
						topBlockHeight[x][z] = (newY+1)
						//for every cube under the highest cube, create more cubes till 0
						for (e = (newY+1); e > 0; e--){
							blockType = Math.round(Math.random() * (9 - 1) + 1);
							worldArray[newX][e][newZ] = blockType;
							if (e == (newY+1) )
								topBlockType[x][z] = blockType;
							
							
							
						}//end e
					} //end z
				} //end y
			} //end x
			for (var zza : int = 0; zza < 128; zza++){
				for (var zz : int = 0; zz < 128; zz++){
					worldArray[126][zz][zza] = 99;
					worldArray[zza][126][zz] = 99;
					worldArray[zz][zza][126] = 99;
				}
			}
			//clean up 
			terrainTemp = null;
			////////////////////////////////////////v.clean_terrain();
			//class_aMainWorldGen = null;
			
		}
		
		
		public function drawScene(xx:int, zz:int, yy:int):void{
			
			var merge:Merge = new Merge(true, false);
			
			var tempMesh:Mesh = new Mesh(null);
			
			//v.planeMaterial = new TextureMaterial(Cast.bitmapTexture(v.aEnvNegX));
			
			//tempMesh.material = v.planeMaterial
			
			//tempMesh.geometry = v.cubeG;
		
			//v.FinalMesh = new Mesh(v.cubeG);
			//v.view.scene.addChild(v.FinalMesh);
			
			//merge.apply(v.FinalMesh, tempMesh);
			
			var cube:Mesh = new Mesh(new CubeGeometry(200, 200, 200, 1, 1, 1, false), cubeMaterial);
			cube.x = 0;
			cube.y = 0;
			cube.z = 0;
			var sharedGeometry:Geometry = new Geometry();
			var subGeom22:ISubGeometry = cube.geometry.subGeometries[0].clone();
			//sharedGeometry.addSubGeometry(subGeom22);
			myCube =  new Mesh( sharedGeometry, cubeMaterial );
			myCube.x = 0;
			myCube.y = 0;
			myCube.z = 0;
			
			
			
			
			
			//translateMatrix.appendTranslation(x*200, y*200, z*200  );
			//subGeom2.applyTransformation( translateMatrix );
			
			var x : int;
			var y : int;
			var z : int;
			var minX : int = 0;
			var minY : int = 0;
			var minZ : int = 0;
			var maxX : int = 2;
			var maxY : int = 2;
			var maxZ : int = 2;
			var drawIt:int = 0;
			
			//data = new Vector.<Vector3D>;
			//point = new Vector3D(0, 0 , 0);
			//v.geometrySet =  new Vector.<Geometry>;
			
				maxX =100 + xx;
				maxY = 125;
				maxZ = 100 + zz;
				minX = 50 + xx;
				minY = 50;
				minZ = 50 + zz;
				
				if (yy == 0){
					minY = 0;
					maxY = 125;
				}
			
			
			for (x = minX; x < maxX; x++){
				for (y = minY; y < maxY; y++){
					for (z = minZ; z < maxZ; z++){
						
						drawIt = 0;
						
						
						if (worldArray[x][y][z] == 1){
							//	change_text(String("place cube"));
							
							if (worldArray[(x+1)][y][z] != null)
								if (worldArray[(x+1)][y][z] != 0){
									drawIt += 1;
								}
							
							if (worldArray[x][(y+1)][z] != null)
								if (worldArray[x][(y+1)][z] != 0){
									drawIt += 1;
								}
							
							if (worldArray[x][y][(z+1)] != null)
								if (worldArray[x][y][(z+1)] != 0){
									drawIt += 1;
								}
							
							
							if (worldArray[(x-1)][y][z] != null)
								if (worldArray[(x-1)][y][z] != 0){
									drawIt += 1;
								}
							
							if (worldArray[x][(y-1)][z] != null)
								if (worldArray[x][(y-1)][z] != 0){
									drawIt += 1;
								}
							
							if (worldArray[x][y][(z-1)] != null)
								if (worldArray[x][y][(z-1)] != 0){
									drawIt += 1;
								}
							
							
						}
						if (worldArray[x][y][z] == 1 && drawIt < 6 && y > 2 && x < 126 && x > 2 && z < 126 && z > 2){
							//if all logic passes to determine a drawn cube, well
							//place it down.
							//change_text(String("place cube"));
							
							//v.geometrySet.push(v.cubeG);
							//data.shift();
							
							//point = new Vector3D(x - 0, y + 4, z - 0);
							//point.scaleBy(15);
							//data.push(point)
							//data.splice(0,1);
							var subGeom2:ISubGeometry = cube.geometry.subGeometries[0].clone();
							var translateMatrix:Matrix3D = new Matrix3D();
							translateMatrix.appendTranslation((x*200), (y*200), (z*200)  );
							subGeom2.applyTransformation( translateMatrix );
							sharedGeometry.addSubGeometry( subGeom2);
							//translateMatrix.
							counting ++;
									
							
						}
						
					}//forx
				}//fory
			}//forz
			returnMesh = myCube;
			//v.view.scene.addChild(myCube);
			
		}
		public function returnnMesh():Mesh{
			return returnMesh;
		}
		public function returnWorldArray():Array{
			return worldArray;
		}
		public function returnTypeArray():Array{
			return topBlockType;
		}
		public function returnHeightArray():Array{
			return topBlockHeight;
		}
	}
}