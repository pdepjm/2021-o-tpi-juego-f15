# Fiesta Dura
## Equipo de desarrollo

- Basile, Bautista - 
- Buffoni, Julian - @JulianBuffoni
- Demattei, Santiago - @SantiagoDemattei
- Ingratta, Daniela - @daniingratta
- Solari Parravicini, Joaquin - 
- Torales, Pedro Imanol - @PedroTorales
## Capturas

- Pantalla de Carga
![pantallaDeCarga](https://imgur.com/RbzasyD.png)

## Reglas de Juego / Instrucciones

|INSTRUCCIONES               |            |
|---------------|------------|
|Movimiento     | w, a, s, d |
|Usar Cuchillo  |     r      |
|Agarrar Objeto |     e      |
|Soltar Objeto  |     q      |
|Usar Objeto    |     f      |
|Usar Escotilla |     g      |

**REGLAS**

Nuestro protagonista no soporta la música en la madrugada, los borrachos, las drogas, los vecinos que no pueden dormir…

Algo hace clic en su cabeza y entra a la accion: "el que no respira no molesta".
El objetivo del jugador es intentar matar a todas las personas de la fiesta con la mayor discreción a fin de que la policía no lo atrape, todo esto, dentro de un lapso de 90 segundos.

Para *silenciar* a los jóvenes el jugador podra utilizar un cuchillo (que siempre tiene a disposicion) u otros objetos que encuentre en el lugar. Ademas, para desplazarse con mayor rapidez puede hacer uso de escotillas, que le permiten moverse intantanseamente entre 2 posiciones del mapa.
## Respuestas teóricas

1. **Polimorfismo**: ¿Cuál es el mensaje polimórfico? ¿Qué objetos lo implementan? ¿Qué objeto se aprovecha de ello?

```wollok

```

2. **Colecciones**: ¿Qué operaciones de colecciones se utilizan? ¿Usaron mensajes con y sin efecto? ¿Para qué?



3. **Clases**: ¿Usan clases? ¿Por qué? ¿Dónde o cuándo se instancian los objetos?

    Definimos la clase "*Objeto*" para poder codear una unica vez los atributos que definen a un "*objeto*", en vez de hacerlo para cada "*objeto*" en particular.
    Los "*objetos*" se instancian en la configuracion inicial del nivel, luego de salir de la pantalla de carga

4. **Herencia**: ¿Entre quiénes y por qué? ¿Qué comportamiento es común y cuál distinto?



5. **Composición**: ¿Qué objetos interactúan? ¿Dónde se delega? ¿Por qué no herencia?

