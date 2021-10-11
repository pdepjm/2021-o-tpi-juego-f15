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
	method interaccion(persona){
		jugador.position(destino.position())
	}
}

class Cadaver inherits Interactuable{
	var property image = "cadaver.png"
	method interaccion(persona){
		persona.carga(self)
		game.removeVisual(self)
	}
}

class Escondite inherits Interactuable{
	var property image = "tacho.png"
	method interaccion(persona){
		if(persona.carga().equals(vacio).negate()){
			persona.carga(vacio)
		}
	}
}

