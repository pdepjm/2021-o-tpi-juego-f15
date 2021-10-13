import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*
import NPCs.*
import metodosGenericos.*
import tipos.*

object jugador inherits SerVivo{
	var property position = game.at(6,2)
	var property objeto = vacio //cada jugador tiene un objeto, arranca con vacio
	var property sentido = derecha
	var property image = "personajes/player_derecha_default.png"
	var property imageAux = "default"
	var property carga = vacio
	const property esNPC = false
	var property miedo = false

	method inicializar() {
		image = "personajes/player_derecha_default.png"
		objeto = vacio
		position = game.at(6,2)
		sentido = derecha
		imageAux = "default"
		miedo = false
	}

	method soltarCarga(){
		if(self.carga().equals(vacio).negate()){
			carga.position(position)
			game.addVisual(carga)
			carga = vacio
		}
	}

	method interactuar(){
		direcciones.algoCerca(tipoInteractuable,self).forEach({int => int.interaccion()})
	}
	
	method moverPara(direccion){
		if(miedo.equals(false)){
		position = movimiento.mover(direccion,self)
		sentido = direccion
		}
	}
	
	method imageFlip(direccion){
		image = "personajes/player_" + direccion + "_" + imageAux +".png"
	}
	
    method usarCuchillo(){
    	direcciones.algoCerca(tipoNpc,self).forEach({npc => npc.morir()})
    }
    
	method agarrarObjeto(){
		if(objeto.equals(vacio)){
			const aux = direcciones.algoCerca(tipoObjeto, self)
			if (aux.equals([]).negate()){
				objeto = aux.head()
				game.removeVisual(objeto)
			}
		}
	}
    
    method soltarObjeto(){
    	if(objeto.equals(vacio).negate() && imageAux == "default"){
        	objeto.position(position)
        	game.addVisual(objeto)
        	objeto = vacio
        }
    }
    
    method usarObjeto() {
    	objeto.usar()
    }
    
    method cambiarRopa() {
    	if(image == "personajes/player_" + sentido.toString() + "_default.png"){
    		image = "personajes/player_" + sentido.toString() + "_vestido.png"
    		imageAux = "vestido"
    	}
    	else if (image == "personajes/player_" + sentido.toString() + "_vestido.png"){
    		image = "personajes/player_" + sentido.toString() + "_default.png"
    		imageAux = "default"
    	}
    }
    
    method estaVestido() = (imageAux == "vestido")
}