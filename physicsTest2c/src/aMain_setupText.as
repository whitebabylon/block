package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.*;
	import flash.display.Stage;
	public class aMain_setupText extends Sprite
	{
		private var debugtxt:TextField ;
		
		private var invTextAmount1:TextField ;
		private var invTextAmount2:TextField ;
		private var invTextAmount3:TextField ;
		private var invTextAmount4:TextField ;
		private var invTextAmount5:TextField ;
		private var invTextAmount6:TextField ;
		private var invTextAmount7:TextField ;
		private var invTextAmount8:TextField ;
		
		private var myFormat:TextFormat;
		
		public function aMain_setupText(texty:TextField, moviee:MovieClip, myStage:Stage)
		{
			debugtxt = new TextField();
			myFormat = new TextFormat();
			invTextAmount1 = new TextField();
			invTextAmount2 = new TextField();
			invTextAmount3 = new TextField();
			invTextAmount4 = new TextField();
			invTextAmount5 = new TextField();
			invTextAmount6 = new TextField();
			invTextAmount7 = new TextField();
			invTextAmount8 = new TextField();
			
			setupDebug();
			
			texty = debugtxt;
			moviee = new MovieClip();
			moviee.addChild(texty);
			myStage.addChild(moviee);
			debugtxt = texty;
			debugtxt.appendText("HEY");
			
		}
		
		private function setupDebug():void{
			
			myFormat.size = 12;
			debugtxt.defaultTextFormat = myFormat;
			debugtxt.text = "Initialized Text . . .\n"
			debugtxt.multiline = true;
			debugtxt.wordWrap = false;
			debugtxt.background = false;
			debugtxt.textColor = 0x3B3B3B;
			debugtxt.border = true;
			debugtxt.borderColor = 0x3B3B3B;
			debugtxt.x = 15;//50;
			debugtxt.y = 80;//200;
			debugtxt.width = 100;
			debugtxt.height = 400;	
			debugtxt.wordWrap = true;
			
			invTextAmount1.defaultTextFormat = myFormat;
			invTextAmount1.text = "Initialized Text . . .\n"
			invTextAmount1.multiline = true;
			invTextAmount1.wordWrap = false;
			invTextAmount1.background = false;
			invTextAmount1.textColor = 0x3B3B3B;
			invTextAmount1.border = true;
			invTextAmount1.borderColor = 0x3B3B3B;
			invTextAmount1.x = 0;//50;
			invTextAmount1.y = 0;//200;
			invTextAmount1.width = 42;
			invTextAmount1.height = 50;	
			invTextAmount1.wordWrap = true;
			
			invTextAmount2.defaultTextFormat = myFormat;
			invTextAmount2.text = "Initialized Text . . .\n"
			invTextAmount2.multiline = true;
			invTextAmount2.wordWrap = false;
			invTextAmount2.background = false;
			invTextAmount2.textColor = 0x3B3B3B;
			invTextAmount2.border = true;
			invTextAmount2.borderColor = 0x3B3B3B;
			invTextAmount2.x = 0;//50;
			invTextAmount2.y = 0;//200;
			invTextAmount2.width = 42;
			invTextAmount2.height = 50;	
			invTextAmount2.wordWrap = true;
			
			invTextAmount3.defaultTextFormat = myFormat;
			invTextAmount3.text = "Initialized Text . . .\n"
			invTextAmount3.multiline = true;
			invTextAmount3.wordWrap = false;
			invTextAmount3.background = false;
			invTextAmount3.textColor = 0x3B3B3B;
			invTextAmount3.border = true;
			invTextAmount3.borderColor = 0x3B3B3B;
			invTextAmount3.x = 0;//50;
			invTextAmount3.y = 0;//200;
			invTextAmount3.width = 42;
			invTextAmount3.height = 50;	
			invTextAmount3.wordWrap = true;
			
			invTextAmount4.defaultTextFormat = myFormat;
			invTextAmount4.text = "Initialized Text . . .\n"
			invTextAmount4.multiline = true;
			invTextAmount4.wordWrap = false;
			invTextAmount4.background = false;
			invTextAmount4.textColor = 0x3B3B3B;
			invTextAmount4.border = true;
			invTextAmount4.borderColor = 0x3B3B3B;
			invTextAmount4.x = 0;//50;
			invTextAmount4.y = 0;//200;
			invTextAmount4.width = 42;
			invTextAmount4.height = 50;	
			invTextAmount4.wordWrap = true;
			
			invTextAmount5.defaultTextFormat = myFormat;
			invTextAmount5.text = "Initialized Text . . .\n"
			invTextAmount5.multiline = true;
			invTextAmount5.wordWrap = false;
			invTextAmount5.background = false;
			invTextAmount5.textColor = 0x3B3B3B;
			invTextAmount5.border = true;
			invTextAmount5.borderColor = 0x3B3B3B;
			invTextAmount5.x = 0;//50;
			invTextAmount5.y = 0;//200;
			invTextAmount5.width = 42;
			invTextAmount5.height = 50;	
			invTextAmount5.wordWrap = true;
			
			invTextAmount6.defaultTextFormat = myFormat;
			invTextAmount6.text = "Initialized Text . . .\n"
			invTextAmount6.multiline = true;
			invTextAmount6.wordWrap = false;
			invTextAmount6.background = false;
			invTextAmount6.textColor = 0x3B3B3B;
			invTextAmount6.border = true;
			invTextAmount6.borderColor = 0x3B3B3B;
			invTextAmount6.x = 0;//50;
			invTextAmount6.y = 0;//200;
			invTextAmount6.width = 42;
			invTextAmount6.height = 50;	
			invTextAmount6.wordWrap = true;
			
			invTextAmount7.defaultTextFormat = myFormat;
			invTextAmount7.text = "Initialized Text . . .\n"
			invTextAmount7.multiline = true;
			invTextAmount7.wordWrap = false;
			invTextAmount7.background = false;
			invTextAmount7.textColor = 0x3B3B3B;
			invTextAmount7.border = true;
			invTextAmount7.borderColor = 0x3B3B3B;
			invTextAmount7.x = 0;//50;
			invTextAmount7.y = 0;//200;
			invTextAmount7.width = 42;
			invTextAmount7.height = 50;	
			invTextAmount7.wordWrap = true;
			
			invTextAmount8.defaultTextFormat = myFormat;
			invTextAmount8.text = "Initialized Text . . .\n"
			invTextAmount8.multiline = true;
			invTextAmount8.wordWrap = false;
			invTextAmount8.background = false;
			invTextAmount8.textColor = 0x3B3B3B;
			invTextAmount8.border = true;
			invTextAmount8.borderColor = 0x3B3B3B;
			invTextAmount8.x = 0;//50;
			invTextAmount8.y = 0;//200;
			invTextAmount8.width = 42;
			invTextAmount8.height = 50;	
			invTextAmount8.wordWrap = true;
			
		}
		
		public function change_text(myString:String):void{
			debugtxt.appendText(String(myString));
			//txtDebug.appendText(newText);
			debugtxt.appendText("\n")
			debugtxt.scrollV++;
		}
		
		public function return_invTextAmount1():TextField{
			return invTextAmount1;
		}
		public function return_invTextAmount2():TextField{
			return invTextAmount2;
		}
		public function return_invTextAmount3():TextField{
			return invTextAmount3;
		}
		public function return_invTextAmount4():TextField{
			return invTextAmount4;
		}
		public function return_invTextAmount5():TextField{
			return invTextAmount5;
		}
		public function return_invTextAmount6():TextField{
			return invTextAmount6;
		}
		public function return_invTextAmount7():TextField{
			return invTextAmount7;
		}
		public function return_invTextAmount8():TextField{
			return invTextAmount8;
		}
		
		
	}
}