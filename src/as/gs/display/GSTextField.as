package gs.display
{
	
	import flash.display.Sprite;
	import flash.text.*;
	
	import gs.util.*;
	import gs.model.*;
	
	/**
	 * The GSTextField class simplifies creating text fields that
	 * have formatting requirements. 
	 */
	public class GSTextField extends Sprite
	{
		
		/**
		 * Internal text field used through composition.
		 */
		public var tf:TextField;
		
		/**
		 * Internal text attributes instance.
		 */
		public var ta:TextAttributes;
		
		/**
		 * The text value currently in the text field.
		 */
		public var textValue:String;
		
		/**
		 * Whether or not to run the text field through
		 * truncateRegular on update.
		 */
		public var truncRegularOnUpdate:Boolean;
		
		/**
		 * Whether or not to run the text field through
		 * truncateHTML on update.
		 */
		public var truncHTMLOnUpdate:Boolean;
		
		/**
		 * Number of lines to truncate to.
		 */
		public var trunRegularNumLines:Number;
		
		/**
		 * The number of lines to truncate to.
		 */
		public var truncHTMLNumLines:Number;
		
		/**
		 * The string to insert after truncation - default is "...".
		 */
		public var truncTrail:String;
		
		/**
		 * Constructor for GSTextField instances - you shouldn't use this.
		 */
		public function GSTextField() {
			super();
		}
		
		/**
		 * Create a GSTextField with help from a model instance. 
		 * 
		 * @param model The model instance to use.
		 * @param textAttributesId An id for a text attribute defined in the model
		 */
		public static function createWithModelHelp(model:Model,
			textAttributesId:String, textValue:String = null):GSTextField
		{
			var gst:GSTextField = new GSTextField();
			var ta:TextAttributes = model.getTextAttributeById(textAttributesId);
			var tf:TextField = TextFieldUtils.create(
				ta.selectable,ta.multiline,ta.border,
				ta.embedFonts,(ta.autoSize)?ta.autoSize:"left"
			);
			gst.ta = ta;
			gst.tf = tf;
			ta.apply(gst.tf);
			gst.addChild(tf);
			return gst;
		}
		
		/**
		 * Create a GSTextField from raw attributes.
		 * 
		 * @param styleSheet A stylesheet.
		 * @param textFormat A textformat.
		 * @param selectable Whether or not the text is selectable.
		 * @param multiline Whether or not the text is multiline.
		 * @param border Whether or not the text field has a border.
		 * @param embedFonts Whether or not to embed fonts.
		 * @param textValue The initial text value.
		 * @param autoSize The autosize option.
		 * @param aliasType The anti-alias type.
		 */
		public static function create(styleSheet:StyleSheet = null,
			textFormat:TextFormat = null, selectable:Boolean = false,
			multiline:Boolean = false, border:Boolean = false,
			embedFonts:Boolean = false, textValue:String = null,
			autoSize:String = "left", antiAliasType:String = "advance"):GSTextField
		{
			var gst:GSTextField = new GSTextField();
			var tf:TextField = TextFieldUtils.create(
				selectable,multiline,border,embedFonts,autoSize
			);
			var ta:TextAttributes = new TextAttributes(
				styleSheet,textFormat,antiAliasType,autoSize,
				textValue,selectable,multiline,border,embedFonts
			);
			gst.tf = tf;
			gst.ta = ta
			ta.apply(gst.tf);
			gst.addChild(tf);
			return gst;
		}
		
		/**
		 * The text attributes applied to the internal text field.
		 */
		public function set textAttributes(ta:TextAttributes):void {
			this.ta = ta;
			ta.apply(tf);
		}
		
		/**
		 * The text attributes applied to the internal text field.
		 */
		public function get textAttributes():TextAttributes {
			return ta;
		}
		
		/**
		 * The text value for the internal text field.
		 */
		public function set text(val:String):void {
			var s:String = val;
			if(ta.wrapInBodySpan)s="<span class='body'>"+s+"<span>";
			if(ta.styleSheet)tf.htmlText=s;
			else tf.text=s;
			if(truncHTMLOnUpdate) truncateHTML();
			if(truncRegularOnUpdate) truncateHTML();
		}
		
		/**
		 * The text value for the internal text field.
		 */
		public function get text():String {
			return tf.text;
		}
		
		/**
		 * The text value for the internal text field.
		 */
		public function set htmlText(val:String):void {
			this.text = val;
		}
		
		/**
		 * The text value for the internal text field.
		 */
		public function get htmlText():String {
			return tf.htmlText;
		}
		
		/**
		 * Width of the display object.
		 */
		override public function set width(w:Number):void {
			tf.width = w;
		}
		
		/**
		 * Width of the display object.
		 */
		override public function get width():Number {
			return tf.width;
		}
		
		/**
		 * Height of the display object.
		 */
		override public function set height(h:Number):void {
			tf.height = h;
		}
		
		/**
		 * Height of the display object.
		 */
		override public function get height():Number {
			return tf.height;
		}
		
		/**
		 * Truncate the text when the text field uses normal text, not html
		 * text.
		 */
		public function truncateRegular():void {
			
		}
		
		/**
		 * Truncate the text when the text field uses html text, not normal
		 * text.
		 */
		public function truncateHTML():void {
			StringUtils.truncateHTMLText(textValue,tf,truncHTMLNumLines,truncTrail);
			textValue=tf.text;
		}
	}

}

