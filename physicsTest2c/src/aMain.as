package
{
	// ActionScript file
	include "aMain_Imports.as"
	import away3d.core.math.Matrix3DUtils;
	
	public class aMain extends Sprite
	{
		
		private var v:aMain_Variables; //variables class
		private static const LIMIT:uint = 65535;
		private var ei:int = 1;
		public var square:Sprite; 
		
		private var _locationTracer:Mesh;
		private var _normalTracer:SegmentSet;
		private var _locationHint:ObjectContainer3D;
		var meshy:Mesh;
		
		[Embed(source="/../embeds/diamondPick.jpg")]
		private var diamondPick:Class;
		
		[Embed(source="/../embeds/quickSlotItemBorder.png")]
		private var quickSlotItemBorders:Class;
		
		
		
		private var diamondPickB:Bitmap = new diamondPick();
		private var quickSlotItemBorderB:Bitmap = new quickSlotItemBorders();
		
		private var degree1:int = 0;
		private var degree2:Number = 0;
		
		private var deltaMouseX:Number;
		private var deltaMouseY:Number;
		private var deltaMouseZ:Number;
		private var mouseLocked : Boolean;
		
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		/**											Main;
		 * **************************************************************************************************/	
		public function aMain():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler, false, 0, true);
		}/**end ************************************************************************/ //bMain to stage
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		/**											Add to Stage;
		 * **************************************************************************************************/	
		private function addedToStageHandler(e:Event):void
		{
			init();
		}/**end ************************************************************************/ //added to stage
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		/**											Init;
		 * **************************************************************************************************/	
		private function init():void {
			v = new aMain_Variables;
			this.addEventListener(Event.ENTER_FRAME, gameLoop);
			setupText();
			setupAway3D();
			setupLights();
			setupSkyBox();
			change_text("HEYAAAA");
			setupMaterials();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, mouseRdownClickHandler);
			stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP, mouseRupClickHandler);
			change_text("HEYAAAA");
			//setupInventory();
			//addChild(diamondPickB);
			
			startGame();
			v.myTimer.addEventListener(TimerEvent.TIMER, breakCubes);
		
		}
		private function setupSkyBox():void{
			
			v.class_setupSkybox = new aMain_setupSkybox;
			v._skyBox = v.class_setupSkybox.returnSkyBox();
			v.view.scene.addChild(v._skyBox);
			
			v._skyBox2 = v.class_setupSkybox.returnSkyBox2();
			v.view.scene.addChild(v._skyBox2);
			
			v._skyBox3 = v.class_setupSkybox.returnSkyBox3();
			v.view.scene.addChild(v._skyBox3);
			
			v._skyBox4 = v.class_setupSkybox.returnSkyBox4();
			v.view.scene.addChild(v._skyBox4);
			
			v._skyBox5 = v.class_setupSkybox.returnSkyBox5();
			v.view.scene.addChild(v._skyBox5);
			
			v._skyBox6 = v.class_setupSkybox.returnSkyBox6();
			v.view.scene.addChild(v._skyBox6);
			
			v._skyBox.visible = false;
			v._skyBox2.visible = false;
			v._skyBox3.visible = false;
			v._skyBox4.visible = false;
			v._skyBox5.visible = false;
			v._skyBox6.visible = true;
			
			var material : ColorMaterial = new ColorMaterial(0xffffff);
			material.lightPicker = v._lightPicker;
			v.skyMesh = new Mesh(new CubeGeometry(200, 200, 200, 1, 1, 1, false), material);
			
			v.skyMesh.x = 60*200;
			v.skyMesh.y = 60*200;
			v.skyMesh.z = 60*200;
			v.view.scene.addChild(v.skyMesh);
			//cleanup variables used
			//v.class_setupSkybox = null;
			
		}
		private function setupInventory():void{
			
				var x:int = 0;
				var y:int = 0;
			
				
				
				
				for (x = 0; x < 10; x++){
					v.inventory[x] = new Array(10);
					
				}
				
				for (x = 0; x < 10; x++)
					for (y = 0; y < 20; y++){
						v.inventory[x][y] = null;
					}
			
		}
		private function setupText():void {
			v.class_setupText = new aMain_setupText(v.txtDebug, v.mcDebug, this.stage);
			v.class_setupText.change_text("HELLO");
			//v.class_setupText = null;	
			v.invTextAmount1 = v.class_setupText.return_invTextAmount1();
			addChild(v.invTextAmount1);
			v.invTextAmount2 = v.class_setupText.return_invTextAmount2();
			addChild(v.invTextAmount2);
			v.invTextAmount3 = v.class_setupText.return_invTextAmount3();
			addChild(v.invTextAmount3);
			v.invTextAmount4 = v.class_setupText.return_invTextAmount4();
			addChild(v.invTextAmount4);
			v.invTextAmount5 = v.class_setupText.return_invTextAmount5();
			addChild(v.invTextAmount5);
			v.invTextAmount6 = v.class_setupText.return_invTextAmount6();
			addChild(v.invTextAmount6);
			v.invTextAmount7 = v.class_setupText.return_invTextAmount7();
			addChild(v.invTextAmount7);
			v.invTextAmount8 = v.class_setupText.return_invTextAmount8();
			addChild(v.invTextAmount8);
			
			v.invTextAmount1.x = stage.stageWidth/2-v.slots.width/2;
			v.invTextAmount1.y = stage.stageHeight-v.slots.height-v.invTextAmount3.height
			
			v.invTextAmount2.x = stage.stageWidth/2-v.slots.width/2 + v.invTextAmount1.width * 2;
			v.invTextAmount2.y = stage.stageHeight-v.slots.height-v.invTextAmount3.height
				
			v.invTextAmount3.x = stage.stageWidth/2-v.slots.width/2 + v.invTextAmount1.width * 4;
			v.invTextAmount3.y = stage.stageHeight-v.slots.height-v.invTextAmount3.height

			v.invTextAmount4.x = stage.stageWidth/2-v.slots.width/2 + v.invTextAmount1.width * 6;
			v.invTextAmount4.y = stage.stageHeight-v.slots.height-v.invTextAmount3.height
				
			v.invTextAmount5.x = stage.stageWidth/2-v.slots.width/2 + v.invTextAmount1.width * 8;
			v.invTextAmount5.y = stage.stageHeight-v.slots.height-v.invTextAmount3.height
				
			v.invTextAmount6.x = stage.stageWidth/2-v.slots.width/2 + v.invTextAmount1.width * 10;
			v.invTextAmount6.y = stage.stageHeight-v.slots.height-v.invTextAmount3.height
				
			v.invTextAmount7.x = stage.stageWidth/2-v.slots.width/2 + v.invTextAmount1.width * 12;
			v.invTextAmount7.y = stage.stageHeight-v.slots.height-v.invTextAmount3.height
				
			v.invTextAmount8.x = stage.stageWidth/2-v.slots.width/2 + v.invTextAmount1.width * 14;
			v.invTextAmount8.y = stage.stageHeight-v.slots.height-v.invTextAmount3.height
		}

		private function setupAway3D():void {
			v.class_setupAway3D = new aMain_setupAway3D();
			
			v.view = v.class_setupAway3D.returnView();
			v.stats = v.class_setupAway3D.returnStats();
			v.cameraTemp = v.class_setupAway3D.returnCamera();
		
			v.mcStats = new MovieClip();
			v.mcStats.addChild(v.stats);
			
			
			v.class_setupText.change_text("1");
			
			addChild(v.view);
			addChild(v.mcStats);
			
			v.class_setupAway3D = null;
			v.view.mousePicker = PickingType.RAYCAST_FIRST_ENCOUNTERED;
			
			_locationTracer = new Mesh( new SphereGeometry( .5 ), new ColorMaterial( 0x00FF00 ) );
			_locationTracer.mouseEnabled = _locationTracer.mouseChildren = false;
			_locationTracer.visible = false;
			v.view.scene.addChild( _locationTracer );
			
			// To trace picking normals.
			_normalTracer = new SegmentSet();
			_normalTracer.mouseEnabled = _normalTracer.mouseChildren = false;
			var lineSegment:LineSegment = new LineSegment( new Vector3D(), new Vector3D(), 0xFFFFFF, 0xFFFFFF, 3 );
			_normalTracer.addSegment( lineSegment );
			_normalTracer.visible = false;
			v.view.scene.addChild( _normalTracer );
			
			// To help locating the hit.
			_locationHint = new ObjectContainer3D();
			var locationHintMesh:Mesh = new Mesh( new ConeGeometry( 15, 100 ), new ColorMaterial( 0xFFFF00 ) );
			locationHintMesh.mouseEnabled = locationHintMesh.mouseChildren = false;
			locationHintMesh.name = "location hint";
			locationHintMesh.rotationX += 90;
			_locationHint.visible = false;
			_locationHint.addChild( locationHintMesh );
			v.view.scene.addChild( _locationHint );
			v.view.mousePicker = PickingType.RAYCAST_BEST_HIT;
		}

		private function setupLights():void {
			v.class_setupLights = new aMain_setupLights();
			v.lights = v.class_setupLights.returnLightSun();
			v.view.scene.addChild(v.lights);
			v._lightPicker = new StaticLightPicker([v.lights]);
			v.class_setupLights = null;	
			
			
		}
		private function setupMaterials():void {
			v.class_setupMaterials = new aMain_setupMaterials();
		    v.cubeMaterial = v.class_setupMaterials.return_cubeMaterial();
			v.cubeMaterial.lightPicker = v._lightPicker;
			
			v.topRockMaterial = v.class_setupMaterials.return_topRockMaterial();
			v.topRockMaterial.lightPicker = v._lightPicker;
			
			v.stackedStoneMaterial = v.class_setupMaterials.return_stackedStoneMaterial();
			v.stackedStoneMaterial.lightPicker = v._lightPicker;
			
			v.stackedStoneMaterial2 = v.class_setupMaterials.return_stackedStoneMaterial2();
			v.stackedStoneMaterial2.lightPicker = v._lightPicker;
			
			v.stackedStoneMaterial3 = v.class_setupMaterials.return_stackedStoneMaterial3();
			v.stackedStoneMaterial3.lightPicker = v._lightPicker;
			
			v.stackedStoneMaterial4 = v.class_setupMaterials.return_stackedStoneMaterial4();
			v.stackedStoneMaterial4.lightPicker = v._lightPicker;

			v.stackedStoneMaterial5 = v.class_setupMaterials.return_stackedStoneMaterial5();
			v.stackedStoneMaterial5.lightPicker = v._lightPicker;
			
			v.stackedStoneMaterial6 = v.class_setupMaterials.return_stackedStoneMaterial6();
			v.stackedStoneMaterial6.lightPicker = v._lightPicker;
			
			v.stackedStoneMaterial7 = v.class_setupMaterials.return_stackedStoneMaterial7();
			v.stackedStoneMaterial7.lightPicker = v._lightPicker;
			
			v.class_setupMaterials = null;	
			
			
		
		}

		private function startGame():void {
			setupPlayer();
			setupWorld();
			setupPhysics();
			setupGUI();
			setupMinimap();
			
			//doPhysicsCube();
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			v.physicsModeOn = true;
		}
		private function setupGUI():void{
			addChild(v.slots);
			v.slots.x = stage.stageWidth/2-v.slots.width/2;
			v.slots.y = stage.stageHeight-v.slots.height;
			
			addChild(quickSlotItemBorderB);
			v.quickSlotSelectedIconX =  stage.stageWidth/2-quickSlotItemBorderB.width/2 - 210 - quickSlotItemBorderB.width;
			v.quickSlotSelectedIconY = stage.stageHeight-quickSlotItemBorderB.height;
			quickSlotItemBorderB.x = v.quickSlotSelectedIconX;
			quickSlotItemBorderB.y = v.quickSlotSelectedIconY;

		}
		private function setupPlayer():void{
			v.class_setupPlayer = new aMain_setupPlayer();
			v.playerMesh = v.class_setupPlayer.returnPlayer();
			v.playerMesh.material = v.cubeMaterial;
			
			v.view.scene.addChild(v.playerMesh);
			v.cameraController = new HoverController(v.view.camera, v.playerMesh, 0, 0, -1);
			v.playerMesh.visible = false;
			v.playerMesh.x = 64*200;
			v.playerMesh.y = 122*200;
			v.playerMesh.z = 64*200;
			v.playerMesh.name = "player";
			var ii:int = 0;
			
			
			v.class_setupPlayer = null;
			
			
		}
		private function setupPhysics():void{
			v.class_setupPhysics = new aMain_setupPhysics(v.playerMesh, v._lightPicker);
			v.physicsModeOn = v.class_setupPhysics.physicsModeOn;
			v.physicsWorld = v.class_setupPhysics.physicsWorld;
			v.boxShape = v.class_setupPhysics.boxShape;
			v.timeStep = v.class_setupPhysics.timeStep;
			
			v.shape = v.class_setupPhysics.shape;
			v.sphereBody = v.class_setupPhysics.sphereBody;
			v.sphereBody.position = new Vector3D( 64*200,  122*200 ,  64*200);
			//change_text("Y PLAYER MESH");
			change_text(String(v.playerMesh.y));
			v.charBoxPhys = v.class_setupPhysics.charBoxPhys;
			v.groundRigidbody4 = v.class_setupPhysics.groundRigidbody4;
			
			v.ground2Rigidbody4 = v.class_setupPhysics.ground2Rigidbody4;
			v.ground2Rigidbody42 = v.class_setupPhysics.ground2Rigidbody42;
			//v.ground2Rigidbody42.position = new Vector3D(64*200,  13*200 ,  64*200);
			v.ground2Rigidbody43 = v.class_setupPhysics.ground2Rigidbody43;
			v.ground2Rigidbody44 = v.class_setupPhysics.ground2Rigidbody44;
			
			v.ground2Rigidbody47 = v.class_setupPhysics.ground2Rigidbody47;
			v.ground3Rigidbody4 = v.class_setupPhysics.ground3Rigidbody4;
			
			v.debugDraw = new AWPDebugDraw(v.view, v.physicsWorld);
			v.view.scene.addChild(v.charBoxPhys);
			v.class_setupPhysics = null;
			
			v.sphereBody.angularDamping = .7;
			v.sphereBody.linearDamping = .9;
			v.sphereBody.friction = 0;
			v.sphereBody.mass = 1;
			
			var boxShape : AWPBoxShape = new AWPBoxShape(100, 100, 100);
			var cylinderShape : AWPCylinderShape = new AWPCylinderShape(50, 100);
			var coneShape : AWPConeShape = new AWPConeShape(50, 100);
			
			// create rigidbodies
			var mesh : Mesh;
			var body : AWPRigidBody;
			var material : ColorMaterial = new ColorMaterial(0xffffff);
			material.lightPicker = v._lightPicker;
			
			var xx:int = -7
			var yy:int = -7
			var zz:int = -7
				
			for (var i : int; i < (5*5*5); i++ ) {

				
				// create boxes
				mesh = new Mesh(new CubeGeometry(200, 200, 200), material);
				mesh.x = -1400 + xx * 200;
				mesh.y = -1400 + yy * 200;
				mesh.z = -1400 + zz * 200;
				mesh.name = "1";
				xx += 1;
				if (xx >= 15){
					xx = 0
					yy += 1;
				}
				if  (yy >= 15){
					yy = 0;
					zz += 1;
				}
				v.view.scene.addChild(mesh);
				
					
				
			}
			//v.view.scene.addChild(v.worldMesh);
		}
		private function doPhysicsCube():void{
			/*
			v.class_setCubePosition = new aMain_Physics_setCubePosition(v.charBoxPhys,
			v.groundRigidbody4, v.ground2Rigidbody42, v.ground2Rigidbody43, v.ground2Rigidbody44, 
			v.ground2Rigidbody47, v.ground3Rigidbody4, v.CharacterIsInTheAir, v.worldArray, v.sphereBody );
			*/
			v.xnumber1 = setPrecision(v.sphereBody.x,1);
			v.xnumber2 = v.xnumber1 / 200;
			v.xnumber3 = setPrecision(v.xnumber2,0);
			
			v.ynumber1 = setPrecision(v.sphereBody.y,1);
			v.ynumber2 = v.ynumber1 / 200;
			v.ynumber3 = setPrecision(v.ynumber2,0);
			
			v.znumber1 = setPrecision(v.sphereBody.z,1);
			v.znumber2 = v.znumber1 / 200;
			v.znumber3 = setPrecision(v.znumber2,0);
			
			//change_text(String(ynumber3));
			//v.mesh:Mesh;
			//var material : ColorMaterial = new ColorMaterial(0xffffff);
			//material.lightPicker = v._lightPicker;
			v.physCycle = false;
			
			
			v.charMovedXPos = false;
			v.charMovedXNeg = false;
			v.charMovedYPos = false;
			v.charMovedYNeg = false;
			v.charMovedZPos = false;
			v.charMovedZNeg = false;
			
			
			if (v.xnumber3 > v.xnumber){
				v.charMovedXNeg = true
				change_text("TRTUIRIT");
				setupMinimap();
			}
			if (v.xnumber3 < v.xnumber){
				v.charMovedXPos = true;
				
				setupMinimap();
				change_text("BEEPAA");
			}
			
			if (v.znumber3 > v.znumber){

				setupMinimap();
			}
			if (v.znumber3 < v.znumber){

				setupMinimap();
			}
					
			if (v.ynumber3 > v.ynumber)
				v.charMovedYPos = true
			if (v.ynumber3 < v.ynumber)
				v.charMovedYNeg = true
					
			if (v.znumber3 > v.znumber)
				v.charMovedZPos = true
			if (v.znumber3 < v.znumber)
				v.charMovedZNeg = true
					
			if (v.xnumber == v.xnumber3)
			if (v.ynumber == v.ynumber3)
			if (v.znumber == v.znumber3)
				v.physCycle = true;
			
			if (v.cubePressed == true)
				v.physCycle = false;
	
			if ( v.physCycle == false ){
				for (var b:int = 0; b < v.view.scene.numChildren; b++){
					var dc = v.view.scene.getChildAt(b);
					if (dc is Mesh){
						//dc.material = null;
						
						var myString:String = dc.name;
						var contentArray:Array = myString.split("%");
						//contentArray[0]
						var myX:int = Number(contentArray[0]);
						var myY:int = Number(contentArray[1]);
						var myZ:int = Number(contentArray[2]);
						var safe:Boolean = true;
						var correctCube:Boolean = false;
						if (v.charMovedXPos == true){
							if ((v.xnumber3-myX) == (v.xnumber3 - v.negX)){
								correctCube = true;
								//change_text("SUERPAKAN");
							}
						}
						if (v.charMovedXNeg == true){
							if ((v.xnumber3+myX) == (v.xnumber3 + v.posX)){
								correctCube = true;
								change_text("bankai");
							}
						}
						if (v.drawFirstTime == false){
							correctCube = true;
							dc.x = (v.xnumber3-myX) * 200
							dc.y = (v.ynumber3-myY) * 200
							dc.z = (v.znumber3-myZ) * 200
							dc.visible = true;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 1)
								dc.material = v.cubeMaterial;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 2)
								dc.material = v.topRockMaterial;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 3)
								dc.material = v.stackedStoneMaterial;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 4)
								dc.material = v.stackedStoneMaterial2;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 5)
								dc.material = v.stackedStoneMaterial3;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 6)
								dc.material = v.stackedStoneMaterial4;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 7)
								dc.material = v.stackedStoneMaterial5;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 8)
								dc.material = v.stackedStoneMaterial6;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 9)
								dc.material = v.stackedStoneMaterial7;
							v.drawFirstTime = true;
						}
						if (v.worldArray[v.xnumber3-myX+1][v.ynumber3-myY][v.znumber3-myZ] != null )
							if (v.worldArray[v.xnumber3-myX-1][v.ynumber3-myY][v.znumber3-myZ] != null )
								if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY+1][v.znumber3-myZ] != null )
									if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY-1][v.znumber3-myZ] != null )
										if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ+1] != null )
											if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ-1] != null )
												safe = false; 
						if (v.physCycle == false && safe == true){
							//v.ground2Rigidbody43.position = new Vector3D((xnumber3-1)*200,  (ynumber3)*200 ,  (znumber3)*200);
							var oneVar = ( ( (v.xnumber3-myX)*200 ) - (v.negX*200));
							var twoVar = (v.xnumber * 200);
							var okToDraw = false;
							var x:int = 0;
							var y:int = 0;
							var z:int = 0;
							
							dc.x = (v.xnumber3-myX) * 200
							dc.y = (v.ynumber3-myY) * 200
							dc.z = (v.znumber3-myZ) * 200
							if  (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] != null ){
							dc.visible = true;
							} else
								dc.visible = false;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 1)
								dc.material = v.cubeMaterial;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 2)
								dc.material = v.topRockMaterial;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 3)
								dc.material = v.stackedStoneMaterial;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 4)
								dc.material = v.stackedStoneMaterial2;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 5)
								dc.material = v.stackedStoneMaterial3;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 6)
								dc.material = v.stackedStoneMaterial4;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 7)
								dc.material = v.stackedStoneMaterial5;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 8)
								dc.material = v.stackedStoneMaterial6;
							if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 9)
								dc.material = v.stackedStoneMaterial7;
							
							
						
								/*if (v.charMovedXNeg == true){
									//if (  ((v.xnumber3-myX)*200)  ==  ((v.xnumber3-v.negX)*200)   ){
									if ( dc.x == ((v.xnumber+(v.posX-1)) * 200) ){
										change_text("negx moved");
										dc.x = ((v.xnumber-(v.negX )) * 200) 
										dc.y = (v.ynumber3-myY) * 200
										dc.z = (v.znumber3-myZ) * 200
										if (v.worldArray[(v.xnumber-(v.negX))][v.ynumber3-myY][v.znumber3-myZ] != null){
											dc.visible = true;
										} else
											dc.visible = false;
										if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 1)
											dc.material = v.cubeMaterial;
										if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 2)
											dc.material = v.topRockMaterial;
										if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 3)
											dc.material = v.stackedStoneMaterial;
									}
									*/
									/*if ( ( (v.xnumber3-myX)*200 ) == ((v.xnumber+(v.posX)) * 200) ){
										change_text("YES");
										okToDraw = true;
										
										dc.x = ((v.xnumber-(v.negX )) * 200) 
										dc.y = (v.ynumber3-myY) * 200
										dc.z = (v.znumber3-myZ) * 200
										if (v.worldArray[(v.xnumber-(v.negX))][v.ynumber3-myY][v.znumber3-myZ] != null){
										dc.visible = true;
										} else
											dc.visible = false;
										if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 1)
											dc.material = v.cubeMaterial;
										if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 2)
											dc.material = v.topRockMaterial;
										if (v.worldArray[v.xnumber3-myX][v.ynumber3-myY][v.znumber3-myZ] == 3)
											dc.material = v.stackedStoneMaterial;
										
										
										
										
									}*/
								
								
								
								
								
							
							
							
							
						}
						else
							dc.visible = false;
						
					}
					
				}
			}
		
			if (v.worldArray[v.xnumber3][(v.ynumber3-1)][v.znumber3] != null && v.physCycle == false){
				
				v.ground2Rigidbody42.x = v.xnumber3 * 200
				v.ground2Rigidbody42.y = (v.ynumber3-1) * 200
				v.ground2Rigidbody42.z = v.znumber3 * 200
				v.CharacterIsInTheAir = false;
				
					
				
				}
			
			
			if (v.worldArray[v.xnumber3][(v.ynumber3-1)][v.znumber3] == null  && v.physCycle == false)
				v.CharacterIsInTheAir = true;
			
			if (v.worldArray[v.xnumber3-1][(v.ynumber3)][v.znumber3] != null  && v.physCycle == false){
				//v.ground2Rigidbody43.position = new Vector3D((xnumber3-1)*200,  (ynumber3)*200 ,  (znumber3)*200);
				v.ground2Rigidbody43.x = (v.xnumber3-1) * 200
				v.ground2Rigidbody43.y = (v.ynumber3-0) * 200
				v.ground2Rigidbody43.z = (v.znumber3-0) * 200
}
			if (v.worldArray[v.xnumber3+1][(v.ynumber3)][v.znumber3] != null && v.physCycle == false){
				//v.ground2Rigidbody47.position = new Vector3D((xnumber3+1)*200,  (ynumber3)*200 ,  (znumber3)*200);
				v.ground2Rigidbody47.x = (v.xnumber3+1) * 200
				v.ground2Rigidbody47.y = (v.ynumber3-0) * 200
				v.ground2Rigidbody47.z = (v.znumber3-0) * 200}
			if (v.worldArray[v.xnumber3][(v.ynumber3)][v.znumber3-1] != null && v.physCycle == false ){
				//v.ground2Rigidbody44.position = new Vector3D((xnumber3)*200,  (ynumber3)*200 ,  (znumber3-1)*200);
				v.ground2Rigidbody44.x = (v.xnumber3-0) * 200
				v.ground2Rigidbody44.y = (v.ynumber3-0) * 200
				v.ground2Rigidbody44.z = (v.znumber3-1) * 200}
			if (v.worldArray[v.xnumber3][(v.ynumber3)][v.znumber3+1] != null && v.physCycle == false ){
				//v.ground2Rigidbody4.position = new Vector3D((xnumber3)*200,  (ynumber3)*200 ,  (znumber3+1)*200);
				v.ground2Rigidbody4.x = (v.xnumber3-0) * 200
				v.ground2Rigidbody4.y = (v.ynumber3-0) * 200
				v.ground2Rigidbody4.z = (v.znumber3+1) * 200
			}

	
			v.xnumber = v.xnumber3;
			v.ynumber = v.ynumber3;
			v.znumber = v.znumber3;
		//	change_text(String(v.CharacterIsInTheAir));
		}
	
		private function setupWorld():void {
			change_text("1");
			v.class_setupWorld = new aMain_setupWorld(v.cubeMaterial);
			//setupMinimap();
			v.class_setupWorld.drawScene(0, 0, 0); 
			change_text("counting");
			change_text(String( v.class_setupWorld.counting));

			
			
			change_text("12");
			var myMesh:Mesh = v.class_setupWorld.returnnMesh();
			
		
			meshy = new Mesh(new CubeGeometry(200, 200, 200, 1, 1, 1, false), v.cubeMaterial);
			
			meshy.x = 60*200;
			meshy.y = 60*200;
			meshy.z = 60*200;
	
			//v.view.scene.addChild(meshy);
			v.worldArray = v.class_setupWorld.returnWorldArray();
			//meshy.geometry = v.class_setupWorld.myCube.geometry;
			createWorldCubes();
		
		}
		private function setupMinimap():void{
			v.topBlockType = v.class_setupWorld.returnHeightArray();
			v.topBlockHeight = v.class_setupWorld.returnTypeArray();
			var k:int = 0;
			var j:int = 0;
			
			var pH = 5;
			var mapH = 30;
			//change_text("setupminimap");
			v.xnumber1 = setPrecision(v.sphereBody.x,1);
			v.xnumber2 = v.xnumber1 / 200;
			v.xnumber3 = setPrecision(v.xnumber2,0);
			
			v.ynumber1 = setPrecision(v.sphereBody.y,1);
			v.ynumber2 = v.ynumber1 / 200;
			v.ynumber3 = setPrecision(v.ynumber2,0);
			
			v.znumber1 = setPrecision(v.sphereBody.z,1);
			v.znumber2 = v.znumber1 / 200;
			v.znumber3 = setPrecision(v.znumber2,0);
			//change_text("setupminimap"); 
			v.minimapSprite.graphics.clear();
			for (k = 0; k < mapH; k++){
				for (j = 0; j < mapH; j++){
					var blockNumber = v.topBlockHeight[v.xnumber3-((mapH/2)-k)][v.znumber3-((mapH/2)-j)]
					var blockType = v.worldArray[(v.xnumber3-((mapH/2)-k))][blockNumber][(v.znumber3-((mapH/2)-j))] 
					
						v.minimapSprite.graphics.beginFill(0x00aa00 + (0x111111 * blockNumber) );
					
						
					v.minimapSprite.graphics.drawRect(k*pH, j*pH, pH, pH);
					v.minimapSprite.graphics.endFill();
					
					addChild(v.minimapSprite);
					
				}
			}
		}
		private function readjustWorldView():void{
			for (var b:int = 0; b < v.view.scene.numChildren; b++){
				var dc = v.view.scene.getChildAt(b);
				if (dc is Mesh){
					if (dc.name != "player")
						v.view.scene.removeChild(dc);
				}
			}
			v.negX -= 1;
			if (v.negY >= -2)
				v.negY -= 1;
			v.negZ -= 1;
			v.posX += 1;
			if (v.posY <= 2)
				v.posY += 1;
			//v.posY += 3;
			v.posZ += 1;
			
			createWorldCubes();
			v.cubePressed = true;
		}
		private function readjustWorldViewNeg():void{
			for (var b:int = 0; b < v.view.scene.numChildren; b++){
				var dc = v.view.scene.getChildAt(b);
				if (dc is Mesh){
					if (dc.name != "player")
						v.view.scene.removeChild(dc);
				}
			}
			v.negX += 1;
			if (v.negY >= -2)
				v.negY += 1;
			v.negZ += 1;
			v.posX -= 1;
			if (v.posY <= 2)
				v.posY -= 1;
			//v.posY += 3;
			v.posZ -= 1;
			
			createWorldCubes();
			v.cubePressed = true;
		}
		private function createWorldCubes():void{
			var x:int = 0;
			var y:int = 0;
			var z:int = 0;
			for (x = v.negX; x < v.posX; x++)
				for (y = v.negY; y < v.posY; y++)
					for (z = v.negZ; z < v.posZ; z++){
			var mesh:Mesh  = new Mesh(new CubeGeometry(200, 200, 200), v.cubeMaterial);
			mesh.x = x*200;
			mesh.y = y*200;
			mesh.z = z*200;
			
			//change_text("YEAHHAA");
			mesh.name = String(x);
			mesh.name += "%";
			
			mesh.name += String(y);
			mesh.name += "%";
			
			mesh.name += String(z);
			mesh.name += "%";
			//var myString:String = mesh.name;
			//var contentArray:Array = myString.split("%");
			//change_text(String(contentArray[1]));
			mesh.mouseEnabled = true;
			
			mesh.addEventListener( MouseEvent3D.MOUSE_OVER, onObjectMouseOver );
			mesh.addEventListener( MouseEvent3D.MOUSE_OUT, onObjectMouseOut );
			mesh.addEventListener( MouseEvent3D.MOUSE_MOVE, onMeshMouseMove );
			mesh.addEventListener( MouseEvent3D.MOUSE_DOWN, onObjectMouseDown );
			mesh.addEventListener( MouseEvent3D.MOUSE_UP, onObjectMouseUp );
			v.view.scene.addChild(mesh);
			}
		
			
			//xx += 1;
			
			
		}
		private function gameLoop(event : Event) : void {
			v.lights.x = v.playerMesh.x+6000;
			v.lights.y = v.playerMesh.y+6000;
			v.lights.z = v.playerMesh.z;
			if (degree1 > 10){
			degree2 += 1;
			degree1 = 0;
			}
			degree1 += 1;
		 	var angle = degree2 * (Math.PI / 180);
			 var cosTheta = Math.cos(angle);
			 var sinTheta = Math.sin(angle);
			 
			 v.lights.x = (cosTheta * (v.lights.x - v.playerMesh.x) - sinTheta * (v.lights.y - v.playerMesh.y) + v.playerMesh.x);
			 v.lights.y = (sinTheta * (v.lights.x - v.playerMesh.x) - cosTheta * (v.lights.y - v.playerMesh.y) + v.playerMesh.y);
			
			 
			
if (degree2 > 360)
	degree2 = 0;
			 
			if (degree2 == 0){
				v.view.scene.addChild(v._skyBox6);
				
			}
			if (degree2 == 30){
				v.view.scene.addChild(v._skyBox5);
				v.view.scene.removeChild(v._skyBox6);
			}
			
			if (degree2 == 60){
				
				v.view.scene.addChild(v._skyBox4);
				v.view.scene.removeChild(v._skyBox5);
			}
			if (degree2 == 90){
				
				v.view.scene.addChild(v._skyBox3);
				v.view.scene.removeChild(v._skyBox4);
			}
			
			if (degree2 == 120){
				
				v.view.scene.addChild(v._skyBox2);
				v.view.scene.removeChild(v._skyBox3);
			}
			
			if (degree2 ==150){
				
				v.view.scene.addChild(v._skyBox);
				v.view.scene.removeChild(v._skyBox2);
			}
			
			if (degree2 == 180){
				v.view.scene.removeChild(v._skyBox);
				v.view.scene.addChild(v._skyBox2);
			}
			
			if (degree2 == 210){
				
				v.view.scene.addChild(v._skyBox3);
				v.view.scene.removeChild(v._skyBox2);
			}
			if (degree2 == 240){
				
				v.view.scene.addChild(v._skyBox4);
				v.view.scene.removeChild(v._skyBox3);
			}
			if (degree2 == 270){
				
				v.view.scene.addChild(v._skyBox5);
				v.view.scene.removeChild(v._skyBox4);
			}
			if (degree2 == 300){
				
				v.view.scene.addChild(v._skyBox6);
				v.view.scene.removeChild(v._skyBox5);
			}
			
			if (degree2 == 320){
				
				
				v.view.scene.removeChild(v._skyBox6);
			}
				
			if (v.physicsModeOn == true)
				runPhysics();

			moveMouse();
			moveSky();
			v.view.render();

		}
		private function moveSky():void{
			v.skyMesh.x = v.playerMesh.x + 1000;
			v.skyMesh.y = v.playerMesh.y;
			v.skyMesh.z = v.playerMesh.z;
			
		}
		private function moveMouse():void{
			if (mouseLocked == false)
				stage.mouseLock = false
			
			if (mouseLocked == true)
				stage.mouseLock = true
			v.cameraController.panAngle += deltaMouseX/1.5;
			deltaMouseX = 0;
			
			v.cameraController.tiltAngle -= deltaMouseY/1.5;
			deltaMouseY = 0;
		}
		private function runPhysics():void{
			

			var centralForce : int = 20;
			
	
			
			v.sphereBody.applyCentralForce(new Vector3D(0, 0 - centralForce, 0));
			v.forceF = v.cameraController.targetObject.forwardVector;
			v.forceL = v.cameraController.targetObject.leftVector;
			v.forceR = v.cameraController.targetObject.rightVector;
			v.forceB = v.cameraController.targetObject.backVector;
			if (v.keyForward){//up
				//v.sphereBody.x += 10;
			//	v.sphereBody.clearForces();
				//v.cameraController.panAngle = 180
				//x
				//v.cameraController.panAngle
				//y
				//v.cameraController.tiltAngle
				
				/*
				if (v.cameraController.panAngle >= -45 && v.cameraController.panAngle < 44)
				sphereBody.applyCentralForce(new Vector3D(0, 0,centralForce))
				else if (v.cameraController.panAngle >= 45 && v.cameraController.panAngle < 135)
				sphereBody.applyCentralForce(new Vector3D(centralForce, 0,0))
				else if (v.cameraController.panAngle >= 135 && v.cameraController.panAngle < 225)
				sphereBody.applyCentralForce(new Vector3D(0, 0,-centralForce))
				else if (v.cameraController.panAngle >= 225 && v.cameraController.panAngle < 315)
				sphereBody.applyCentralForce(new Vector3D(-centralForce, 0, 0))
				else if (v.cameraController.panAngle >= 315 && v.cameraController.panAngle < 370)
				sphereBody.applyCentralForce(new Vector3D(centralForce, 0,0))
				*/
				
				
				
				//force.scaleBy(centralForce);
				
				
				
	
				
				
				
				if (v.charDirection == 0)
					//v.sphereBody.applyCentralForce(new Vector3D(centralForce, 0, 0));
					v.sphereBody.applyCentralForce(new Vector3D(v.forceF.x*centralForce, 0, v.forceF.z * centralForce));
				if (v.charDirection == 1)
					v.sphereBody.applyCentralForce(new Vector3D(centralForce, 0, 0));
				if (v.charDirection == 2)
					v.sphereBody.applyCentralForce(new Vector3D(0, 0, -centralForce));
				if (v.charDirection == 3)
					v.sphereBody.applyCentralForce(new Vector3D(-centralForce, 0, 0));
				
			//	v.sphereBody.x += 20;
			//	v.sphereBody.applyForce(
				//
			}
			
			if (v.keyReverse){//down
				
				if (v.charDirection == 0)
					v.sphereBody.applyCentralForce(new Vector3D(v.forceB.x*centralForce, 0, v.forceB.z * centralForce));
				if (v.charDirection == 1)
					v.sphereBody.applyCentralForce(new Vector3D(-centralForce, 0, 0));
				if (v.charDirection == 2)
					v.sphereBody.applyCentralForce(new Vector3D(0, 0, centralForce));
				if (v.charDirection == 3)
					v.sphereBody.applyCentralForce(new Vector3D(centralForce, 0, 0));
			}
			
			if (v.keyLeft){//left
				//sphereBody.clearForces();
				
				
				if (v.charDirection == 0)
					v.sphereBody.applyCentralForce(new Vector3D(v.forceL.x*centralForce, 0, v.forceL.z * centralForce));
				if (v.charDirection == 1)
					v.sphereBody.applyCentralForce(new Vector3D(0, 0, centralForce));
				if (v.charDirection == 2)
					v.sphereBody.applyCentralForce(new Vector3D(centralForce, 0, 0));
				if (v.charDirection == 3)
					v.sphereBody.applyCentralForce(new Vector3D(0, 0, -centralForce));
			}
			
			if (v.keyRight){//right
				
				//sphereBody.clearForces();
				if (v.charDirection == 0)
					v.sphereBody.applyCentralForce(new Vector3D(v.forceR.x*centralForce, 0, v.forceR.z * centralForce));
				if (v.charDirection == 1)
					v.sphereBody.applyCentralForce(new Vector3D(0, 0, -centralForce));
				if (v.charDirection == 2)
					v.sphereBody.applyCentralForce(new Vector3D(-centralForce, 0, 0));
				if (v.charDirection == 3)
					v.sphereBody.applyCentralForce(new Vector3D(0, 0, centralForce));
				
			}
			
			
			if (v.keySpace) {
				
				//if character is on ground, you can jump
				//if (v.CharacterIsInTheAir == false)
					v.sphereBody.applyCentralForce(new Vector3D(0, 2000, 0));
				v.keySpace = false;
			}
			
			//adjust the sphere body, which is the characters physics representation
	
			

			//v.sphereBody.
			
			v.sphereBody.x = setPrecision(v.sphereBody.x,0);
			v.sphereBody.y = setPrecision(v.sphereBody.y,0);
			v.sphereBody.z = setPrecision(v.sphereBody.z,0);
			v.sphereBody.rotationX = 0;
			v.sphereBody.rotationY = 0;
			v.sphereBody.rotationZ = 0;
			
		//	v.sphereBody.clearForces();
			
			doPhysicsCube();
			v.physicsWorld.step(v.timeStep);
			
			//v.debugDraw.debugDrawWorld();
			
	
			v.playerMesh.position = v.sphereBody.position;
		
			if (v.CharacterIsInTheAir == false){
			
			var ynumber:Number = setPrecision(v.playerMesh.y,1);
			var ynumber2:Number = ynumber / 200;
			var ynumber3:Number = setPrecision(ynumber2,0);

			v.playerMesh.y = ynumber3 * 200;

			}
			//v.sphereBody.clearForces();
			
			//v.playerMesh.x = 0;
			//v.playerMesh.y = 0;
			//v.playerMesh.z = 0;
			
			
		}
		public function change_text(newText : String):void {
			v.class_setupText.change_text(String(newText));
			
		}
		
		
		
		
		private function keyDownHandler(event : KeyboardEvent) : void {
			switch(event.keyCode) {
				case Keyboard.W:
					
					
					
					v.keyForward = true;
					v.keyReverse = false;
					break;
				case Keyboard.S:
					v.keyReverse = true;
					v.keyForward = false;
					break;
				case Keyboard.A:
					v.keyLeft = true;
					v.keyRight = false;
					break;
				case Keyboard.D:
					v.keyRight = true;
					v.keyLeft = false;
					break;
				case Keyboard.SPACE:
					v.keySpace = true;
					
					break;
				case Keyboard.NUMBER_1:
					quickSlotItemBorderB.x = v.quickSlotSelectedIconX;
					quickSlotItemBorderB.y = v.quickSlotSelectedIconY;
					v.currSlotSelect = 1;
					
					break;
				case Keyboard.NUMBER_2:
					quickSlotItemBorderB.x = v.quickSlotSelectedIconX + quickSlotItemBorderB.width * 1;
					quickSlotItemBorderB.y = v.quickSlotSelectedIconY;
					v.currSlotSelect = 2;
					
					break;
				case Keyboard.NUMBER_3:
					quickSlotItemBorderB.x = v.quickSlotSelectedIconX + quickSlotItemBorderB.width * 2;
					quickSlotItemBorderB.y = v.quickSlotSelectedIconY;
					v.currSlotSelect = 3;
					
					break;
				case Keyboard.NUMBER_4:
					quickSlotItemBorderB.x = v.quickSlotSelectedIconX + quickSlotItemBorderB.width * 3;
					quickSlotItemBorderB.y = v.quickSlotSelectedIconY;
					v.currSlotSelect = 4;
					
					break;
				case Keyboard.NUMBER_5:
					quickSlotItemBorderB.x = v.quickSlotSelectedIconX + quickSlotItemBorderB.width * 4;
					quickSlotItemBorderB.y = v.quickSlotSelectedIconY;
					v.currSlotSelect = 5;
					
					break;
				case Keyboard.NUMBER_6:
					quickSlotItemBorderB.x = v.quickSlotSelectedIconX + quickSlotItemBorderB.width * 5;
					quickSlotItemBorderB.y = v.quickSlotSelectedIconY;
					v.currSlotSelect = 6;
					
					break;
				case Keyboard.NUMBER_7:
					quickSlotItemBorderB.x = v.quickSlotSelectedIconX + quickSlotItemBorderB.width * 6;
					quickSlotItemBorderB.y = v.quickSlotSelectedIconY;
					v.currSlotSelect = 7;
					
					break;
				case Keyboard.NUMBER_8:
					quickSlotItemBorderB.x = v.quickSlotSelectedIconX + quickSlotItemBorderB.width * 7;
					quickSlotItemBorderB.y = v.quickSlotSelectedIconY;
					v.currSlotSelect = 8;
					
					break;
				case Keyboard.NUMBER_9:
					quickSlotItemBorderB.x = v.quickSlotSelectedIconX + quickSlotItemBorderB.width * 8;
					quickSlotItemBorderB.y = v.quickSlotSelectedIconY;
					v.currSlotSelect = 9;
					
					break;
					//change_text("3");
				//
			}
			if (v.quickSlotQty[v.currSlotSelect-1] == 0){
				v.clickMode = 0;
				v.quickSlot[v.currSlotSelect-1] = 0
			} else{
				v.clickMode = 1;
			}
			
		}
		
		private function keyUpHandler(event : KeyboardEvent) : void {
			
			switch(event.keyCode) {
				case Keyboard.W:
					//v.sphereBody.mass = 0;
					//v.key_Up = 0;
					v.keyForward = false;
					
					//sphereBody.clearForces();
					//	sphereBody.rotation = new Vector3D(0,0,0);
					
					//onMoveBlockClicks()
					
					break;
				case Keyboard.E:
					v.cameraController.panAngle -= 90;
					break;
				case Keyboard.S:
					//v.sphereBody.mass = 0;
					//v.key_Down = 0;
					v.keyReverse = false;
					//onMoveBlockClicks()
					break;
				case Keyboard.A:
					//v.sphereBody.mass = 0;
					//v.key_Left = 0;
					v.keyLeft = false;
					//onMoveBlockClicks()
					break;
				case Keyboard.D:
					//v.sphereBody.mass = 0;
					//v.key_Right = 0;
					v.keyRight = false;
					//onMoveBlockClicks()
					break;
				case Keyboard.SPACE:
					v.keySpace = false;
					v.drawFirstTime = true;
					
					break;
				case Keyboard.I:
					readjustWorldView();
					break;
				case Keyboard.K:
					readjustWorldViewNeg();
					break;
			}
			
			change_text(String(v.cameraController.targetObject.forwardVector));
		}
		
		private function onMeshMouseMove( event:MouseEvent3D ):void {
			// Update tracers.
			_locationTracer.position = event.scenePosition;
			
			
			
			
			change_text(String(event.scenePosition.x));
			_normalTracer.position = _locationTracer.position;
			var normal:Vector3D = event.sceneNormal.clone();
			normal.scaleBy( 25 );
			var lineSegment:LineSegment = _normalTracer.getSegment( 0 ) as LineSegment;
			lineSegment.end = normal.clone();
			normal.scaleBy( 5 );
			_locationHint.position = _locationTracer.position.add( new Vector3D( 0, 100, 0 ) );
			_locationHint.lookAt( _locationTracer.position );
		}
		
		private function onObjectMouseOver( event:MouseEvent3D ):void {
			_locationTracer.visible = _normalTracer.visible = _locationHint.visible = true;
		}
		private function onObjectMouseDown( event:MouseEvent3D ):void {
			if (v.clickMode == 0)
				mouseDownEvent_RemoveCube(event);
			if (v.clickMode == 1)
				mouseDownEvent_addCube(event);
			
		}
		private function onObjectMouseUp( event:MouseEvent3D ):void {
			if (v.clickMode == 0){
				//mouseDownEvent_RemoveCube(event);
				v.myTimer.stop();
				v.myTimer.reset();
				//v.myTimer.removeEventListener(TimerEvent.TIMER, breakCubes);
							}
			change_text("AHAHHH");
			change_text("event.target.x");
			change_text(String(event.target.x));
			
			v.xnumber1 = setPrecision(v.sphereBody.x,1);
			v.xnumber2 = v.xnumber1 / 200;
			v.xnumber3 = setPrecision(v.xnumber2,0);
			
			v.ynumber1 = setPrecision(v.sphereBody.y,1);
			v.ynumber2 = v.ynumber1 / 200;
			v.ynumber3 = setPrecision(v.ynumber2,0);
			
			v.znumber1 = setPrecision(v.sphereBody.z,1);
			v.znumber2 = v.znumber1 / 200;
			v.znumber3 = setPrecision(v.znumber2,0);
			change_text("v.xnumber3");
			change_text(String(v.sphereBody.x));
			
			//if (v.clickMode == 1)
				//mouseDownEvent_addCube(event);
			
		}
		private function mouseDownEvent_RemoveCube(event:MouseEvent3D):void{
			
			v.blockDownX = event.target.x / 200;
			v.blockDownY = event.target.y / 200;
			v.blockDownZ= event.target.z / 200;
			
			//breakThisBlock();
			
			//v.myTimer.reset();
			v.myTimer.start();
		}
		private function breakCubes(event:TimerEvent):void{
			//var myTimer:Timer = new Timer(1000); // 1 second
			if (getTimer() >= 5000){
				breakThisBlock();
				v.myTimer.stop();
				v.myTimer.reset();
				//v.myTimer.removeEventListener(TimerEvent.TIMER, breakCubes);
				
			}
		}
		
		private function breakThisBlock():void{
			var i:int = 0;
			var itemInSlotAlready:Boolean = false;
			
			for (i = 0; i < 9; i++){
				if (itemInSlotAlready == false){
					if  (v.quickSlot[i] == v.worldArray[v.blockDownX][v.blockDownY][v.blockDownZ]){
						if (v.quickSlotQty[i] < 64){
						itemInSlotAlready = true;
						v.quickSlotQty[i]+= 1;
						v.quickSlot[i] = v.worldArray[v.blockDownX][v.blockDownY][v.blockDownZ];
						}
					}
				}
			}
			
			if (itemInSlotAlready == true){
				//v.quickSlotQty[i]+= 1;
				change_text("Item already owned");
			}
			
			if (itemInSlotAlready == false){
				for (i = 0; i < 9; i++){
					if  (v.quickSlot[i] == 0 && itemInSlotAlready == false){
						v.quickSlot[i] = v.worldArray[v.blockDownX][v.blockDownY][v.blockDownZ];
						v.quickSlotQty[i] += 1;
						itemInSlotAlready = true;
						change_text("item put in new slot");
					}
				}
			}
			
			if (itemInSlotAlready == false){
				change_text("ITEM SLOT FULL");
			}
			
			
			if (v.quickSlotQty[v.currSlotSelect-1] == 0){
				v.clickMode = 0;
				v.quickSlot[v.currSlotSelect-1] = 0
			} else{
				v.clickMode = 1;
			}
			
			updateQuickslotQtyText();
				
			v.worldArray[v.blockDownX][v.blockDownY][v.blockDownZ] = null;
			v.cubePressed = true;
		}
		private function mouseDownEvent_addCube(event:MouseEvent3D):void{
			var mesh:Mesh  = new Mesh(new CubeGeometry(200, 200, 200), v.cubeMaterial);
			var x:int;// = mesh.x / 200;
			var y:int;// = mesh.y / 200;
			var z:int;// = mesh.z / 200;
			if (event.scenePosition.x == (event.target.x + 100)){
				change_text("x pos");
				//var mesh:Mesh  = new Mesh(new CubeGeometry(200, 200, 200), v.cubeMaterial);
				mesh.x = event.target.x + 200;
				mesh.y = event.target.y ;
				mesh.z = event.target.z ;
				
			}
			if (event.scenePosition.x == (event.target.x - 100)){
				change_text("x neg");
				mesh.x = event.target.x - 200;
				mesh.y = event.target.y ;
				mesh.z = event.target.z ;
			}
			if (event.scenePosition.y == (event.target.y + 100)){
				change_text("y pos");
				mesh.x = event.target.x;
				mesh.y = event.target.y + 200;
				mesh.z = event.target.z ;
				
			}
			
			if (event.scenePosition.y == (event.target.y - 100)){
				change_text("y neg");
				mesh.x = event.target.x;
				mesh.y = event.target.y - 200;
				mesh.z = event.target.z ;
			}
			if (event.scenePosition.z == (event.target.z + 100)){
				change_text("z pos");
				mesh.x = event.target.x ;
				mesh.y = event.target.y ;
				mesh.z = event.target.z + 200;
				
			}
			if (event.scenePosition.z == (event.target.z - 100)){
				change_text("z neg");
				mesh.x = event.target.x ;
				mesh.y = event.target.y ;
				mesh.z = event.target.z - 200;
			}
			
			x = mesh.x / 200;
			y = mesh.y / 200;
			z = mesh.z / 200;
			
			//change_text("YEAHHAA");
			mesh.name = String(x);
			mesh.name += "%";
			
			mesh.name += String(y);
			mesh.name += "%";
			
			mesh.name += String(z);
			mesh.name += "%";
			mesh.mouseEnabled = true;
			change_text(String(x));
			change_text(String(y));
			change_text(String(z));
			
			mesh.addEventListener( MouseEvent3D.MOUSE_OVER, onObjectMouseOver );
			mesh.addEventListener( MouseEvent3D.MOUSE_OUT, onObjectMouseOut );
			mesh.addEventListener( MouseEvent3D.MOUSE_MOVE, onMeshMouseMove );
			mesh.addEventListener( MouseEvent3D.MOUSE_DOWN, onObjectMouseDown );
			mesh.addEventListener( MouseEvent3D.MOUSE_UP, onObjectMouseUp );
			
			//v.view.scene.addChild(mesh);
	
			if (v.quickSlotQty[v.currSlotSelect-1] != 0){
			v.worldArray[x][y][z] = v.quickSlot[v.currSlotSelect-1];
			v.quickSlotQty[v.currSlotSelect-1] -= 1;
			v.cubePressed = true;
			}
			
			if (v.quickSlotQty[v.currSlotSelect-1] == 0){
				v.clickMode = 0;
				v.quickSlot[v.currSlotSelect-1] = 0
			} else{
				v.clickMode = 1;
			}
			
			updateQuickslotQtyText();
			
		}
		
		private function updateQuickslotQtyText():void{
			v.invTextAmount1.text = String(v.quickSlotQty[0]);
			v.invTextAmount2.text = String(v.quickSlotQty[1]);
			v.invTextAmount3.text = String(v.quickSlotQty[2]);
			v.invTextAmount4.text = String(v.quickSlotQty[3]);
			v.invTextAmount5.text = String(v.quickSlotQty[4]);
			v.invTextAmount6.text = String(v.quickSlotQty[5]);
			v.invTextAmount7.text = String(v.quickSlotQty[6]);
			v.invTextAmount8.text = String(v.quickSlotQty[7]);
		}
		private function onObjectMouseOut( event:MouseEvent3D ):void {
			_locationTracer.visible = _normalTracer.visible = _locationHint.visible = false;
		}
		
		protected function mouseMoveHandler(event:MouseEvent):void
		{
			
			
			
			deltaMouseX =  event.movementX;
			deltaMouseY =  event.movementY;
			//deltaMouseX =  event.movementX;
			
			change_text("deltaMouseX");
			change_text(String(deltaMouseX));
			
		}
		
		protected function mouseRdownClickHandler(event:MouseEvent):void
		{
			if (mouseLocked == false)
			mouseLocked = true;
			else
		    mouseLocked = false;
			
		}
		
		protected function mouseRupClickHandler(event:MouseEvent):void
		{
			
			//mouseLocked = false;
			
		}
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		/**											setPrecision;
		 * **************************************************************************************************/	
		private function setPrecision(number:Number, precision:int):Number {
			precision = Math.pow(10, precision);
			return (Math.round(number * precision)/precision);
		}
	
	}
}