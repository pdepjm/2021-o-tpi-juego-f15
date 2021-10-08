import wollok.game.*
import metodosGenericos.*

object policiaNPC {
	
	method image() = "police.png"
	
	method irHacia(objetivo){
		/* polcia se mueve hasta el objetivo */
		objetivo.policia()
	}
}