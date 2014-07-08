package;

import flash.display.Sprite;

class Slider extends Sprite {

	private var slider_w:Int;
	private var btn:Sprite;
	public function new(width, btn_scale) {
		super();
		slider_w = width;
		draw_bar();
		btn = new Sprite();
		addChild(btn);
		draw_btn();

	}

	private function draw_bar() {
		graphics.beginFill(0x111111);
		graphics.drawRect(-(slider_w/2), -1, slider_w, 2);
	}

	private function draw_btn() {
		btn.graphics.lineStyle(.5, 0x000000, .8);
		btn.graphics.beginFill(0xAA0000);
		btn.graphics.drawCircle(0,0,5);
	}
}