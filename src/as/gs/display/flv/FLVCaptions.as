package gs.display.flv
{

	import gs.util.*;
	import gs.display.flv.*;
	import gs.events.*;
	import gs.managers.*;
	
	import flash.display.*;
	import flash.text.*;
	import flash.utils.*;
	
	import com.greensock.*;
	
	/**
	 * The FLVCaptions class simplifies showing captions for
	 * an FLV instance. You pass a reference to an FLV instance,
	 * and a reference to the captions XML. See gs.model.Model
	 * for an example of the captions structure.
	 */
	public class FLVCaptions extends Sprite
	{
		
		/**
		 * The text field used internally to show captions.
		 */
		public var tf:TextField;
		
		/**
		 * The background piece behind the text.
		 */
		public var bg:Sprite;
		
		/**
		 * The color to draw the background with.
		 */
		public var bgcolor:int;
		
		/**
		 * The percent to fill the FLV display with.
		 */
		public var fillPercentage:Number;
		
		/**
		 * The amount of padding from the bottom of the FLV.
		 */
		public var bottomPadding:Number;
		
		/**
		 * The text attributes instance applied to the text field.
		 */
		private var _ta:TextAttributes;
		
		/**
		 * The flv instance.
		 */
		private var flv:FLV;
		
		/**
		 * Captions XML.
		 */
		private var cap:*;
		
		/**
		 * The duration timer used to keep a caption visible.
		 */
		private var durtimer:Number;
		
		/**
		 * Whether or not the captions are on or off.
		 */
		private var working:Boolean;
		
		/**
		 * Current caption XML node.
		 */
		private var cur:*;
		
		/**
		 * Constructor for FLVCaptions instances.
		 * 
		 * @param flv The FLV instance to show captions on.
		 * @param captions An XMLList reference of captions.
		 * 
		 * @see See gs.model.Model for an example of captions xml.
		 */
		public function FLVCaptions(flv:FLV, captions:*) {
			super();
			this.flv = flv;
			this.cap = captions;
			init();
		}
		
		/**
		 * Initialize internals.
		 */
		private function init():void {
			working = true;
			bottomPadding = 20;
			fillPercentage = .7;
			bgcolor = 0xff0066;
			bg = new Sprite();
			tf = TextFieldUtils.create(false,true,false,true);
			flv.addEventListener(FLVEvent.PROGRESS,onFLVProgress);
			addChild(bg);
			addChild(tf);
		}
		
		/**
		 * The text attributes to apply to the textfield.
		 */
		public function set textAttributes(ta:TextAttributes):void {
			_ta = ta;
			_ta.apply(tf);
		}
		
		/**
		 * @private
		 * 
		 * Set the text on the text field.
		 */
		public function set text(tx:String):void {
			tf.text = tx;
		}
		
		/**
		 * Stop the captions.
		 */
		public function stop():void {
			working = false;
			if(flv.video.parent && flv.video.parent.contains(this)) {
				flv.video.parent.removeChild(this);
				tf.text = "";
			}
		}
		
		/**
		 * Start the captions.
		 */
		public function start():void {
			working = true;
			if(flv.video.parent && !flv.video.parent.contains(this)) {
				flv.video.parent.addChild(this);
			}
		}
		
		/**
		 * On flv progress.
		 */
		private function onFLVProgress(e:FLVEvent):void {
			if(!working) return;
			var tm:Number = flv.getTime();
			var x:*;
			var ttm:Number;
			var dur:Number;
			for each(x in cap) {
				ttm = Number(x.@time.toString());
				dur = Number(x.@duration.toString());
				if(tm >= ttm && tm < (ttm+2)) {
					showCaption(x);
					return;
				}
			}
		}
		
		/**
		 * Toggle the captions on or off.
		 */
		public function toggle():void {
			working = !working;
		}
		
		/**
		 * Invalidates the text and background.
		 */
		private function invalidate():void {
			tf.width = flv.video.width * fillPercentage;
			tf.x = (flv.video.width-Math.ceil(tf.textWidth))/2;
			tf.y = flv.video.height - tf.textHeight - bottomPadding;
			bg.x = tf.x
			bg.y = tf.y;
			bg.graphics.clear();
			bg.graphics.beginFill(bgcolor,1);
			bg.graphics.drawRect(0,0,tf.width+4,tf.height);
			bg.graphics.endFill();
		}
		
		/**
		 * Sets up the caption to show.
		 */
		private function showCaption(caption:*):void {
			if(cur == caption) return;
			cur = caption;
			if(caption.@bgcolor != undefined) bgcolor = int(caption.@bgcolor.toString());
			tf.alpha = 0;
			tf.text = StringUtils.sanitizeCDATA_HTMLText(caption.toString());
			if(!flv.video.parent.contains(this)) flv.video.parent.addChild(this);
			var dur:Number = Number(caption.@duration.toString())*1000;
			invalidate();
			TweenMax.to(tf,.3,{alpha:1});
			clearTimeout(durtimer);
			durtimer = setTimeout(hideCaption,dur);
		}
		
		/**
		 * Hide's the caption after timeout.
		 */
		private function hideCaption():void {
			if(flv.video.parent.contains(this)){
				flv.video.parent.removeChild(this);
			}
			clearTimeout(durtimer);
		}
	}
}