import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*
import NPCs.*
import metodosGenericos.*

object jugador inherits SerVivo (identidad = "player"){
	var property position = game.at(28,2)
	var property objeto = vacio //cada jugador tiene un objeto, arranca con vacio
	const property esNPC = false

	method inicializar() {
		objeto = vacio
		position = game.at(28,2)
		sentido = abajo
		self.imageAux("default")
	}

	method interactuar(){
		direcciones.cercanosA(self).forEach({int => int.interaccion()})
	}
	
	 method usarCuchillo(){
    	direcciones.cercanosA(self).forEach({npc => npc.morir()})
    }
	
	method moverPara(direccion){
			position = movimiento.mover(direccion,self)
			self.sentido(direccion)
	}
    
	method agarrarObjeto(){
		const aux = direcciones.cercanosA(self)
		if (objeto.equals(vacio).negate()){ // sacar if, POLIMORFISMO
			objeto.position(position)
    		game.addVisual(objeto)
    		objeto = vacio
		}
    	if (aux.equals([]).negate()){
    		aux.head().serAgarrado()
		}
	}

    method usarObjeto() {
    	objeto.usar()
    }
    
    method cambiarRopa() {
    		self.imageAux("vestido")
    }
    
    method estaVestido() = self.imageAux() == "vestido"
    
}