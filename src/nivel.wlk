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
	const escotillaBanio = new Escotilla(position = game.at(3,23), image = "hud_gui/pared.png")
	const escotillaEstudio = new Escotilla(position = game.at(44,5), destino = escotillaBanio, image = "interactuables/trapdoor.png")
	const escondite1 = new Escondite(position = game.at(17,23))
	// NPCs
	const npc1 = new Civil(position = game.at(2,2)) 
	const npc2 = new Civil(position = game.at(15,20))
	const npc3 = new Civil(position = game.at(10,4))
	const npc4 = new Civil(position = game.at(10,7))
	const listaMuertos = []
	
	const objetos = [contadorTiempo, contadorKills, marcoContadorTiempo, marcoContadorKills, jugador, escondite1, escotillaBanio, escotillaEstudio]
	const property objetos2 = [npc1, npc2, npc3, npc4, remera1, veneno1, bomba1]
	const npcs = [npc1, npc2, npc3, npc4]
	
	method configuracionInicial(){
		game.clear()
		jugador.inicializar()
        soundProducer.playMusic()
        // Inicializaciones
		npc1.position(game.at(2,2)) 
	    npc2.position(game.at(15,20))
	    npc3.position(game.at(10,4))
	    npc4.position(game.at(10,7))
	    contadorTiempo.iniciar()
		todasLasParedes.cargar()
		escotillaBanio.destino(escotillaEstudio)
		// Visuales
		objetos.forEach({ objeto => game.addVisual(objeto)})
		objetos2.forEach({ objeto => game.addVisual(objeto)})
		// NPCs - listas
		npcs.forEach({ npc =>
			game.onTick(1000.randomUpTo(10000), "movimiento" , {npc.moverse()} )
			game.onTick(400,"delatarAsesino", {npc.delatarAsesino()} )
		})
		self.configurarTeclas()
	}
	
	method configurarTeclas(){
			keyboard.w().onPressDo({ jugador.moverPara(arriba) })
			keyboard.a().onPressDo({ jugador.moverPara(izquierda) })
			keyboard.s().onPressDo({ jugador.moverPara(abajo) })
			keyboard.d().onPressDo({ jugador.moverPara(derecha) })
			keyboard.r().onPressDo({ jugador.usarCuchillo() })
			keyboard.e().onPressDo({ jugador.agarrarObjeto() })
			keyboard.f().onPressDo({ jugador.usarObjeto() })
			keyboard.g().onPressDo({ jugador.interactuar() })
	}
	
	method agregarMuerto(unMuerto) = listaMuertos.add(unMuerto)
	
	method listaMuertos() = listaMuertos
	
	method removerMuerto(muerto) { listaMuertos.remove(muerto) }
}