import wollok.game.*
import soundProducer.*
import direcciones.*
import objetos.*
import jugador.*
import nivel.*
import interactuables.*

class Civil {
	var property position = null
	var property estaVivo = true
	var property objetoAtravesable = true
	var property image = "npc_abajo.png"
	
	method esObjeto() = false
	method esInteractuable() = false
	method esNPC() = true
	
	// method muertoCerca() = game.colliders(self).filter({cadaver => cadaver.esCadaver()})
	
	/*	method estaCercaDe(unMuerto){
		if(nivel.existeMuerto(unMuerto) && (self.position().distance(unMuerto.position()) < 5))
		{
			self.position().say(self, "hay un asesino entre nosotros")
		}
	} */

	//method estaCercaDeUnMuerto() = self.position().distance(nivel.listaMuertos().anyOne().position()) < 5
	
	method cadaverCercano() {
		return nivel.listaMuertos().filter({cadaver => self.position().distance(cadaver.position()) < 5 })
	}
	
	method estaCercaDelAsesino() = self.position().distance(jugador.position()) < 5
	
	method delatarAsesino(){
		if(self.cadaverCercano().size() != 0 && self.estaCercaDelAsesino().negate()){
			game.say(self, "Hay un asesino entre nosotros")
			game.schedule(2000, {policia.buscarCadaver(self.cadaverCercano())})
		}
		else if(self.estaCercaDelAsesino() && self.cadaverCercano().size() != 0){
			game.say(self, "Te descubri! Llamare a la policia")
			game.schedule(1000, {policia.buscarAsesino()})
		}
	}
	
	method morir(){
		const sangre = new Cadaver(position = self.position())
		game.addVisual(sangre)
		game.removeVisual(self) 
		soundProducer.sound("sounds/Death Sound.mp3").play()
		estaVivo = false
		return nivel.agregarMuerto(sangre)
	}
	
	method repetirNVeces(intervalo, cantidad, accion) {
 		 const nombreAleatorio = 0.randomUpTo(10).toString()
  		game.onTick(intervalo, nombreAleatorio, accion)
  		game.schedule(intervalo * cantidad, { game.removeTickEvent(nombreAleatorio) })
	}
	
	method moverse(){
		//(5..20).anyOne().times({ => game.schedule(500,{i=>position = mover.mov(direcciones.direccionRandom(),self)}) })
		
		self.repetirNVeces(1000, (5..20).anyOne() , {position = mover.mov(direcciones.direccionRandom(),self)})
		//position = mover.mov(direcciones.direccionRandom(),self)
		/*const aux = direcciones.direccionRandom()
		self.moverPara(aux) */
		
	}
	method imageFlip(direccion){
		image = "npc_" + direccion + ".png"
	}

}

object policia {
	var property position = null
	var property estaVivo = true
	
	method image() = "police.png"
	
	method buscarCadaver(cadaver){
		cadaver.forEach{muerto => self.eliminarCadaver(muerto)}		
	}
	
	method eliminarCadaver(muerto){
		position = muerto.position()
		game.addVisual(self)
		game.removeVisual(muerto)
		nivel.listaMuertos().remove(muerto) 
		game.schedule(2000, {game.removeVisual(self)})
		game.say(self, "ALEJENSE! Estamos quitando un cadaver!")
		
	}
	
	method buscarAsesino(){ // Falta codear el caso de que el jugador este usando el vestido (en ese caso, no lo encuentra)
		position = jugador.position()
		game.addVisual(self)
		game.say(self, "Te hemos encontrado, has perdido!!")
		game.onTick(2000, "encontrarAsesino", {game.stop()})	
	}
}
	