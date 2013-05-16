package
{
	import away3d.cameras.Camera3D;
	import away3d.cameras.SpringCam;
	import away3d.cameras.lenses.*;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	import away3d.controllers.*;
	import away3d.controllers.HoverController;
	import away3d.debug.AwayStats;
	import away3d.filters.VBlurFilter3D;
	
	import flash.geom.Vector3D;
	
	import flash.display.Stage;
	
	public class aMain_setupAway3D
	{
		private var scene:Scene3D;
		private var camera:Camera3D;
		private var view:View3D;
		private var cameraController:HoverController;
		private var stats:AwayStats;
		private var antiAlias:Number = 0;
	
		public function aMain_setupAway3D( )
		{
			setupView();
			setupStats();
			//views = view;
			//statss = stats;
			//cameraTemp = views.camera;
			//cameraTemp.lens.far = 15 * 6000
			//addChild(v.view);
			//myStage.addChild(views);
			//myStage.addChild(statss);
			

			

		} //end main setup
		
		private function setupView():void {
			scene = new Scene3D();
			
			
			// Setup camera
			camera = new Camera3D();
			camera.y += 0
			camera.lens.far = 200*4;//cameraViewDistance;
			camera.lens.near = 1;
			// Setup view
			view = new View3D();
			view.scene = scene;
			view.camera = camera;
			view.backgroundColor = 0x000000;
			//view.antiAlias
			//view.blendMode = "BlendMode.MULTIPLY";
			view.antiAlias = antiAlias;
			//setup the camera
			//view.camera.z = -600;
			view.camera.y = 0;
			view.camera.lookAt(new Vector3D());
			//away3d.cameras.lenses.FreeMatrixLens
			//view.camera.lens = new PerspectiveLens(90);
			view.camera.lens.far = 200*15
			//view.camera.lens.
			//return view;
			
		} //end setup view
		
		
		private function setupStats():void{
			stats = new AwayStats(view,true);
			stats.x = 5;
			stats.y = 5;
			//return stats;
		} //end setup stats
		
		public function returnView():View3D{
			return view;
		} //end return view
		
		public function returnStats():AwayStats{
			return stats;
		} //end return stats
		
		public function returnCamera():Camera3D{
			return view.camera;
		} //end return stats
		
	} //end class
} // end package