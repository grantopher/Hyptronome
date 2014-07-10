package;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.events.Event;
import flash.geom.Point;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormatAlign;
import flash.Lib;
import openfl.Assets;

class Slider extends Sprite {

	private var slider_w:Int;
	private var btn:Sprite;
	private var tag:String;
	private var btn_size:Int;
	private var btn_coors:Point;

	public function new(sTag, width, sBtn_size, start_pos : Float) {
		super();
		tag = sTag; 		btn_size = sBtn_size;
		btn_coors = new Point(Std.int(btn_size/3), Std.int(btn_size/2));
		slider_w = Std.int(width/2);
		draw_bar();
		makeTag();

		btn = new Sprite();
		btn.x = ((slider_w*2)*start_pos) - slider_w;
		addChild(btn);
		draw_btn();
		addEventListener(MouseEvent.MOUSE_DOWN, start_drag);
	}

	private function makeTag() {
		var tagText = new TextField(); addChild(tagText);
		tagText.x -= slider_w; tagText.y += btn_size;
		var font = Assets.getFont('assets/slider-font.otf');
		var tagFormat = new TextFormat(font.fontName, btn_size, 0x000000);
		tagFormat.align = TextFormatAlign.CENTER;
		tagText.defaultTextFormat = tagFormat;
		
		tagText.text = tag.toUpperCase();
		tagText.autoSize = TextFieldAutoSize.CENTER;
	}

	private function draw_bar() {

		graphics.beginFill(0xAAAAAA);
		graphics.drawRect(-slider_w - btn_coors.x -1,-btn_coors.y -1, (slider_w*2) + (btn_coors.x*2) +3, btn_size+2);
	}

	private function draw_btn() {

		btn.graphics.beginFill(0xDDDDDD);
		btn.graphics.drawRect(-btn_coors.x, -btn_coors.y,btn_size*.6666,btn_size);
	}

	private function start_drag(e : MouseEvent) {
		removeEventListener(MouseEvent.MOUSE_DOWN, start_drag);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, drag);
		stage.addEventListener(MouseEvent.MOUSE_UP, stop_drag);
	}

	private function stop_drag(e : MouseEvent) {
		stage.removeEventListener(MouseEvent.MOUSE_MOVE, drag);
		stage.removeEventListener(MouseEvent.MOUSE_UP, stop_drag);
		addEventListener(MouseEvent.MOUSE_DOWN, start_drag);
	}

	private function drag(e : MouseEvent) {
		var newx = Lib.stage.mouseX - this.x;
		if(newx > slider_w) btn.x = slider_w;
		else if(newx < -slider_w) btn.x = -slider_w;
		else btn.x = newx;
		sendEvent();
	}

	private function sendEvent() {
		var event = new SliderEvent(tag+'_mouseup', getVal());
		dispatchEvent(event);
	}

	public function getVal() : Float {
		return (btn.x + slider_w)/(slider_w*2);
	}
}

class SliderEvent extends Event {
	public var val:Dynamic;
	public function new(etag : String, eVal : Dynamic) {
		super(etag, true);
		val = eVal;
	}
}