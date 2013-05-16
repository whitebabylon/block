package {
	import away3d.entities.Mesh;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.FullScreenEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard; 
	
	import flash.display.Bitmap;
	//import flash.
	[SWF(backgroundColor="0x000000")]
	public class physicsTest2 extends Sprite {
		
		public var square:Sprite; 
		private var amain:aMain;
		
		[Embed(source="/../embeds/fullscreen_btn.jpg")]
		private var titlebtn:Class;
		
		[Embed(source="/../embeds/fullscreen_btn_hov.jpg")]
		private var titlebtnHOV:Class;
		
		[Embed(source="/../embeds/loadBack.jpg")]
		private var loadBack:Class;
		
		private var box:Bitmap = new titlebtn();
		private var box2:Bitmap = new titlebtnHOV();
		
		private var loadScreen:Bitmap = new loadBack();
		
		
		public function physicsTest2() {
			this.addEventListener(Event.ENTER_FRAME, tempLoop);
		}
		
		private function init() : void {
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.quality = StageQuality.HIGH;
			stage.frameRate = 60;
			//stage.color = 0x000000;
			square = new Sprite();
			square.addChild(box);
			addChild(square);

			box.x = stage.stageWidth/2-square.width/2;
			box.y = stage.stageHeight/2-square.height/2;
			box2.x = stage.stageWidth/2-square.width/2;
			box2.y = stage.stageHeight/2-square.height/2;
			square.addEventListener(MouseEvent.CLICK, gotoFs);
			square.addEventListener(MouseEvent.MOUSE_OVER, gotoFs2);
			square.addEventListener(MouseEvent.MOUSE_OUT, gotoFs3);
			
			
			
			
		}
		
		
		public function gotoFs(e:MouseEvent):void
		{
			square.addChild(loadScreen);
			square.removeChild(box2);
			loadScreen.width = stage.stageWidth;
			loadScreen.height = stage.stageHeight;
			
			loadScreen.x = stage.stageWidth/2-square.width/2;
			loadScreen.y = stage.stageHeight/2-square.height/2;
			
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			
			startCurrentDemo();
			stage.addEventListener(FullScreenEvent.FULL_SCREEN_INTERACTIVE_ACCEPTED, fullevent);
		}
		public function gotoFs2(e:MouseEvent):void
		{
			square.addChild(box2);
			square.removeChild(box);
		}
		public function gotoFs3(e:MouseEvent):void
		{
			square.addChild(box);
			square.removeChild(box2);
		}
		private function fullevent(e:FullScreenEvent):void{
			stage.mouseLock = true;
		
		}
		
		
		private function startCurrentDemo() : void {
			amain = new aMain();
			
			this.addChild(amain);
			square.visible = false;
		}
	
		private function tempLoop(event : Event) : void {
			if ( stage.stageWidth > 0 && stage.stageHeight > 0 ) {
				this.removeEventListener(Event.ENTER_FRAME, tempLoop);
				init();
			}
		}
	}
}