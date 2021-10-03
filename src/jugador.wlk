import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*
import civilNPC.*

object jugador{
	var property position = game.at(0,0)
	var objeto = vacio //cada jugador tiene un objeto, arranca con vacio
	var property image = "player_default.png"
	var imageAux = "default"
	
	
	method moverPara(direccion) {
		if(nivel.paredes().contains(direccion.proximaPosicion(position)).negate()){ 
			position = direccion.proximaPosicion(position)
		}
		self.imageFlip(direccion)
	}
	
	method imageFlip(direccion){
		if(direccion.equals(izquierda)){
			image = "playerFlip_"+ imageAux +".png"
		}
		if(direccion.equals(derecha)){
			image = "player_"+ imageAux +".png"
		}
	}
	
	method objetosCerca() = game.colliders(self).filter({obj => obj.esObjeto()}) // lista con los objetos que tiene cerca
	
    method npcCerca() = game.colliders(self).filter({npc => npc.esObjeto().negate()}) // lista con los npc que tiene cerca
    
    method usarCuchillo(){ self.npcCerca().forEach({npc => npc.morir()}) }
    
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
        }
        objeto = vacio
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
	/*
	 * .addAll(game.getObjectsIn(self.position().right(1)).addAll(game.getObjectsIn(self.position().left(1))).addAll(game.getObjectsIn(self.position().down(1))).addAll(game.getObjectsIn(self.position().up(1))).addAll(game.getObjectsIn(self.position().right(1).up(1))).addAll(game.getObjectsIn(self.position().right(1).down(1))).addAll(game.getObjectsIn(self.position().left(1).up(1))).addAll(game.getObjectsIn(self.position().left(1).down(1)))
	 * .addAll(game.getObjectsIn(self.position().right(1))).addAll(game.getObjectsIn(self.position().left(1))).addAll(game.getObjectsIn(self.position().down(1))).addAll(game.getObjectsIn(self.position().up(1))).addAll(game.getObjectsIn(self.position().right(1).up(1))).addAll(game.getObjectsIn(self.position().right(1).down(1))).addAll(game.getObjectsIn(self.position().left(1).up(1))).addAll(game.getObjectsIn(self.position().left(1).down(1)))
	var objeto = null
	method agarrarObjeto(obj){
		objeto = obj
	}
	method usarObjeto(){
		objeto.usar(self)
	}
	method usarEntorno(trampa){
		trampa.accionar()
	}
	
	method moverPara(direccion) {
		posicion = direccion.proximaPosicion(posicion) 
	}
	
	method posicion(unaPosicion) {
		posicion = unaPosicion
	}
	
	*/