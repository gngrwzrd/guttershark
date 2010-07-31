package
{
	import flash.display.MovieClip;
	import gs.control.DocumentController;

	public class Main extends DocumentController
	{
		
		public var clip:MovieClip;
		
		override protected function flashvarsForStandalone():Object
		{
			return {model:"model.xml"};
		}
		
		override protected function onModelReady():void
		{
			super.onModelReady();
			
			//these two lines are the same, it's all about
			//which object/xml you point to.
			model.applyProperties(this,model.xml.properties);
			model.applyProperties(clip,model.xml.properties.clip);
		}
	}
}