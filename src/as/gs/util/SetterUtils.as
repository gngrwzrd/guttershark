package gs.util 
{
	import gs.model.Model;
	import gs.util.filters.FilterUtils;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * The SetterUtils class contains utility methods
	 * that decrease amount of code you have to write for setting the same
	 * properties on multiple objects.
	 * 
	 * <p>All methods can be used in two ways.</p>
	 * 
	 * @example Two uses for each method:
	 * <listing>	
	 * var mc1,mc2,mc3:MovieClip;
	 * var mcref:Array=[mc1,mc2,mc3];
	 * 
	 * SetterUtils.visible(true,mc1,mc2,mc3); //rest style.
	 * 
	 * //array style - this is nice when you want to group
	 * //display objects to you can quickly toggle a property.
	 * SetterUtils.visible(false,mcref);
	 * </listing>
	 * 
	 * <script src="http://mint.codeendeavor.com/?js" type="text/javascript"></script>
	 */
	final public class SetterUtils 
	{
		
		/**
		 * Set the buttonMode property on all objects provided.
		 * 
		 * @param value The value to set the buttonMode property to.
		 * @param ...objs An array of objects that have the buttonMode property.
		 */
		public static function buttonMode(value:Boolean, ...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array) a=objs[0];
			l=a.length;
			for(;k<l;k++)Sprite(a[int(k)]).buttonMode=value;
		}
		
		/**
		 * Set the buttonMode, and useHandCursor property on all obejcts provided.
		 * 
		 * @param value The value to set buttonMode and useHand to.
		 * @param ...objs Rest style, array of objects.
		 */
		public static function buttonModeAndHand(value:Boolean,...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array) a=objs[0];
			l=a.length;
			for(;k<l;k++)Sprite(a[int(k)]).buttonMode = Sprite(a[int(k)]).useHandCursor = value;
		}
		
		/**
		 * Set the visible property on all objects provided.
		 * 
		 * @param value The value to set the visible property to.
		 * @param ...objs An array of objects with the visible property.
		 */
		public static function visible(value:Boolean, ...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			for(;k<l;k++)DisplayObject(a[int(k)]).visible=value;
		}
		
		/**
		 * Set the alpha property on all objects provided.
		 * 
		 * @param value The value to set the alpha to.
		 * @param ...objs An array of objects with an alpha property.
		 */
		public static function alpha(value:Number, ...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			for(;k<l;k++)DisplayObject(a[int(k)]).alpha=value;
		}
		
		/**
		 * Set the cacheAsBitmap property on all objects provided.
		 * 
		 * @param value The value to set the cacheAsBitmap property to.
		 * @param ...objs An array of objects with the cacheAsBitmap property.
		 */
		public static function cacheAsBitmap(value:Boolean, ...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			for(;k<l;k++)DisplayObject(a[int(k)]).cacheAsBitmap=value;
		}
		
		/**
		 * Set the useHandCursor property on all objects provided.
		 * 
		 * @param value The value to set the useHandCursor property to.
		 * @param ...objs An array of objects with the useHandCursor property.
		 */
		public static function useHandCursor(value:Boolean, ...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			for(;k<l;k++)Sprite(a[int(k)]).useHandCursor=value;
		}	
		
		/**
		 * Set the mouseChildren property on all objects provided.
		 * 
		 * @param value The value to set the mouseChildren property to on all objects.
		 * @param ...objs An array of objects with the mouseChildren property.
		 */
		public static function mouseChildren(value:Boolean,...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			for(;k<l;k++)DisplayObjectContainer(a[int(k)]).mouseChildren=value;
		}
		
		/**
		 * Set the mouseEnabled property on all objects provided.
		 * 
		 * @param value The value to set the mouseEnabled property to on all objects.
		 * @param ..objs An array of objects with the mouseEnabled property.
		 */
		public static function mouseEnabled(value:Boolean,...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			for(;k<l;k++)InteractiveObject(a[int(k)]).mouseEnabled=value;
		}
		
		/**
		 * Set tab index's on multiple textfields.
		 * 
		 * @param ...fields The textfields to set tabIndex on.
		 */
		public static function tabIndex(...fields:Array):void
		{
			var l:int;
			var k:int=0;
			if(fields[0] is Array)fields=fields[0];
			l=fields.length;
			for(;k<l;k++)InteractiveObject(fields[int(k)]).tabIndex=++k;
		}
		
		/**
		 * Set the tabChildren property on all objects passed.
		 * 
		 * @param The value to set the tabChildren property to on all objects.
		 * @param ..objs An array of objects with the tabChildren property.
		 */
		public static function tabChildren(value:Boolean,...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			for(;k<l;k++)DisplayObjectContainer(a[int(k)]).tabChildren=value;
		}
		
		/**
		 * Set the tabEnabled property on all objects passed.
		 * 
		 * @param The value to set the tabChildren property to on all objects.
		 * @param ..objs An array of objects with the tabEnabled property.
		 */
		public static function tabEnabled(value:Boolean,...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			for(;k<l;k++)InteractiveObject(a[int(k)]).tabEnabled=value;
		}
		
		/**
		 * Set the autoSize property on multiple textfields.
		 * 
		 * @param value The autoSize value.
		 * @param ...fields The textfields to set the autoSize property on.
		 */
		public static function autoSize(value:String, ...fields:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=fields;
			if(fields[0] is Array)a=fields[0];
			l=a.length;
			for(;k<l;k++)TextField(a[int(k)]).autoSize=value;
		}
		
		/**
		 * Set the x property on multiple objects.
		 * 
		 * @param value The x value.
		 * @param ..objs An array of objects with the x property.
		 */
		public static function x(value:Number, ...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			for(;k<l;k++)a[int(k)].x=value;
		}
		
		/**
		 * Set the y property on multiple objects.
		 * 
		 * @param value The y value.
		 * @param ..objs An array of objects with the y property.
		 */
		public static function y(value:Number, ...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			for(;k<l;k++)a[int(k)].y=value;
		}
		
		/**
		 * Set the width property on multiple objects.
		 * 
		 * @param value The width value.
		 * @param ..objs An array of objects with the width property.
		 */
		public static function width(value:Number, ...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			for(;k<l;k++)a[int(k)].width=value;
		}
		
		/**
		 * Set the height property on multiple objects.
		 * 
		 * @param value The width value.
		 * @param ..objs An array of objects with the height property.
		 */
		public static function height(value:Number, ...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			for(;k<l;k++)a[int(k)].height=value;
		}
		
		/**
		 * Set any property to the specified value, on all objects.
		 * 
		 * @param objs The objects to toggle the visible property on.
		 */
		public static function prop(prop:String,value:*,...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			for(;k<l;k++)a[int(k)][prop]=value;
		}
		
		/**
		 * Toggles the visible property on all objects provided.
		 * 
		 * @param objs The objects to toggle the visible property on.
		 */
		public static function toggleVisible(...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			for(;k<l;k++)DisplayObject(a[int(k)]).visible=!DisplayObject(a[int(k)]).visible;
		}
		
		/**
		 * Flip the alpha property on all objects provide, if the
		 * alpha on an object is equal to either val1 or val2, the
		 * values are flipped.
		 * 
		 * @param val1 The first alpha value.
		 * @param val2 The second alpha value.
		 * @param objs The objects to toggle the visible property on.
		 */
		public static function flipAlpha(val1:Number,val2:Number,...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			var obj:DisplayObject;
			var al:Number;
			for(;k<l;k++)
			{
				obj=a[int(k)];
				al=MathUtils.sanitizeFloat(obj.alpha,1);
				if(al==val1)obj.alpha=val2;
				else if(al==val2)obj.alpha=val1;
			}
		}
		
		/**
		 * Toggle any property on any object - if the current value
		 * of the property is value1, it will be set to value2, as
		 * well as the reverse.
		 * 
		 * @param prop The property to toggle.
		 * @param value1 The first value.
		 * @param value2 The second value.
		 * @param ...objs The objects whose property will be toggled.
		 */
		public static function flipProp(prop:String,value1:*,value2:*,...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];
			l=a.length;
			var obj:*;
			for(;k<l;k++)
			{
				obj=a[int(k)];
				if(obj[prop]==value1)obj[prop]=value2;
				else if(obj[prop]==value2)obj[prop]=value1;
			}
		}
		
		/**
		 * Toggles the value of a boolean property to the opposite value
		 * for all objects provided.
		 * 
		 * @param prop The property to toggle.
		 * @param objs All objects whose property will be flipped.
		 */
		public static function flipBoolean(prop:String, ...objs:Array):void
		{
			var l:int;
			var k:int=0;
			var a:Array=objs;
			if(objs[0] is Array)a=objs[0];	
			l=a.length;
			for(;k<l;k++)a[int(k)][prop]=!a[int(k)][prop];
		}
		
		/**
		 * Set the text format property on all textfields.
		 * 
		 * @param tf The text format to apply.
		 * @param tfields An array of text fields.
		 */
		public static function textFormat(tf:TextFormat,...tfields:Array):void
		{
			if(tfields[0] is Array)tfields=tfields[0];
			var i:int=0;
			var l:int=tfields.length;
			for(;i<l;i++)
			{
				TextField(tfields[int(i)]).defaultTextFormat=tf;
				TextField(tfields[int(i)]).setTextFormat(tf);
			}
		}
		
		/**
		 * Set a stylesheet on all textfields.
		 * 
		 * @param ss The stylesheet to apply.
		 * @param tfields An array of text fields.
		 */
		public static function stylesheet(ss:StyleSheet,...tfields:Array):void
		{
			if(tfields[0] is Array)tfields=tfields[0];
			var i:int=0;
			var l:int=tfields.length;
			for(;i<l;i++)TextField(tfields[int(i)]).styleSheet=ss;
		}
		
		/**
		 * Set a drop shadow filter on all objects.
		 */
		public static function setDropShadow(ds:DropShadowFilter,...objs:Array):void
		{
			if(objs[0] is Array)objs=objs[0];
			var i:int=0;
			var l:int=objs.length;
			var ss:Function=FilterUtils.setShadow;
			for(;i<l;i++)ss(objs[int(i)],ds);
		}
	}
}