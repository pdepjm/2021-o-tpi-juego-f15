import wollok.game.*
import jugador.*
import metodosGenericos.*
import objetos.*
import direcciones.*
import nivel.*
import NPCs.*

class Interactuable{
	const property esAtravesable = true
	var property position = game.at(0,0)
	const identidad = ""
	
	method image() = "interactuables/" + identidad + ".png"
	method morir(){}
	method serAgarrado(){}
	method tirar(){}
	method vioMuerto(){}
	method estaMuerto() = false
}

class Escotilla inherits Interactuable (identidad = "trapdoor"){
	var property destino = null
	method interaccion(){ jugador.position(destino.position()) }
}

class Escondite inherits Interactuable(identidad = "tacho"){
	
	method interaccion(){
		direcciones.cercanosA(jugador,2).forEach({cadaver =>
			cadaver.tirar()
		})
	}
}

