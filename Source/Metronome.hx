package;

import flash.display.Sprite;
import flash.geom.Point;
import flash.events.Event;
import flash.Lib;
import motion.Actuate;

class Metronome extends Sprite {

	private var ball_size:Int;
	private var ball_ratio:Float = .45;
	private var ball_ratio_max:Float = .45;
	private var padding:Int;
	private var coords:Array<Int>;
	private var ball_speed:Float = 2;
	private var ball_speed_max:Int = 4;
	private var color:Int = 0xABCDEF;
	
	public function new() {
		super();
		init();
		draw_ball();
		animate_left();

	}

	private function init() {
		this.x = Std.int(Lib.current.stage.stageWidth/2);
		calculate_size();
	}
	private function calculate_size() {
		this.y = Std.int(Lib.current.stage.stageHeight*.44);
		ball_size = Std.int((Lib.current.stage.stageHeight * ball_ratio)/2);
		padding = Std.int(Lib.current.stage.stageWidth * .0121212);
		coords = [padding + ball_size, Lib.current.stage.stageWidth - padding - ball_size];
		draw_ball();
	}

	private function draw_ball() {
		trace(color);
		graphics.clear();
		graphics.lineStyle(.5, color, .5);
		graphics.beginFill(color, 1);
		graphics.drawCircle(0,0,ball_size);
	}

	public function resize_me(): Void {
		calculate_size();
	}
	public function recolor(val : Float) {
		color = Std.int(0xFFFFFF * ((val == 1) ? .9999 : val));
		draw_ball();
	}

	public function resize(val : Float) {
		ball_ratio = ((ball_ratio_max/2) * val) + (ball_ratio_max/2);
		calculate_size();
		draw_ball();
	}

	public function respeed(val : Float) {
		ball_speed = ball_speed_max * (1 - val);
		if(ball_speed <= 0) ball_speed = .1;
	}

	private function animate_right() {
		var point_rght = coords[1];
		Actuate.tween(this, this.ball_speed, {x: point_rght}).ease(motion.easing.Quad.easeInOut).onComplete(animate_left);
	}

	private function animate_left() {
		var point_left = coords[0];
		Actuate.tween(this, this.ball_speed, {x: point_left}).ease(motion.easing.Quad.easeInOut).onComplete(animate_right);
	}
}