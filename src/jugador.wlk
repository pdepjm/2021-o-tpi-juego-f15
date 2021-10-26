import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*
import NPCs.*
import metodosGenericos.*

object jugador inherits SerVivo ( identidad = "player", position = game.at(28,2) ){
	var property objeto = vacio
	var vision = true
	
	method efectoHumo(){
		vision = false
		game.say(self,"No veoooo")
		game.schedule(7000,{vision= true})
	}
	
	
	method estaMuerto() = false

	method explotar(){
		game.schedule(3300, { game.stop() })
	}

	method inicializar() {
		objeto = vacio
		position = game.at(28,2)
		sentido = abajo
		self.imageAux("default")
	}
	
	method vioMuerto(){}

	method interactuar(){
		game.schedule(0, { (direcciones.cercanosA(self, 1,nivel.interactuables()) + [vacio]).head().interaccion() }) //no tiene sentido pero sino da error los test
	}
	
	method moverPara(direccion){
			position = movimiento.mover(direccion, self)
			self.sentido(direccion)
	}
    
	method reemplazarObjeto(ob){
		objeto.soltar()
		if(vision){ob.serAgarrado()}
	}

    method usarObjeto() { objeto.usar() }
    
    method cambiarRopa() { self.imageAux("vestido") }
    
    method estaVestido() = self.imageAux() == "vestido"
}
