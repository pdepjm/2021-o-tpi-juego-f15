# Fiesta Dura
## Equipo de desarrollo
---

- Basile, Bautista - @bautibasileutn
- Buffoni, Julian - @JulianBuffoni
- Demattei, Santiago - @SantiagoDemattei
- Ingratta, Daniela - @daniingratta
- Solari Parravicini, Joaquin - @jsolarip
- Torales, Pedro Imanol - @PedroTorales
## Capturas
---

- Pantalla de Carga
![pantallaDeCarga](https://imgur.com/RbzasyD.png)

- Gameplay 4K HDR
![gameplay](https://imgur.com/R9yyIs1.png)

- Pantalla de Victoria
![pantallaDeVictoria](https://imgur.com/umRjuwJ.png)

## Reglas de Juego / Instrucciones
---

|INSTRUCCIONES               |            |
|---------------|------------|
|Movimiento     | w, a, s, d |
|Usar Objeto    |     e      |
|Interactuar    |     f      |
|               |            |

**REGLAS**

Nuestro protagonista no soporta la música en la madrugada, los borrachos, las drogas, los vecinos que no pueden dormir…

Algo hace clic en su cabeza y entra a la accion: "el que no respira no molesta".
El objetivo del jugador es intentar matar a todas las personas de la fiesta con la mayor discreción a fin de que la policía no lo atrape, todo esto, dentro de un lapso de 90 segundos.

Para *silenciar* a los jóvenes el jugador podra hacer uso de divversos objetos que encuentre en el lugar. Ademas, para desplazarse con mayor rapidez puede hacer uso de escotillas, que le permiten moverse instantaneamente entre 2 posiciones del mapa.
## Respuestas teóricas
---

1. **Polimorfismo**: ¿Cuál es el mensaje polimórfico? ¿Qué objetos lo implementan? ¿Qué objeto se aprovecha de ello?

Los objetos que pertenecen a la clase "*Objeto*" (remera, cuchillo, veneno, bomba) y el objeto "*vacio*" entienden el mensaje "*usar()*", y es el objeto "*jugador*" el que interactua con ellos indistintamente de cual de ellos se trate.
Cuando se presiona la tecla "*e*" del teclado, "*jugador*" recibe el mensaje "*usarObjeto()*", de manera que el "*objeto*" que tiene en la mano recibe el mensaje polimorfico.

---
2. **Colecciones**: ¿Qué operaciones de colecciones se utilizan? ¿Usaron mensajes con y sin efecto? ¿Para qué?

|Operaciones|Efecto/Consulta|
|-----------|---------------|
|forEach    |Efecto         |
|anyOne     |Consulta       |
|add        |Efecto         |
|remove     |Efecto         |
|head       |Consulta       |
|filter     |Consulta       |
|           |               |

Todos los objetos del juego se encuentran agruapados en listas. Se hace uso de "**forEach**" en "nivel.wlk" para hacer "*addVisual()*" (efecto) de cada uno de ellos.

"**anyOne**" es utilizado para consultar de forma aleatoria un numero para poder determinar la posicion en la que un NPC se movera en "*direccionRandom()*".

"**head**" es utilizado con el fin de consultar con que objeto un jugador debe interactuar, cuando recibe el mensaje "*interactuar()*".

"**add**" y "**remove**" son utilizados para agregar o quitar objetos de "interactuables" (efecto), lo que permite al jugador interactuar con los mismo.

"**filter**" es utilizado para filtrar los objetos cercanos al jugador que se encuentran en la lista "interactuables", de manera que solo pueda interactuar con aquellos que cumplan con la condicion "*estaMuerto()*".

3. **Clases**: ¿Usan clases? ¿Por qué? ¿Dónde o cuándo se instancian los objetos?

    Definimos la clase "*Civil*", que se instancia en "*nivel*" en la configuracion inicial del nivel para agregar multiples objetivos que tenemos que asesinar.

4. **Herencia**: ¿Entre quiénes y por qué? ¿Qué comportamiento es común y cuál distinto?

    Definimos la clase "*Objeto*" para poder definir la interfaz para todos los "*objetos*", en vez de hacerlo para cada uno de ellos individualmente, con el objetivo de evitar repetir logica y/o codigo.

    Los "*objetos*" se instancian en la "*configuracionInicial()*" de "nivel.wlk", luego de salir de la pantalla de carga.

    Los "*objetos*" pertenecientes a la clase comparten los siguientes atributos / metodos:

    ```javascript
    const property esAtravesable = true
	var property position = game.at(10,10)
	var imageAux
	
	method imageAux(auxiliar) { imageAux = auxiliar } 
	
	method image() = "objetos/" + imageAux + ".png"
	
	method efectoHumo(){}
	
	method estaMuerto() = false

	method interaccion() { jugador.reemplazarObjeto(self) }
	
	method vioMuerto(){}
	
	method explotar(){ nivel.quitar(self) }
	
	method soltar(){
		position = jugador.position()
		nivel.agregar(self)
		jugador.objeto(vacio)
	}
	
	method morir() {}
	
	method serAgarrado() {
		jugador.objeto(self)
		nivel.quitar(self)
    }
    
    method tirar(){ game.say( jugador, "Podria servirme en un futuro el objeto " + self.toString() ) }
    ```

    Sin embargo, cada "*objeto*" posee un metodo "*usar()*" propio, ya que cada uno de ellos debe reaccionar de manera diferente.

5. **Composición**: ¿Qué objetos interactúan? ¿Dónde se delega? ¿Por qué no herencia?

"*Civil*" hace uso de la composicion e interactua con "*vivo*" y "*muerto*" mediante el atributo "estado".

Se escogio utilizar composicion en lugar de herencia en esta ocasion debido a que necesitamos que el civil pueda cambiar de estado vivo a muerto cuando este es brutalmente aniquilado por el desquisiado asesino y el enfermo que lo controla.
En caso de haber hecho uso de herencia, el "cambio de estado" no se podria haber dado como tal, y deberiamos haber instanciado a "CivilMuerto", por ejemplo, con los datos pertinentes de "CivilVivo" cada vez que este deje el plano fisico de existencia.

## Diagrams

![Diagrama](https://imgur.com/oYFvV2w.png)