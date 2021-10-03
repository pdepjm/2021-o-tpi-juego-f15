import wollok.game.*
import objetosNiveles.*
import objetos.*
import jugador.*
import civilNPC.*
import direcciones.*


object nivel{
	const npc1 = new Civil() 
	const npc2 = new Civil()
	const npc3 = new Civil()
	const npc4 = new Civil()
	const property paredes = #{game.at(0,1), game.at(0,1), game.at(0,2), game.at(0,3),game.at(0,4), game.at(0,5), game.at(0,6), game.at(0,7),game.at(0,8), game.at(0,9), game.at(0,10), game.at(0,11),game.at(0,12), game.at(0,13), game.at(0,14), game.at(0,15), game.at(1,15), game.at(2,15), game.at(3,15), game.at(4,15), game.at(5,15), game.at(6,15), game.at(9,15), game.at(10,15), game.at(11,15), game.at(12,15), game.at(13,15), game.at(14,15), game.at(15,15), game.at(16,15), game.at(12,16), game.at(12,17), game.at(12,18), game.at(12,19), game.at(12,20),game.at(12,21),game.at(12,22),game.at(12,23),game.at(12,24),game.at(12,25),game.at(12,26),game.at(15,15),game.at(15,16),game.at(15,17),game.at(15,18)}  //lista de posiciones imposibles
	
	method configuracionInicial(){
		game.clear()
		game.addVisual(vestido) 
		game.addVisual(npc1) 
		game.addVisual(npc2)
		game.addVisual(jugador) 
		game.onTick(1000, "movimiento" , {npc1.moverse()}) //para el movimiento de los npc pero es para probar algo dsp lo cambiamos
		game.onTick(1000, "movimiento", {npc2.moverse()})
		self.configurarTeclas()
	}
	
	method configurarTeclas(){
		// FALTA CONFIGURAR EL MANTENER APRETADO LAS TECLAS (whenKeyPressedDo)
		keyboard.w().onPressDo({ jugador.moverPara(arriba) })
		keyboard.a().onPressDo({ jugador.moverPara(izquierda) })
		keyboard.s().onPressDo({ jugador.moverPara(abajo) })
		keyboard.d().onPressDo({ jugador.moverPara(derecha) })
		keyboard.r().onPressDo({ jugador.usarCuchillo() })
		keyboard.e().onPressDo({ jugador.agarrarObjeto() })
		keyboard.q().onPressDo({ jugador.soltarObjeto() })
		keyboard.f().onPressDo({ jugador.usarObjeto() })
	}
}


