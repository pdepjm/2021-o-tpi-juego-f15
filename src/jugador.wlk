import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*
import civilNPC.*
import metodosGenericos.*
import tipos.*

object jugador inherits SerVivo{
	var property position = game.at(6,2)
	var objeto = vacio //cada jugador tiene un objeto, arranca con vacio
	var property image = "player_derecha_default.png"
	var imageAux = "default"
	var property carga = vacio


	method soltarCarga(){
		if(self.carga().equals(vacio).negate()){
			carga.position(position)
			game.addVisual(carga)
			carga = vacio
		}
	}

	method interactuar(){
		direcciones.algoCerca(tipoInteractuable,self).forEach({int=>int.interactuar()})
	}
	
	method moverPara(direccion) {
		position = mover.mov(direccion,self)
	}
	
	method imageFlip(direccion){
		image = "player_"+ direccion + "_" + imageAux +".png"
	}
	
    method usarCuchillo(){
    	direcciones.algoCerca(tipoNpc,self).forEach({npc => npc.morir()})
    }
    
	method agarrarObjeto(){
		if(objeto.equals(vacio)){
			objeto = direcciones.algoCerca(tipoObjeto,self).head()
			game.removeVisual(objeto)
			}
		 }
    
    method soltarObjeto(){
    	if( objeto.equals(null).negate()){
        	objeto.position(position)
        	game.addVisual(objeto)
        	objeto = vacio
        }
    }
    
    method usarObjeto() {
    	objeto.usar(self)
    }
    
    method cambiarRopa() {
    	if(image == "player_izquierda_default.png"){
    		image = "player_izquierda_vestido.png"
    		imageAux = "vestido"
    	}else{
    		image = "player_derecha_vestido.png"
    		imageAux = "vestido"
    	}
    }
}