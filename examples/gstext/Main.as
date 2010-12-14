package 
{
	import gs.control.DocumentController;
	import gs.preloading.Preloader;
	import gs.display.GSTextField;
	
	import flash.events.Event;
	import flash.text.*;
	
	public class Main extends DocumentController
	{
		
		public var t1:GSTextField;
		public var t2:GSTextField;
		
		override protected function flashvarsForStandalone():Object
		{
			return {model:"model.xml"};
		}
		
		override protected function startPreload():void
		{
			preloader=new Preloader();
			preloader.addEventListener(Event.COMPLETE,onPreloadComplete);
			preloader.addItems(model.getAssetsForPreload());
			preloader.start();
		}
		
		/*
		styleSheet:StyleSheet = null,
			textFormat:TextFormat = null, selectable:Boolean = false,
			multiline:Boolean = false, border:Boolean = false,
			embedFonts:Boolean = false, textValue:String = null,
			autoSize:String = "left", antiAliasType:String = "advance"):GSTextField
			*/
		override protected function onPreloadComplete(e:Event):void
		{
			super.onPreloadComplete(e);
			
			//with help from model.
			t1 = GSTextField.createWithModelHelp(model,"attr1");
			addChild(t1);
			
			
			
			
			
			//with raw parameters
			var ss:StyleSheet = model.getStyleSheetById("style1");
			t2 = GSTextField.create(ss);
			t2.text = model.strings.getStringFromID("string2");
			t2.y = 45;
			addChild(t2);
			
		}
	}
}