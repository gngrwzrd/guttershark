package gs.tracking 
{
	import flash.external.ExternalInterface;
	import gs.util.printf;
	import gs.util.ObjectUtils;
	import gs.util.XMLUtils;
	
	/**
	 * The Omniture class fires omniture tracking events.
	 * 
	 * <p>You don't use this manually, create an instance
	 * and set it as the tracking.omniture property.</p>
	 * 
	 * @example Supported xml structure for tracking xml.
	 * <listing>	
	 * &lt;track id="trackTest1"&gt;
	 *     &lt;omniture&gt;
	 *         &lt;track&gt;
	 *             &lt;!--
	 *             By listing properties only it triggers the "track"
	 *             method on actionsource to be called.
	 *             
	 *             You can define any property / value here. The tracking
	 *             class enumerates all nodes and defines them on the
	 *             actionsource component before firing.
	 *             --&gt;
	 *             &lt;pageName&gt;test&lt;/pageName&gt;
	 *             &lt;prop6&gt;test2&lt;/prop6&gt;
	 *             &lt;eVar4&gt;hello&lt;/eVar4&gt;
	 *             &lt;events&gt;event20&lt;/events&gt;
	 *         &lt;/track&gt;
	 *     &lt;/omniture&gt;
	 * &lt;/track&gt;
	 * 
	 * &lt;track id="trackTest2"&gt;
	 *     &lt;omniture&gt;
	 *         &lt;track&gt;
	 *             &lt;pageName&gt;test&lt;/pageName&gt;
	 *             &lt;prop6&gt;test2&lt;/prop6&gt;
	 *             &lt;eVar4&gt;hello&lt;/eVar4&gt;
	 *             &lt;events&gt;event20&lt;/events&gt;
	 *             &lt;!--
	 *             Adding a "trackLink" node triggers the "trackLink" method on
	 *             the actionsource instance to be called.
	 *             --&gt;
	 *             &lt;trackLink&gt;
	 *                &lt;url&gt;http://www.whitehouse.ocom/&lt;/url&gt; &lt;!-- optional, if this isn't set it uses the "name" as the url --&gt; 
	 *                &lt;type&gt;o&lt;/type&gt; &lt;!-- o for custom, d for download, e for exit --&gt;
	 *                &lt;name&gt;adfasdf&lt;/name&gt;
	 *             &lt;/trackLink&gt;
	 *         &lt;/track&gt;
	 *      &lt;/omniture&gt;
	 * &lt;/track&gt;
	 * </listing>
	 * 
	 * <p><b>Examples</b> are in the guttershark repository.</p>
	 * 
	 * @see gs.tracking.Tracking
	 */
	public class Omniture
	{
		
		/**
		 * The actionsource component.
		 */
		public var actionsource:*;
		
		/**
		 * Whether or not to trace the calls that get sent.
		 */
		public var traces:Boolean;
		
		/**
		 * The function name to send the tracking id to
		 * through external interface. If this is set only
		 * the tracking id gets sent through EI.
		 */
		public var sendTrackingIDToEI:String;
		
		/**
		 * The function name to send the omniture tracking
		 * object to through external interface. If this is
		 * set, only the object gets passed through EI.
		 */
		public var sendTrackingObjectToEI:String;
		
		/**
		 * Constructor for Omniture instances.
		 * 
		 * @param _actionsource The actionsource component.
		 */
		public function Omniture(_actionsource:* = null):void
		{
			actionsource=_actionsource;
		}
		
		/**
		 * @private
		 * 
		 * Clears the actionsource variables.
		 */
		public function clearVars():void
		{
			if(!actionsource) return;
			var i:int=1;
			for(;i<50;i++)
			{
				actionsource["prop" +i]='';
				actionsource["eVar"+i]='';
			}
			i=1;
			for(;i<5;i++)actionsource["hier"+i] = '';
			actionsource.events='';
		}
		
		/**
		 * Sends a tracking call.
		 *
		 * @param id The id that will fire. 
		 * @param node The xml node for omniture.
		 * @param options Tracking options.
		 */
		public function track(id:String,node:XML,options:Object):void
		{
			if(!Tracking.assertions(options))return;
			if(sendTrackingIDToEI)
			{
				if(traces)
				{
					trace("Sending Tracking ID through External Interface to: ", sendTrackingIDToEI);
				}
				ExternalInterface.call(sendTrackingIDToEI,id);
				return;
			}
			var dyd:* =Tracking.getDynamicData(options);
			clearVars();
			if(XMLUtils.hasNode(node,"track"))
			{
				var n:XMLList=node.track;
				var prop:String;
				var value:String;
				var traceobj:Object={};
				var eiobj:Object={};
				var printfKey:String;
				var printfFormat:String;
				var printfValues:Array;
				for each(var x:XML in n.children())
				{
					prop=x.name();
					if(prop=="trackLink")continue;
					value=x.toString();
					if(XMLUtils.hasAttrib(x,"printfValuesKey"))
					{
						printfFormat=value;
						printfKey=x.@printfValuesKey;
						printfValues=dyd[printfKey];
						value=printf(printfFormat,printfValues);
						traceobj[prop]=value;
						eiobj[prop]=value;
					}
					else if(dyd[prop])value+=dyd[prop];
					traceobj[prop]=value;
					eiobj[prop]=value;
					if(actionsource) actionsource[prop]=value;
				}
				//if(!actionsource.pageName) trace("WARNING: The pageName propery wasn't set on the actionsource. Not firing track().");
				if(!XMLUtils.hasNode(n,"trackLink"))
				{
					if(traces)
					{
						trace("--track()--");
						ObjectUtils.dump(traceobj);
						trace("-----------");
					}
					if(sendTrackingObjectToEI)
					{
						if(traces)
						{
							trace("Sending Tracking Object through External Interface to: ", sendTrackingObjectToEI);
						}
						ExternalInterface.call(sendTrackingObjectToEI,eiobj);
						return;
					}
					if(actionsource) actionsource.track();
				}
				if(XMLUtils.hasNode(n,"trackLink"))
				{
					var urlNode:XML;
					var typeNode:XML;
					var nameNode:XML;
					var url:String;
					var type:String;
					var name:String;
					var trackLink:XML=new XML(n.trackLink);
					if(XMLUtils.hasNode(trackLink,"url")) urlNode=new XML(trackLink.url);
					if(XMLUtils.hasNode(trackLink,"type")) typeNode=new XML(trackLink.type);
					if(XMLUtils.hasNode(trackLink,"name")) nameNode=new XML(trackLink["name"]);
					if(XMLUtils.hasAttrib(urlNode,"printfValuesKey"))
					{
						printfKey=urlNode.@printfValuesKey;
						printfFormat=urlNode.toString();
						printfValues=dyd[printfKey];
						url=printf(printfFormat,printfValues);
					}
					else url=XMLUtils.walkForValue(n,"trackLink.url");
					if(XMLUtils.hasAttrib(typeNode,"printfValuesKey"))
					{
						printfKey=typeNode.@printfValuesKey;
						printfFormat=typeNode.toString();
						printfValues=dyd[printfKey];
						type=printf(printfFormat,printfValues);
					}
					else type=XMLUtils.walkForValue(n,"trackLink.type");
					if(XMLUtils.hasAttrib(nameNode,"printfValuesKey"))
					{
						printfKey=nameNode.@printfValuesKey;
						printfFormat=nameNode.toString();
						printfValues=dyd[printfKey];
						name=printf(printfFormat,printfValues);
					}
					else name=XMLUtils.walkForValue(n,"trackLink.name");
					if(!url||url=="")url=null;
					if(!type)type="o";
					if(traces) trace("--trackLink(" + ((url)?url:name) + "," + type + "," + name + ")--");
					if(actionsource) actionsource.trackLink(url,type,name);
				}
			}
		}
	}
}