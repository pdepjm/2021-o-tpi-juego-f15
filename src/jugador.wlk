import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*
import civilNPC.*

object jugador{
	var property position = game.at(6,2)
	var objeto = vacio //cada jugador tiene un objeto, arranca con vacio
	var property image = "player_derecha_default.png"
	var imageAux = "default"
	
	method interactuar(){
		self.interactuablesCerca().forEach({int=>int.interactuar()})
	}
	
	method moverPara(direccion) {
		position = mover.mov(direccion,self)
	}
	
	method imageFlip(direccion){
		image = "player_"+ direccion + "_" + imageAux +".png"
	}
	
	method colisiones() = game.colliders(self)
	
	method objetosColision() = self.colisiones().filter({obj => obj.esObjeto()}) // lista con los objetos que tiene cerca
	
	method interactuablesCerca() = self.colisiones().filter({int => int.esInteractuable()})
	
   // method npcCerca() = self.cercanos().filter({npc => npc.esNPC()}) // lista con los npc que tiene cerca
    
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
    	if(imageAux == "vestido"){
    		self.sacarRopa()
    	}else{
    		self.vestirse()
    	}
    }
    
    method vestirse(){
    	if(image == "player_izquierda_default.png"){
    		image = "player_izquierda_vestido.png"
    		imageAux = "vestido"
    	}else{
    		image = "player_derecha_vestido.png"
    		imageAux = "vestido"
    	}
    }
    
    method sacarRopa(){
    	if(image == "player_izquierda_vestido.png"){
    		image = "player_izquierda_default.png"
    		imageAux = "default"
    	}else{
    		image = "player_derecha_default.png"
    		imageAux = "default"
    	}
    }
    
    //method hayAlgoCerca(){      la hice para saber si funcionaba 
    	//if(self.cosasCerca().size() != 0){
    		//game.say(self, "algo cerca")
    	//}
    //}
    
    method objetosCerca() {
    	return direcciones.cosasCerca(self).filter({obj => obj.esObjeto()}) + self.objetosColision()
    }
    
    method npcCerca() {
    	return direcciones.cosasCerca(self).filter({npc => npc.esNPC()}) 
    } 
    
    
}