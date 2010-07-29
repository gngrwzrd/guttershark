package gs.util
{

	/**
	 * Delegate.
	 */
	public class Delegate
	{
		
		/**
		 * Create's a closure.
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