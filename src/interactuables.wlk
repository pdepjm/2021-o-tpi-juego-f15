import wollok.game.*
import jugador.*
import metodosGenericos.*
import objetos.*


class Interactuable{
	const property objetoAtravesable = true
	var property position = null
	const property esInteractuable = true
	const property estaVivo = false
	const property esObjeto = false
	const property esNPC = false
}

class Trampa inherits Interactuable{
	var property image = "pared.png"
	var property destino = null
	method interactuar(){
		jugador.position(destino.position())
	}
}


class Cadaver inherits Interactuable{
	var property image = "cadaver.png"
	method interactuar(pers){
		pers.carga(self)
		game.removeVisual(self)
	}
}

class Escondite inherits Interactuable{
	var property image = "tacho.png"
	method interactuar(pers){
		if(pers.carga().equals(vacio).negate()){
			pers.carga(vacio)
		}
	}
}

