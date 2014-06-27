package;


import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import Metronome;


class Main extends Sprite {
	
	var nome:Metronome;
	
	public function new () {
		
		super ();

		nome = new Metronome();
		addChild(nome);

		Lib.current.stage.addEventListener(Event.RESIZE, resize_them_all);
	}

	private function resize_them_all( e : Event) {
		nome.resize_me();
	}
	
	
}