import wollok.game.*
import objetosNiveles.*
import objetos.*
import jugador.*
import civilNPC.*
import direcciones.*
import texto.*
import paredes.*
import interactuables.*

object nivel{
	const npc1 = new Civil(position = game.at(5,5)) 
	const npc2 = new Civil(position = game.at(10,20))
	const npc3 = new Civil(position = game.at(8,15))
	const npc4 = new Civil(position = game.at(2,7))
	const escotillaBanio = new Trampa(position = game.at(7,7),image="blood.png")
	const escotillaEstudio = new Trampa(position = game.at(14,14),destino = escotillaBanio,image="blood.png")
	const cadaverFicticio = new Cadaver(position = game.at(40,40)) // lo agrego para que listaMuertos no sea vacia (tira error el anyOne sino)
	const listaMuertos = [cadaverFicticio]
	
	
	method configuracionInicial(){
		//game.onTick(1000, "contador" , {contador.mostrar()})
		game.clear()
		todasLasParedes.cargar()
		escotillaBanio.destino(escotillaEstudio)
		game.addVisual(escotillaBanio)
		game.addVisual(escotillaEstudio)
		game.addVisual(vestido)
		game.addVisual(veneno)
		game.addVisual(npc1)
		game.addVisual(npc2)
		game.addVisual(npc3)
		game.addVisual(npc4)
		game.addVisual(jugador)
		game.onTick(10000.randomUpTo(60000), "movimiento" , {npc1.moverse()})
		game.onTick(500, "movimiento", {npc2.moverse()})
		game.onTick(500, "movimiento", {npc3.moverse()})
		game.onTick(500, "movimiento", {npc4.moverse()})
		game.onTick(100,"delatarAsesino",{if(npc1.estaVivo()) {npc1.delatarAsesino()}})
		game.onTick(100,"delatarAsesino",{if(npc2.estaVivo()) {npc2.delatarAsesino()}})
		game.onTick(100,"delatarAsesino",{if(npc3.estaVivo()) {npc3.delatarAsesino()}})
		game.onTick(100,"delatarAsesino",{if(npc4.estaVivo()) {npc4.delatarAsesino()}})

		
		self.configurarTeclas()
	}
	
	method configurarTeclas(){
		keyboard.w().onPressDo({ jugador.moverPara(arriba) })
		keyboard.a().onPressDo({ jugador.moverPara(izquierda) })
		keyboard.s().onPressDo({ jugador.moverPara(abajo) })
		keyboard.d().onPressDo({ jugador.moverPara(derecha) })
		keyboard.r().onPressDo({ jugador.usarCuchillo() })
		keyboard.e().onPressDo({ jugador.agarrarObjeto() })
		keyboard.q().onPressDo({ jugador.soltarObjeto() })
		keyboard.f().onPressDo({ jugador.usarObjeto() })
		keyboard.g().onPressDo({ jugador.interactuar() })
	}
	
	method agregarMuerto(unMuerto) = listaMuertos.add(unMuerto)
	
	// method existeMuerto(unMuerto) = listaMuertos.contains(unMuerto) && unMuerto.esCadaver()
	
	method listaMuertos() = listaMuertos
}


