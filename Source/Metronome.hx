package;

import flash.display.Sprite;
import openfl.geom.Point;
import flash.events.Event;
import flash.Lib;
import motion.Actuate;

class Metronome extends Sprite {

	private var ball_size:Int;
	private var dir:Int = 1;
	private var max_vel:Int = 2;
	private var vel:Int;
	private var padding:Int;
	private var coords:Array<Int>;
	private var ball_speed:Int;
	
	public function new() {
		super();
		calculate_size();
		draw_ball();
		vel = max_vel;
		ball_speed = 3;
		animate_left();

	}
	private function calculate_size() {
		this.x = Std.int(Lib.current.stage.stageWidth/2);
		this.y = Std.int(Lib.current.stage.stageHeight*.44);
		ball_size = Std.int((Lib.current.stage.stageHeight * .45)/2);
		padding = Std.int(Lib.current.stage.stageWidth * .0121212);

		coords = [padding + ball_size, Lib.current.stage.stageWidth - padding - ball_size];
		draw_ball();
	}

	private function draw_ball() {
		graphics.clear();
		graphics.lineStyle(.5, 0x2222BB);
		graphics.beginFill(0x2222BB, 1);
		graphics.drawCircle(0,0,ball_size);
	}

	public function resize_me(): Void {
		calculate_size();
	}

	private function animate_right() {
		var point_rght = coords[1];
		Actuate.tween(this, ball_speed, {x: point_rght}).ease(motion.easing.Quad.easeInOut).onComplete(animate_left);
	}

	private function animate_left() {
		var point_left = coords[0];
		trace(ball_speed+"_"+point_left);
		Actuate.tween(this, ball_speed, {x: point_left}).ease(motion.easing.Quad.easeInOut).onComplete(animate_right);
	}
}