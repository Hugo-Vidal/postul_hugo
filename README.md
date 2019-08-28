# App Roulette WEB

Esta aplicación permite monitorear resultados históricos para los juegos de una ruleta. Los jugadores componen un grupo dinámico, cuyas apuestas ocurren con diferentes probabilidades, así también como el monto de dicha apuesta.

Paso a paso:

1. Crear Jugadores: Dirigirse a "Lista de jugadores" y clickear "Nuevo jugador", luego agregar nombre y monto inicial de dinero para las apuestas.

2. Reglas del juego:
    - En cada ronda los jugadores apuestan entre un 8% y 15% del total de dinero que poseen. Si el jugador tiene $1.000 o menos, apostará todo. Si no les queda dinero, no podrán apostar.
    En caso de que esté pronosticado una temperatura superior a 25ºC dentro de los próximos 7 días en Santiago de Chile, las apuestas serán más conservadoras y cambian a un valor aleatorio entre 3% y 7%.
    - Cada jugador puede apostar a ​Verde, Rojo o Negro ​con un 2%, 49% y 49% de probabilidad respectivamente.
    - La ruleta mantiene la misma probabilidad de apuestas que los jugadores.

3. Rondas: Cada 3 minutos se jugará automáticamente y con todos los jugadores creados. 

4. Ganancias/Pérdidas:
    - Cuando el jugador acierte Rojo o Negro, recuperará el doble de lo apostado. En caso de acertar Verde, recuperará 15 veces lo apostado.
    - Cuando un jugador no acierta, perderá todo lo apostado.

5. Monitoreo de los juegos: En la raiz(home) de la aplicación, puede visualizar el resultado histórico de cada juego. Esta vista se refrescará a cada minuto.

Gracias.

