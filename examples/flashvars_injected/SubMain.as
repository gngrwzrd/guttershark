package {
	
	import gs.model.Model;
	import gs.control.Document;
	import gs.util.FlashvarUtils;
	import gs.control.DocumentController;

	public class SubMain extends DocumentController
	{
		
		override protected function flashvarsForStandalone():Object
		{
			return {
				model:"submodel.xml"
			};
		}
		
		override protected function registerInstances():void
		{
			if(model)Model.set("SubMain",model);
			if(flashvars)FlashvarUtils.set("SubMainFlashvars",flashvars);
			Document.set("SubMain",this);
		}
		
		override protected function injectedFlashvarsKey():String
		{
			return "SubMainFlashvars";
		}
		
		override protected function setupComplete():void
		{
			trace("sub done!");
			trace(model.xml);
		}
	}
}