import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*
import NPCs.*
import metodosGenericos.*
import tipos.*

object jugador inherits SerVivo (identidad = "player"){
	var property position = game.at(28,2)
	var property objeto = vacio //cada jugador tiene un objeto, arranca con vacio
	//var property carga = vacio
	const property esNPC = false

	method inicializar() {
		objeto = vacio
		position = game.at(28,2)
		sentido = abajo
		self.imageAux("default")
	}

	method interactuar(){
		direcciones.algoCerca(tipoInteractuable,self).forEach({int => int.interaccion()})
	} // cambiar nombre de: algoCerca
	
	method moverPara(direccion){
			position = movimiento.mover(direccion,self)
			sentido = direccion
	}
	
    method usarCuchillo(){
    	direcciones.algoCerca(tipoNpc,self).forEach({npc => npc.morir()})
    }
    
	method agarrarObjeto(){
			const aux = direcciones.algoCerca(tipoObjeto, self)
			if (objeto.equals(vacio).negate()){ // sacar if, POLIMORFISMO
				objeto.position(position)
        		game.addVisual(objeto)
        		objeto = vacio
			}
        	if (aux.equals([]).negate()){
        		objeto = aux.head()
        		game.removeVisual(objeto)
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