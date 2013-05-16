package
{
	include "aMain_Imports.as"
	public class aMain_Physics_setCubePosition
	{
		private var charBoxPhys: Mesh;
		private var groundRigidbody4 : AWPCollisionObject;
		
		private var ground2Rigidbody4 : AWPCollisionObject;
		private var ground2Rigidbody42 : AWPCollisionObject;
		private var ground2Rigidbody43 : AWPCollisionObject;
		private var ground2Rigidbody44 : AWPCollisionObject;
		
		private var ground2Rigidbody47 : AWPCollisionObject;
		private var ground3Rigidbody4 : AWPCollisionObject;
		private var CharacterIsInTheAir:Boolean;
		
		private var worldArray:Array;
		private var sphereBody:AWPRigidBody;
		
		public function aMain_Physics_setCubePosition(charBoxPhys2:Mesh, groundRigidbody42:AWPCollisionObject,
													  ground2Rigidbody422:AWPCollisionObject,  ground2Rigidbody432:AWPCollisionObject,
													  ground2Rigidbody442:AWPCollisionObject,  ground2Rigidbody472:AWPCollisionObject,
													  ground3Rigidbody42:AWPCollisionObject, CharacterIsInTheAir2:Boolean,
		worldArray2:Array, sphereBody2:AWPRigidBody)
			
		{
			groundRigidbody4 = groundRigidbody42;
			ground2Rigidbody4 = ground2Rigidbody42;
			ground2Rigidbody42 =  ground2Rigidbody422;
			ground2Rigidbody43 = ground2Rigidbody422;
			ground2Rigidbody44 = ground2Rigidbody442;
			ground2Rigidbody44 = ground2Rigidbody442;
			ground2Rigidbody47 = ground2Rigidbody472;
			ground3Rigidbody4 = ground3Rigidbody42;
			CharacterIsInTheAir = CharacterIsInTheAir2;
			sphereBody = sphereBody2;
			worldArray = worldArray2;
			
			doSetCubes();
		}
		
		private function doSetCubes():void{
			var xnumber:Number = setPrecision(sphereBody.x,1);
			var xnumber2:Number = xnumber / 15;
			var xnumber3:Number = setPrecision(xnumber2,0);
			
			var ynumber:Number = setPrecision(sphereBody.y,1);
			var ynumber2:Number = ynumber / 15;
			var ynumber3:Number = setPrecision(ynumber2,0);
			
			var znumber:Number = setPrecision(sphereBody.z,1);
			var znumber2:Number = znumber / 15;
			var znumber3:Number = setPrecision(znumber2,0);
			
			
			
			//***********************************************************************************************
			//***********************************************************************************************
			/**
			 * 
			 * 
			 * 
			 * */
			
			//***********************************************************************************************
			//***********************************************************************************************
			/**
			 * 
			 * 
			 * 
			 * */
			if (worldArray[xnumber3][(ynumber3-1)][znumber3] != null){
				charBoxPhys.x = xnumber3 * 15;
				charBoxPhys.y = (ynumber3-1) * 15;
				charBoxPhys.z = znumber3 * 15;
				
				groundRigidbody4.x = xnumber3 * 15;
				groundRigidbody4.y = (ynumber3-1) * 15;
				groundRigidbody4.z = znumber3 * 15;
				//change_text("HEY!!!!!!!!!!");
				CharacterIsInTheAir = false;
			} else 
				CharacterIsInTheAir = true;
			
			
			
			//***********************************************************************************************
			//***********************************************************************************************
			/**
			 * 
			 * 
			 * 
			 * */
			//***********************************************************************************************
			//***********************************************************************************************
			/**
			 * 
			 * 
			 * 
			 * */
			if (worldArray[xnumber3][(ynumber3-0)][znumber3] != null){
				charBoxPhys.x = xnumber3 * 15;
				charBoxPhys.y = (ynumber3-0) * 15;
				charBoxPhys.z = (znumber3-0) * 15;
				
				ground2Rigidbody4.x = xnumber3 * 15;
				ground2Rigidbody4.y = (ynumber3-0) * 15;
				ground2Rigidbody4.z = (znumber3-0) * 15;
				
				//change_text("HEY!!!!!!!!!!");
				
				
			}
			
			if (worldArray[xnumber3][(ynumber3-0)][znumber3-1] != null){
				charBoxPhys.x = xnumber3 * 15;
				charBoxPhys.y = (ynumber3-0) * 15;
				charBoxPhys.z = (znumber3-1) * 15;
				
				ground2Rigidbody42.x = xnumber3 * 15;
				ground2Rigidbody42.y = (ynumber3-0) * 15;
				ground2Rigidbody42.z = (znumber3-1) * 15;
				
			//	sharedMesh2.x = xnumber3 * 15;
			//	sharedMesh2.y = (ynumber3-0) * 15;
			//	sharedMesh2.z = (znumber3-1) * 15;
				
				//change_text("HEY");
				
				
				
			}
			
			if (worldArray[xnumber3][(ynumber3-0)][(znumber3+1)] != null){
				charBoxPhys.x = xnumber3 * 15;
				charBoxPhys.y = (ynumber3-0) * 15;
				charBoxPhys.z = (znumber3+1) * 15;
				
				ground2Rigidbody43.x = xnumber3 * 15;
				ground2Rigidbody43.y = (ynumber3-0) * 15;
				ground2Rigidbody43.z = (znumber3+1) * 15;
				
				//change_text("HEY!!!!!!!!!!");
			}
			//***********************************************************************************************
			//***********************************************************************************************
			/**
			 * 
			 * 
			 * 
			 * */
			if (worldArray[xnumber3-1][ynumber3-0][znumber3] != null){
				charBoxPhys.x = (xnumber3-1) * 15;
				charBoxPhys.y = (ynumber3-0) * 15;
				charBoxPhys.z = znumber3 * 15;
				
				ground2Rigidbody44.x = (xnumber3-1) * 15;
				ground2Rigidbody44.y = (ynumber3-0) * 15;
				ground2Rigidbody44.z = znumber3 * 15;

				
				
			}

			if (worldArray[xnumber3+1][ynumber3-0][znumber3] != null){
				charBoxPhys.x = (xnumber3+1) * 15;
				charBoxPhys.y = (ynumber3-0) * 15;
				charBoxPhys.z = znumber3 * 15;
				
				ground2Rigidbody47.x = (xnumber3+1) * 15;
				ground2Rigidbody47.y = (ynumber3-0) * 15;
				ground2Rigidbody47.z = znumber3 * 15;

				
				
			}

			if (worldArray[xnumber3][(ynumber3+1)][znumber3] != null){
				charBoxPhys.x = xnumber3 * 15;
				charBoxPhys.y = (ynumber3+1) * 15;
				charBoxPhys.z = znumber3 * 15;
				
				ground3Rigidbody4.x = xnumber3 * 15;
				ground3Rigidbody4.y = (ynumber3+1) * 15;
				ground3Rigidbody4.z = znumber3 * 15;
				
			}

			
			
		}
		//////////////////////////////////////////////////////////////////////////////////////////////////////
		/**											setPrecision;
		 * **************************************************************************************************/	
		private function setPrecision(number:Number, precision:int):Number {
			precision = Math.pow(10, precision);
			return (Math.round(number * precision)/precision);
		}/**end ************************************************************************/ //setup setPrecision
	}
}