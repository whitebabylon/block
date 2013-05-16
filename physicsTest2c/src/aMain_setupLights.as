package
{
	import away3d.lights.DirectionalLight;
	import away3d.lights.PointLight;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.materials.utils.*
	import flash.geom.Vector3D;
		public class aMain_setupLights
		{
			private var _light : PointLight = null//DirectionalLight;
			//private var _light : DirectionalLight = null//DirectionalLight;
			private var _lightPicker : StaticLightPicker = null;
			public function aMain_setupLights()
			{
				setupLightSun();
			}
			
			private function setupLightSun():void{
				_light = new PointLight();
				//_light = new DirectionalLight();
				//_light.direction = new Vector3D(0, -1, 0);
				_light.ambient = 0.2;
				_light.diffuse = 0.8;//.7;
				
				_light.color = 0xFFFFFF;
				//_light.radius = 0;
				//_light.r
				_light.castsShadows = true;
				//_light.fallOff = 99600;
				
				/*_light.y = 2500;
				_light.z = -1800;
				_light.x += 100;
				_light.color = 0x888888;
				_light.ambient = 0.9;
				_light.diffuse = 0.9;
			*/
			}
			public function returnLightSun():PointLight{
				return _light;
			}
			
			
		}
}