import wollok.game.*

object policiaNPC {
	
	method image() = "police.png"
	
	method irHacia(objetivo){
		/* polcia se mueve hasta el objetivo */
		objetivo.policia()
	}
	
	
	
}
