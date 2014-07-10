package;


import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import Metronome;
import Slider;
import motion.Actuate;


class Main extends Sprite {
	
	var nome:Metronome;
	
	public function new () {
		
		super ();

		nome = new Metronome();
		addChild(nome);

		var colorslide = new Slider('color', 100, 13, .5);
		addChild(colorslide);
		colorslide.x = 200;
		colorslide.y = 10;
		addEventListener('color_mouseup', getcolor);

		var sizeslide = new Slider('size', 100, 13, 1);
		addChild(sizeslide);
		sizeslide.x = 350;
		sizeslide.y = 10;
		addEventListener('size_mouseup', getsize);

		var speedslide = new Slider('speed', 100, 13, .5);
		addChild(speedslide);
		speedslide.x = 500;
		speedslide.y = 10;
		addEventListener('speed_mouseup', getspeed);



		Lib.current.stage.addEventListener(Event.RESIZE, resize_them_all);
	}

	private function getcolor ( e : SliderEvent) {
		nome.recolor(e.val);
	}

	private function getsize ( e : SliderEvent) {
		nome.resize(e.val);
	}

	private function getspeed ( e : SliderEvent) {
		nome.respeed(e.val);
	}

	private function resize_them_all( e : Event) {
		nome.resize_me();
	}
	
	
}