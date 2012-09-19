package gs.util 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;

	/**
	 * The DisplayListUtils class contains utlility methods for display
	 * list manipulation.
	 */
	final public class DisplayListUtils
	{
		
		/**
		 * Translate the display object container position in a new container.
		 */
		public static function localToLocal(from:DisplayObject, to:DisplayObject):Point
		{
			var point:Point=new Point();
			point=from.localToGlobal(point);
			point=to.globalToLocal(point);
			return point;
		}
		
		/**
		 * Set the scale of an object - updates the x and y.
		 * 
		 * @param target The target item to scale. 
		 * @param scale	The scale percentage.
		 */
		public static function scale(target:DisplayObject,scale:Number):void
		{
			target.scaleX=scale;
			target.scaleY=scale;
		}

		/**
		 * Scale target item to fit within target confines.
		 * 
		 * @param target The item to be aligned.
		 * @param targetW The target item width.
		 * @param targetH The target item height.
		 * @param center Center the object within the targetW and targetH.
		 */
		public static function scaleToFit(target:DisplayObject,targetW:Number,targetH:Number,center:Boolean=false):void
		{
			if(target.width<targetW && target.width>target.height)
			{
				target.width=targetW;
				target.scaleY=target.scaleX;
			}
			else
			{
				target.height=targetH;
				target.scaleX=target.scaleY;
			}
			if(center) 
			{
				target.x=int(targetW/2-target.width/2);
				target.y=int(targetH/2-target.height/2);
			}
		}

		/**
		 * Scale while retaining original w:h ratio.
		 * 
		 * @param target The item to be scaled.
		 * @param targetW The target item width.
		 * @param targetH The target item height.
		 */
		public static function scaleRatio(target:DisplayObject,targetW:Number,targetH:Number):void
		{
			if(targetW/targetH<target.height/target.width) targetW=targetH * target.width / target.height; 
			else targetH=targetW * target.height / target.width;
			target.width=targetW;
			target.height=targetH;
		}
		
		/**
		 * Scale proportionally.
		 * 
		 * @param mc The target display object to be scaled.
		 * @param maxW The target width.
		 * @param maxH The target height.
		 * @param center Whether or not to center the display object in the new bounds.
		 */
		public static function scaleProportionally(mc:DisplayObject, maxW:Number, maxH:Number=0, scaleUp:Boolean = false, scaleDown:Boolean = true, center:Boolean = true):void {
			if((mc.width < maxW || mc.height < maxH) && scaleUp) {
				maxH = maxH == 0 ? maxW : maxH;
				mc.width = maxW;
				mc.height = maxH;
				mc.scaleX < mc.scaleY ? mc.scaleY = mc.scaleX : mc.scaleX = mc.scaleY;
			}
			if((mc.width > maxW || mc.height > maxH) && scaleDown) {
				maxH = maxH == 0 ? maxW : maxH;
				mc.width = maxW;
				mc.height = maxH;
				mc.scaleX < mc.scaleY ? mc.scaleY = mc.scaleX : mc.scaleX = mc.scaleY;
			}
			if(center) {
				mc.x = maxW/2 - mc.width/2;
				mc.y = maxH/2 - mc.height/2;
			}
		}
		
		/**
		 * Flip an object on the x or y axis.
		 * 
		 * @param obj The object to flip
		 * @param axis The axis to flip on - "x" or "y"
		 */
		public static function flip(obj:Object,axis:String="y"):void
		{
			if(axis != "x" && axis != "y") 
			{
				throw new Error("Error: flip expects axis param: 'x' or 'y'.");
				return;
			}
			var _scale:String=axis == "x" ? "scaleX" :"scaleY";
			var _prop:String=axis == "x" ? "width" : "height";
			obj[_scale]=-obj[_scale];
			obj[axis] += obj[_prop];
		}
		
		/**
		 * Removes all children from a clip.
		 */
		public static function removeAllChildren(target:DisplayObjectContainer):void {
			if(target.numChildren<1) return;
			var i:int=0;
			var l:int=target.numChildren;
			for(;i<l;i++)target.removeChildAt(0);
		}
	}
}