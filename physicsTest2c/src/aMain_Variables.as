package
{
	include "aMain_Imports.as"
	public class aMain_Variables
	{
		//classes
		public var class_setupText:aMain_setupText = null; 
		public var class_setupAway3D:aMain_setupAway3D = null; 
		public var class_setupLights:aMain_setupLights = null; 
		public var class_setupMaterials:aMain_setupMaterials = null; 
		public var class_setupWorld:aMain_setupWorld = null; 
		public var class_setupPlayer:aMain_setupPlayer = null; 
		public var class_setupPhysics:aMain_setupPhysics = null; 
		public var class_setCubePosition:aMain_Physics_setCubePosition = null;
		public var class_setupSkybox:aMain_setupSkybox = null;
		
		
	
	
 
		
		//***********************************************************
		
		//controls
		public var mcDebug:MovieClip = null;
		public var mcStats:MovieClip = null;
		public var txtDebug:TextField;
		//***********************************************************

		//Away3D
		public var scene:Scene3D;
		public var camera:Camera3D;
		public var view:View3D;
		public var cameraTemp :Camera3D = null;
		public var cameraController:HoverController;
	
		//								 Away3D Helpers							/////////
		public var stats:AwayStats;
		
		//skybox
		public var _skyBox:SkyBox; 
		public var _skyBox2:SkyBox; 
		public var _skyBox3:SkyBox; 
		public var _skyBox4:SkyBox; 
		public var _skyBox5:SkyBox; 
		public var _skyBox6:SkyBox; 
		
		public var skyMesh:Mesh;
		//************************************************************
		//Lights
		public var lights:PointLight;
		public var _lightPicker : StaticLightPicker;
		//*************************************************************
		
		//materials
		public var cubeMaterial:TextureMaterial;
		public var topRockMaterial:TextureMaterial;
		public var stackedStoneMaterial:TextureMaterial;
		public var stackedStoneMaterial2:TextureMaterial;
		public var stackedStoneMaterial3:TextureMaterial;
		public var stackedStoneMaterial4:TextureMaterial;
		public var stackedStoneMaterial5:TextureMaterial;
		public var stackedStoneMaterial6:TextureMaterial;
		public var stackedStoneMaterial7:TextureMaterial;
		
		//*************************************************************
		
		//materials
		public var playerMesh:Mesh;
		//*************************************************************
		//physics
		public var physCycle:Boolean  = false;
		public var xnumber:int = 0;
		public var ynumber:int = 0;
		public var znumber:int = 0;
		
		public var debugDraw:AWPDebugDraw;
		public var physicsModeOn:Boolean = false;
		public var physicsWorld : AWPDynamicsWorld;
		public var boxShape : AWPBoxShape;// = new AWPBoxShape(15,15,15);
		public var timeStep : Number = 1.0 / 60;
		
		//public var boxShape : AWPBoxShape;// = new AWPBoxShape(15,15,15);
		public var shape : AWPCollisionShape;
		public var sphereBody : AWPRigidBody;
		
		public const collsionGround : int = 1;
		public const collsionBox : int = 2;
		public const collsionSphere : int = 16;
		public const collisionAll : int = -1;
		
		public var charBoxPhys: Mesh;
		public var groundRigidbody4 : AWPCollisionObject;
		
		public var ground2Rigidbody4 : AWPCollisionObject;
		public var ground2Rigidbody42 : AWPCollisionObject;
		public var ground2Rigidbody43 : AWPCollisionObject;
		public var ground2Rigidbody44 : AWPCollisionObject;
		
		public var ground2Rigidbody47 : AWPCollisionObject;
		public var ground3Rigidbody4 : AWPCollisionObject;
		//*************************************************************
		
		//camera view corners
		public var camView_minX_1:int = 0;
		public var camView_minY_1:int = 0;
		public var camView_minZ_1:int = 0;
		
		public var camView_maxX_1:int = 0;
		public var camView_maxY_1:int = 0;
		public var camView_maxZ_1:int = 0;
		
		public var camView_minX_2:int = 0;
		public var camView_minY_2:int = 0;
		public var camView_minZ_2:int = 0;
		
		public var camView_maxX_2:int = 0;
		public var camView_maxY_2:int = 0;
		public var camView_maxZ_2:int = 0;
		
		
		
		//*************************************************************
		//character
		public var CharacterIsInTheAir:Boolean = true;
		public var charDirection:int = 0; //north
		
		//*************************************************************
		//world
		public var worldArray:Array;
		//*************************************************************
		//key press
		public var keyRight : Boolean = false;
		public var keyLeft : Boolean = false;
		public var keyForward : Boolean = false;
		public var keyReverse : Boolean = false;
		public var keySpace : Boolean = false;
		//*************************************************************
		//characer has moved variables
		public var charMovedXPos:Boolean = false;
		public var charMovedXNeg:Boolean = false;
		
		public var charMovedYPos:Boolean = false;
		public var charMovedYNeg:Boolean = false;
		
		public var charMovedZPos:Boolean = false;
		public var charMovedZNeg:Boolean = false;
		public var drawFirstTime:Boolean = false;
		//*************************************************************
		//determine view points of drawable cubes
		public var negX:int = -5;
		public var negY:int = -3;
		public var negZ:int = -5;
		
		public var posX:int = 5;
		public var posY:int = 3;
		public var posZ:int = 5;
		//*************************************************************
		//character inventory/quick slot variables
		public var quickSlot:Array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0);
		public var quickSlotQty:Array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0);
		public var inventory:Array = new Array();
		
		public var quickSlotSelectedIconX:int = 0;
		public var quickSlotSelectedIconY:int = 0;
		
		public var clickMode:int = 0;
		
		public var currSlotSelect:int = 1;
		//*************************************************************
		//do physical cubes
		public var xnumber1:Number;// = setPrecision(v.sphereBody.x,1);
		public var xnumber2:Number;// = xnumber / 200;
		public var xnumber3:Number;// = setPrecision(xnumber2,0);
		
		public var ynumber1:Number;// = setPrecision(v.sphereBody.y,1);
		public var ynumber2:Number;// = ynumber / 200;
		public var ynumber3:Number;// = setPrecision(ynumber2,0);
		
		public var znumber1:Number;// = setPrecision(v.sphereBody.z,1);
		public var znumber2:Number;// = znumber / 200;
		public var znumber3:Number;// = setPrecision(znumber2,0);
		//change_text(String(ynumber3));
		public var mesh:Mesh;
		
		public var forceF:Vector3D;
		public var forceL:Vector3D;
		public var forceR:Vector3D;
		public var forceB:Vector3D;
		//*************************************************************
		//break block timer
		public var myTimer:Timer = new Timer(1000); // 1 second
		public var blockDownX:int = 0;
		public var blockDownY:int = 0;
		public var blockDownZ:int = 0;
		
		//*************************************************************
		//text field for quick slot qty
		public var invTextAmount1:TextField = new TextField();
		public var invTextAmount2:TextField = new TextField();
		public var invTextAmount3:TextField = new TextField();
		public var invTextAmount4:TextField = new TextField();
		public var invTextAmount5:TextField = new TextField();
		public var invTextAmount6:TextField = new TextField();
		public var invTextAmount7:TextField = new TextField();
		public var invTextAmount8:TextField = new TextField();
		//*************************************************************
		
		//icons
		[Embed(source="/../embeds/icons/stone3ico.jpg")]
		private var stone3icon:Class;
		
		[Embed(source="/../embeds/icons/stackedStoneico.jpg")]
		private var stackedStoneicon:Class;
		
		[Embed(source="/../embeds/icons/topRockico.jpg")]
		private var topRockicon:Class;
		
		private var stone3ico:Bitmap = new stone3icon();
		private var stackedStoneico:Bitmap = new stackedStoneicon();
		private var topRockico:Bitmap = new topRockicon();
		
		//*************************************************************
		
		
		//minimap variables
		public var topBlockType:Array = new Array();
		public var topBlockHeight:Array = new Array();
		public var minimapSprite:Sprite = new Sprite();
		
		
		//*************************************************************
		public var cube:Mesh = null;

		public var worldGen:String = "1";
		public var worldGenN:int = 1;
		public var worldGenDoOnce:Boolean = false;
		
		
		[Embed(source="/../embeds/itemslot.png")]
		private var itemslot:Class;
		
		public var slots:Bitmap = new itemslot();
		
		public var cubePressed:Boolean = false;
		public function aMain_Variables()
		{
			
		}
	}
}