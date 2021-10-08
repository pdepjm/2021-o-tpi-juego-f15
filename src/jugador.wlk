import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*
import civilNPC.*
import metodosGenericos.*

object jugador{
	var property position = game.at(6,2)
	var objeto = vacio //cada jugador tiene un objeto, arranca con vacio
	var property image = "player_derecha_default.png"
	var imageAux = "default"
	
	//method estaCercaDeUnMuerto() = self.position().distance(nivel.listaMuertos().anyOne().position()) < 5
		
	method interactuar(){
		self.interactuablesCerca().forEach({int=>int.interactuar()})
	}
	
	method moverPara(direccion) {
		position = mover.mov(direccion,self)
	}
	
	method imageFlip(direccion){
		image = "player_"+ direccion + "_" + imageAux +".png"
	}
	
    method usarCuchillo(){
    	self.npcCerca().forEach({npc => npc.morir()})
    }
    
	method agarrarObjeto(){
		if( objeto.equals(vacio) ){
        	objeto = self.objetosCerca().findOrElse({obj => obj.esObjeto() && obj != objeto}, {vacio})
        	if( objeto.equals(vacio).negate() ){
        		game.removeVisual(objeto)
        	}
        }
    }
    
    method soltarObjeto(){
    	if( objeto.equals(vacio).negate() and imageAux == "default"){
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
    
    method algoCerca(tipo){
    	return direcciones.cosasCerca(self).filter({obj => obj.esObjeto()})
    }
    
    method objetosCerca() {
    	return direcciones.cosasCerca(self).filter({obj => obj.esObjeto()})
    }
	
    method npcCerca() {
    	return direcciones.cosasCerca(self).filter({npc => npc.esNPC()})
    } 
    
    method interactuablesCerca() {
    	return direcciones.cosasCerca(self).filter({int => int.esInteractuable()})
    } 
    
    
}