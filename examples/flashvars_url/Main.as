package
{
	
	import gs.control.DocumentController;
	import gs.util.ObjectUtils;
	
	public class Main extends DocumentController
	{
		
		public function Main()
		{
			super();
		}
		
		override protected function flashvarsForStandalone():Object
		{
			return  {
				model:"model.xml"
			};
		}
		
		override protected function setupComplete():void
		{
			trace(flashvars.model);
			trace(model.xml);
		}
	}
}
