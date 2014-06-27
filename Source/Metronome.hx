package;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;

class Metronome extends Sprite {

	private var ball_size:Int;
	private var dir:Int = 1;
	private var max_vel:Int = 9;
	private var vel:Int;
	private var padding:Int;
	
	public function new() {
		super();
		calculate_size();
		vel = max_vel;
		addEventListener(Event.ENTER_FRAME, draw_ball);
	}
	private function calculate_size() {
		x = Std.int(Lib.current.stage.stageWidth/2);
		y = Std.int(Lib.current.stage.stageHeight/2);
		dir = 1; vel = max_vel;
		ball_size = Std.int((Lib.current.stage.stageHeight * .743453452)/2);
		padding = Std.int(Lib.current.stage.stageWidth * .0121212);
	}

	private function draw_ball(e : Event) {
		move_me();
		graphics.clear();
		graphics.beginFill(0x2222BB);
		graphics.drawCircle(0,0,ball_size);
	}

	private function move_me() {
		var check = check_myself();
		if(!check) {
			if(vel < max_vel){
				trace('doing naughty things');
				vel *= 2;
				if(vel > max_vel) vel = max_vel;
			}
		}
		else {
			if(vel > 0) vel = Math.floor(vel*.2);
			else {
				vel = 1;
				dir *= -1;
			}
		}
		x += dir*vel;
	}

	private function check_myself() : Bool {
		if(dir == 1 && x + ball_size + padding + (dir*vel) >= Lib.current.stage.stageWidth) return true;
		else if(dir == -1 && x - ball_size - padding + (dir*vel) <= 0) return true;
		else return false;
	}


	public function resize_me(): Void {
		calculate_size();
	}
}