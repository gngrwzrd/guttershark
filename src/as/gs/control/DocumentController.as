package gs.control
{
	import gs.events.AssetErrorEvent;
	import gs.managers.AssetManager;
	import gs.model.Model;
	import gs.preloading.Asset;
	import gs.preloading.Preloader;
	import gs.util.FlashvarUtils;
	import gs.util.QueryString;
	import gs.util.StageRef;
	import gs.util.StringUtils;
	import gs.util.Strings;

	import flash.events.Event;

	/**
	 * The DocumentController class is a document class
	 * that contains default startup logic.
	 * 
	 * <p><b>Examples</b> are in the <a target="_blank" href="http://gitweb.codeendeavor.com/?p=guttershark.git;a=summary">guttershark</a>
	 * repository. Most of the examples in the repository use the document controller.</p>
	 */
	public class DocumentController extends Document
	{
		
		/**
		 * Flashvars.
		 */
		protected var flashvars:Object;
		
		/**
		 * A model instance.
		 */
		protected var model:Model;
		
		/**
		 * A preloader instance.
		 */
		protected var preloader:Preloader;
		
		/**
		 * Whether or not the flashvars are being
		 * loaded from a url.
		 */
		private var loadingFlashvars:Boolean;
		
		/**
		 * Used to read querystring for flashvarsurl.
		 */
		private var qs:QueryString;
		
		/**
		 * Constructor for DocumentController instances.
		 * 
		 * @example
		 * <listing>	
		 * public function DocumentController()
		 * {
		 *     initStage();
		 *     initFlashvars();
		 *     initModel();
		 *     initPaths();
		 * } 
		 * </listing>
		 */
		public function DocumentController()
		{
			qs=new QueryString();
			loadingFlashvars=false;
			initStage();
			initFlashvars();
			if(loadingFlashvars) return;
			initModel();
			initPaths();
		}
		
		/**
		 * A hook you can use to tell the document controller
		 * to grab the flashvars object from the FlashvarUtils
		 * class as an "injected flashvar".
		 * 
		 * <p>Look at the docs for initFlashvars for how the
		 * injectedFlashvarsKey is used to get custom flashvars.</p>
		 */
		protected function injectedFlashvarsKey():String
		{
			return null;
		}
		
		/**
		 * A hook you can use to override what key is used
		 * when the model is registered with Model.set.
		 * 
		 * <p>The default is <strong>main</strong></p>
		 */
		protected function registerModelKey():String
		{
			return "main";
		}
		
		/**
		 * A hook you can use to override what key is used
		 * when the flashvars object is register with FlashvarUtils.set.
		 * 
		 * <p>The default is <strong>main</strong></p>
		 */
		protected function registerFlashvarsKey():String
		{
			return "main";
		}
		
		/**
		 * A hook you can use to override what key is used
		 * when the DocumentController is registered with
		 * Document.set.
		 * 
		 * <p>The default is <strong>main</strong></p>
		 */
		protected function registerDocumentKey():String
		{
			return "main";
		}
		
		/**
		 * Returns an object for standalone flashvars.
		 * 
		 * @example
		 * <listing>	
		 * protected function flashvarsForStandalone():Object
		 * {
		 *     return {};
		 * }
		 * </listing>
		 */
		protected function flashvarsForStandalone():Object
		{
			return {};
		}
		
		/**
		 * Initialize the StageRef.stage property.
		 * 
		 * @example
		 * <listing>	
		 * protected function initStage():void
		 * {
		 *     StageRef.stage=stage;
		 * }
		 * </listing>
		 */
		protected function initStage():void
		{
			StageRef.stage=stage;
		}

		/**
		 * Initialize flashvars.
		 * 
		 * @example
		 * <listing>	
		 * protected function initFlashvars():void
		 * {
		 *     if(qs.flashvarsurl)loadFlashvars();
		 *     else
		 *     {
		 *         if(injectedFlashvarsKey())flashvars=FlashvarUtils.get(injectedFlashvarsKey());
		 *         if(!flashvars)flashvars=FlashvarUtils.getFlashvars(this,flashvarsForStandalone);
		 *     }
		 * }
		 * </listing>
		 */
		protected function initFlashvars():void
		{
			if(qs.flashvarsurl)loadFlashvars();
			else
			{
				if(injectedFlashvarsKey())flashvars=FlashvarUtils.get(injectedFlashvarsKey());
				if(!flashvars)flashvars=FlashvarUtils.getFlashvars(this,flashvarsForStandalone);
			}
		}
		
		/**
		 * Loads flashvars when a querystring variable is available.
		 */
		private function loadFlashvars():void
		{
			loadingFlashvars=true;
			var u:String=StringUtils.encodeURI2(qs.flashvarsurl);
			var flv:Asset=new Asset(u,"flashvars","json");
			preloader=new Preloader();
			preloader.addItems([flv]);
			preloader.addEventListener(Event.COMPLETE,onFlashvarsLoaded);
			preloader.addEventListener(AssetErrorEvent.ERROR,onFlashvarError);
			preloader.start();
		}
		
		/**
		 * When the flashvar url fails to load.
		 */
		private function onFlashvarError(e:AssetErrorEvent):void
		{
			preloader.dispose();
			preloader=null;
			loadingFlashvars=false;
			trace("WARNING: onFlashvarError() occured. Could not load flashvars from url.");
			initModel();
			initPaths();
		}
		
		/**
		 * After the flashvars have loaded from a URL.
		 */
		private function onFlashvarsLoaded(e:Event):void
		{
			loadingFlashvars=false;
			flashvars=AssetManager.getJSON("flashvars");
			preloader.dispose();
			preloader=null;
			initModel();
			initPaths();
		}

		/**
		 * Initialize paths with the model.
		 * 
		 * @example
		 * <listing>	
		 * protected function initPaths():void
		 * {
		 *     if(model)
		 *     {
		 *         model.addPath("audio",(flashvars.audio)?flashvars.audio:"../audio/");
		 *         model.addPath("bmp",(flashvars.bmp)?flashvars.bmp:"../bmp/");
		 *         model.addPath("css",(flashvars.css)?flashvars.css:"../css/");
		 *         model.addPath("flv",(flashvars.flv)?flashvars.flv:"../flv/");
		 *         model.addPath("js",(flashvars.js)?flashvars.js:"../js/");
		 *         model.addPath("swf",(flashvars.swf)?flashvars.swf:"../swf/");
		 *         model.addPath("xml",(flashvars.xml)?flashvars.xml:"../xml/");
		 *     }
		 * }
		 * </listing>
		 */
		protected function initPaths():void
		{
			if(model)
			{
				model.addPath("audio",(flashvars.audio)?flashvars.audio:"../audio/");
				model.addPath("bmp",(flashvars.bmp)?flashvars.bmp:"../bmp/");
				model.addPath("css",(flashvars.css)?flashvars.css:"../css/");
				model.addPath("flv",(flashvars.flv)?flashvars.flv:"../flv/");
				model.addPath("js",(flashvars.js)?flashvars.js:"../js/");
				model.addPath("swf",(flashvars.swf)?flashvars.swf:"../swf/");
				model.addPath("xml",(flashvars.xml)?flashvars.xml:"../xml/");
			}
		}
		
		/**
		 * Create and load a model.
		 * 
		 * @example
		 * <listing>	
		 * protected function initModel():void
		 * {
		 *     model=new Model();
		 *     if(flashvars.model)model.load(flashvars.model,onModelReady,onModelIOError,onModelSecurityError);
		 *     else onModelReady();
		 * }
		 * </listing>
		 */
		protected function initModel():void
		{
			if(loadingFlashvars)return;
			model=new Model();
			if(flashvars.model)model.load(flashvars.model,onModelReady,onModelIOError,onModelSecurityError);
			else onModelReady();
		}
		
		/**
		 * When a model is ready.
		 * 
		 * @example
		 * <listing>
		 * protected function onModelReady():void
		 * {
		 *     setupComplete();
		 *     startPreload();
		 * }	
		 * </listing>
		 */
		protected function onModelReady():void
		{
			setupComplete();
			startPreload();
		}
		
		/**
		 * A hook you can override to catch io loading errors for the model.
		 */
		protected function onModelIOError():void
		{
			trace("WARNING: onModelIOError() occured but it's not overridden.");
		}
		
		/**
		 * A hook you can override to catch security errors for the model.
		 */
		protected function onModelSecurityError():void
		{
			trace("WARNING: onModelSecurityError() occured but it's not overridden.");
		}
		
		/**
		 * A hook to start preloading.
		 */
		protected function startPreload():void{}
		
		/**
		 * Override this to write preload complete logic.
		 * 
		 * @example
		 * <listing>	
		 * protected function onPreloadComplete(e:Event):void
		 * {
		 *     model.registerFonts();
		 *     initStrings();
		 *     registerInstances();
		 * }
	     * </listing>
		 */
		protected function onPreloadComplete(e:Event):void
		{
			model.registerFonts();
			initStrings();
			registerInstances();
		}
		
		/**
		 * A hook you can override to register instances with their
		 * classes.
		 * 
		 * @example
		 * <listing>	
		 * protected function registerInstances():void
		 * {
		 *      if(model)Model.set(registerModelKey(),model);
		 *      if(flashvars)FlashvarUtils.set(registerFlashvarsKey(),flashvars);
		 *      Document.set(registerDocumentKey(),this);
		 * }
		 * </listing>
		 */
		protected function registerInstances():void
		{
			if(model)Model.set(registerModelKey(),model);
			if(flashvars)FlashvarUtils.set(registerFlashvarsKey(),flashvars);
			Document.set(registerDocumentKey(),this);
		}
		
		/**
		 * Initialize a Strings instance on the model.
		 * 
		 * <p>If an asset is available in the AssetManager called
		 * "strings" it will initialize the model.strings property for you</p>
		 * 
		 * @example
		 * <listing>	
		 * protected function initStrings():void
		 * {
		 *     if(AssetManager.isAvailable("strings") && model)model.strings=new Strings(AssetManager.getXML("strings"));
		 * }
		 * </listing>
		 */
		protected function initStrings():void
		{
			if(AssetManager.isAvailable("strings") && model)model.strings=new Strings(AssetManager.getXML("strings"));
		}
		
		/**
		 * A hook called just before the startPreload method is called.
		 * 
		 * <p>This is called after initStage, initFlashvars, and
		 * after a model has loaded.</p>
		 */
		protected function setupComplete():void{}
		
		/**
		 * Dispose of this document controller.
		 */
		override public function dispose():void
		{
			model.dispose();
			preloader.dispose();
			preloader=null;
			model=null;
			flashvars=null;
		}
	}
}