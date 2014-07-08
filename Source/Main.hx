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

		var slider = new Slider(100, 10);
		addChild(slider);
		slider.x = 10;
		slider.y = 10;

		Lib.current.stage.addEventListener(Event.RESIZE, resize_them_all);
	}

	private function resize_them_all( e : Event) {
		nome.resize_me();
	}
	
	
}