package {
	
	import gs.control.DocumentController;
	import gs.managers.AssetManager;
	import gs.preloading.Preloader;
	import gs.util.FlashvarUtils;

	import flash.events.Event;

	public class Main extends DocumentController
	{
		
		public var submain:*;
		
		override protected function flashvarsForStandalone():Object
		{
			return  {
				model:"model.xml"
			};
		}
		
		override protected function startPreload():void
		{
			//inject flashvars for SubMain document controller.
			var submainFlashvars:Object = {
				model:"submodel.xml"
			};
			FlashvarUtils.set("SubMainFlashvars",submainFlashvars);
			
			preloader = new Preloader();
			preloader.addItems(model.getAssetsForPreload());
			preloader.addEventListener(Event.COMPLETE,onPreloadComplete);
			preloader.start();
		}
		
		override protected function onPreloadComplete(e:Event):void
		{
			trace("complete!");
			trace(model.xml);
			
			var sub:* = AssetManager.getSWF("submain");
			addChild(sub);
		}
	}
}
