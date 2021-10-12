import wollok.game.*
import objetos.*
import jugador.*
import NPCs.*
import direcciones.*
import contador.*
import paredes.*
import interactuables.*
import soundProducer.*
import pantallas.*

object nivel{
	// Objetos
	const remera1 = new Remera(position = game.at(7,7))
	const veneno1 = new Veneno(position = game.at(10,10))
	const bomba1 = new Bomba(position = game.at(11,16))
	// Interactuables
	const escotillaBanio = new Trampa(position = game.at(3,23), image = "hud_gui/pared.png")
	const escotillaEstudio = new Trampa(position = game.at(44,5), destino = escotillaBanio, image = "interactuables/trapdoor.png")
	// NPCs
	const npc1 = new Civil(position = game.at(2,2)) 
	const npc2 = new Civil(position = game.at(15,20))
	const npc3 = new Civil(position = game.at(8,15))
	const npc4 = new Civil(position = game.at(10,7))
	const listaMuertos = []
	
	method configuracionInicial(){
		game.clear()
        soundProducer.playMusic()
        // Inicializaciones
		jugador.inicializar()
		npc1.position(game.at(2,2)) 
	    npc2.position(game.at(15,20))
	    npc3.position(game.at(8,15))
	    npc4.position(game.at(10,7))
	    contadorTiempo.iniciar()
		todasLasParedes.cargar()
		escotillaBanio.destino(escotillaEstudio)
		// Visuales
		game.addVisual(contadorTiempo)
		game.addVisual(contadorKills)
		game.addVisual(marcoContadorTiempo)
		game.addVisual(marcoContadorKills)
		game.addVisual(escotillaBanio)
		game.addVisual(escotillaEstudio)
		game.addVisual(remera1)
		game.addVisual(veneno1)
		game.addVisual(npc1)
		game.addVisual(npc2)
		game.addVisual(npc3)
		game.addVisual(npc4)
		game.addVisual(bomba1)
		game.addVisual(jugador)
		// NPCs
		game.onTick(1000.randomUpTo(10000), "movimiento" , {npc1.moverse()})
		game.onTick(1000.randomUpTo(10000), "movimiento", {npc2.moverse()})
		game.onTick(1000.randomUpTo(10000), "movimiento", {npc3.moverse()})
		game.onTick(1000.randomUpTo(10000), "movimiento", {npc4.moverse()})
		game.onTick(300,"delatarAsesino", {npc1.delatarAsesino()} )
		game.onTick(300,"delatarAsesino", {npc2.delatarAsesino()} )
		game.onTick(300,"delatarAsesino", {npc3.delatarAsesino()} )
		game.onTick(300,"delatarAsesino", {npc4.delatarAsesino()} )
	//	game.onTick(100,"cosasCerca",{jugador.hayAlgoCerca()})
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
		keyboard.h().onPressDo({ jugador.soltarCarga() })
	}
	
	method agregarMuerto(unMuerto) = listaMuertos.add(unMuerto)
	
	method listaMuertos() = listaMuertos
}