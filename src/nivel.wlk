import wollok.game.*
import objetosNiveles.*
import objetos.*
import jugador.*
import civilNPC.*
import direcciones.*

object nivel{
	const npc1 = new Civil(position = game.at(5,5)) 
	const npc2 = new Civil(position = game.at(10,20))
	const npc3 = new Civil(position = game.at(8,15))
	const npc4 = new Civil(position = game.at(2,7))
	const property paredes = #{game.at(0,1), game.at(0,1), game.at(0,2), game.at(0,3),game.at(0,4), game.at(0,5), game.at(0,6), game.at(0,7),game.at(0,8), game.at(0,9), game.at(0,10), game.at(0,11),game.at(0,12), game.at(0,13), game.at(0,14), game.at(0,15), game.at(1,15), game.at(2,15), game.at(3,15), game.at(4,15), game.at(5,15), game.at(6,15), game.at(9,15), game.at(10,15), game.at(11,15), game.at(12,15), game.at(13,15), game.at(14,15), game.at(15,15), game.at(16,15), game.at(12,16), game.at(12,17), game.at(12,18), game.at(12,19), game.at(12,20),game.at(12,21),game.at(12,22),game.at(12,23),game.at(12,24),game.at(12,25),game.at(12,26),game.at(15,15),game.at(15,16),game.at(15,17),game.at(15,18)}  //lista de posiciones imposibles
	const listaMuertos = []
	
	method configuracionInicial(){
		game.clear()
		game.addVisual(vestido)
		game.addVisual(veneno)
		game.addVisual(npc1)
		game.addVisual(npc2)
		game.addVisual(npc3)
		game.addVisual(npc4)
		game.addVisual(jugador)
		game.onTick(500, "movimiento" , {npc1.moverse()})
		game.onTick(500, "movimiento", {npc2.moverse()})
		game.onTick(500, "movimiento", {npc3.moverse()})
		game.onTick(500, "movimiento", {npc4.moverse()})
		game.schedule(100,{unMuerto => npc1.estaCercaDe(unMuerto)})
		game.schedule(100,{unMuerto => npc2.estaCercaDe(unMuerto)})
		game.schedule(100,{unMuerto => npc3.estaCercaDe(unMuerto)})
		game.schedule(100,{unMuerto => npc4.estaCercaDe(unMuerto)})

		
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
	}
	
	method agregarMuerto(unMuerto) = listaMuertos.add(unMuerto)
	
	method existeMuerto(unMuerto) = listaMuertos.contains(unMuerto) && unMuerto.esCadaver()
}


