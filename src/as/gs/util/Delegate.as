package gs.util
{

	/**
	 * The Delegate class creates closures for callbacks.
	 * 
	 * <p>
	 * <b>Credits:</b><br/>
	 * <a href="http://mbtrueman.com/">Michael Trueman</a>
	 * </p>
	 */
	public class Delegate
	{
		
		/**
		 * Creates a closure.
		 * 
		 * @param handler The function callback.
		 * @param args any arguments to pass to the handler.
		 */
		public static function create(handler:Function,...args):Function
        {
			return function(...innerArgs):void
			{
				handler.apply(this,innerArgs.concat(args));
			};
        }
	}
}