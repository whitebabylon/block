package
{
	include "aMain_Imports.as"
	public class aMain_setupPhysics
	{
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
		public var playerMesh:Mesh;
		
		[Embed(source="/../embeds/trinket_diffuse3.jpg")]
		public static var TrinketDiffuse:Class;
		[Embed(source="/../embeds/trinket_specular3.jpg")]
		public static var TrinketSpecular:Class;
		[Embed(source="/../embeds/trinket_normal3.jpg")]
		public static var TrinketNormals:Class;
		
		private var cubeMaterial:TextureMaterial;
		public function aMain_setupPhysics(playerMeshCarry:Mesh, lights:StaticLightPicker):void
		{
			cubeMaterial = new TextureMaterial(Cast.bitmapTexture(TrinketDiffuse));
			//cubeMaterial.specularMap = Cast.bitmapTexture(TrinketSpecular);
			//cubeMaterial.normalMap = Cast.bitmapTexture(TrinketNormals);
			cubeMaterial.lightPicker = lights;
			cubeMaterial.mipmap = false;
			charBoxPhys = playerMeshCarry
			playerMesh = playerMeshCarry;
			init();
		}
		
		private function init():void{
			startPhysics();
		}
		private function startPhysics():void{
			var body : AWPRigidBody;
			
			physicsWorld = AWPDynamicsWorld.getInstance();
			physicsWorld.initWithDbvtBroadphase();	
			boxShape = new AWPBoxShape(200,200,200);
			//debugDraw = new AWPDebugDraw(view, physicsWorld);
			shape =new AWPBoxShape(185, 185, 185);
			sphereBody = new AWPRigidBody(shape, playerMesh, 1);
			physicsWorld.addRigidBodyWithGroup(sphereBody, collsionSphere, collsionGround | collsionBox);
			
			
			//sphereBody.rotationY = 90;
			sphereBody.gravity = new Vector3D(0, -2000, 0);
			sphereBody.position = new Vector3D( playerMesh.x,  playerMesh.y ,  playerMesh.z);
			
			
			charBoxPhys = new Mesh(new CubeGeometry(200, 200, 200), cubeMaterial);
			//view.scene.addChild(charBoxPhys);
			var groundShape3 : AWPBoxShape = new AWPBoxShape(200,200,200);
			groundRigidbody4  = new AWPRigidBody(groundShape3, charBoxPhys, 0);
			
			ground2Rigidbody4 = new AWPCollisionObject(groundShape3, charBoxPhys,0);
			
			ground2Rigidbody42 = new AWPCollisionObject(groundShape3, playerMesh,0);
			ground2Rigidbody43 = new AWPCollisionObject(groundShape3, charBoxPhys,0);
			ground2Rigidbody44 =  new AWPCollisionObject(groundShape3, charBoxPhys,0);
			
			ground2Rigidbody47 = new AWPCollisionObject(groundShape3, charBoxPhys,0);
			
			ground3Rigidbody4 =  new AWPCollisionObject(groundShape3, charBoxPhys,0);
			
			//groundRigidbody4.x = playerMesh.x;
			//groundRigidbody4.y = playerMesh.y - 22.5 - 20*200;
			//groundRigidbody4.z = playerMesh.z;
			groundRigidbody4.friction = 0;
			
			groundRigidbody4.friction = 0;
			
			ground2Rigidbody4.friction = 0;
			
			ground2Rigidbody42.friction = 0;
			ground2Rigidbody43.friction = 0;
			ground2Rigidbody44.friction = 0;
			
			ground2Rigidbody47.friction = 0;
			
			ground3Rigidbody4.friction = 0;
			
			physicsWorld.addCollisionObject(groundRigidbody4);
			physicsWorld.addCollisionObject(ground2Rigidbody4);
			physicsWorld.addCollisionObject(ground2Rigidbody42);
			physicsWorld.addCollisionObject(ground2Rigidbody43);
			physicsWorld.addCollisionObject(ground2Rigidbody44);
			physicsWorld.addCollisionObject(ground2Rigidbody47);
			physicsWorld.addCollisionObject(ground3Rigidbody4);
			
		}
		
	}
}