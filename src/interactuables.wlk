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

class Escotilla inherits Interactuable{
	var property image = "pared.png"
	var property destino = null
	method interaccion(){
		jugador.position(destino.position())
	}
}

class Cadaver inherits Interactuable{
	var property image = "personajes/cadaver.png"
	method interaccion(){
		jugador.carga(self)
		game.removeVisual(self)
	}
}

class Escondite inherits Interactuable{
	var property image = "objetos/tacho.png"
	method interaccion(){
		if(jugador.carga().equals(vacio).negate()){
			jugador.carga(vacio)
		}
	}
}

