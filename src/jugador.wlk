import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*
import civilNPC.*

object jugador{
	var property position = game.at(1,1)
	var objeto = vacio //cada jugador tiene un objeto, arranca con vacio
	var property image = "player_derechadefault.png"
	var imageAux = "default"
	
	method interactuar(){
		self.interactuablesCerca().forEach({int=>int.interactuar()})
	}
	
	method moverPara(direccion) {
		position = mover.mov(direccion,self)
	}
	
	method imageFlip(direccion){
		image = "player_"+ direccion + imageAux +".png"
	}
	
	method objetosCerca() = game.colliders(self).filter({obj => obj.esObjeto()}) // lista con los objetos que tiene cerca
	
	method interactuablesCerca() = game.colliders(self).filter({obj => obj.esInteractuable()})
	
    method npcCerca() = game.colliders(self).filter({npc => npc.esObjeto().negate()}) // lista con los npc que tiene cerca
    
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
    	if( objeto.equals(vacio).negate() and (image == "player_default.png" or image == "playerFlip_default.png")){
        	objeto.position(position)
        	game.addVisual(objeto)
        	objeto = vacio
        }
    }
    
    method usarObjeto() {
    	objeto.usar(self)
    }
    
    method cambiarRopa() {
    	if(imageAux == "vestido"){
    		self.sacarRopa()
    	}else{
    		self.vestirse()
    	}
    }
    
    method vestirse(){
    	if(image == "player_default.png"){
    		image = "player_vestido.png"
    		imageAux = "vestido"
    	}else{
    		image = "playerFlip_vestido.png"
    		imageAux = "vestido"
    	}
    }
    
    method sacarRopa(){
    	if(image == "playerFlip_vestido.png"){
    		image = "playerFlip_default.png"
    		imageAux = "default"
    	}else{
    		image = "player_default.png"
    		imageAux = "default"
    	}
    }
}