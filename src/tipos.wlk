import wollok.game.*
import interactuables.*
import jugador.*
import objetos.*
import paredes.*
import policiaNPC.*

object vivo{
	method es(vivo) = vivo.estaVivo()
}

object tipoInteractuable{
	method es(int) = int.esInteractuable()
}

object tipoNpc{
	method es(npc) = npc.esNPC()
}

object tipoAtravesable{
	method es(atravesable) = atravesable.esAtravesable()
}

object tipoObjeto{
	method es(objeto) = objeto.esObjeto()
}