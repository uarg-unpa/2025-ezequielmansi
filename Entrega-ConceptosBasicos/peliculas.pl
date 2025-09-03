% HECHOS
pelicula(inception,ciencia_ficcion). % Inception es una pelicula de ciencia ficcion
pelicula(forrest_gump,drama).
pelicula(life_is_beautiful,drama). % corregí el nombre de live_is_beatiful -> life_is_beautiful
pelicula(argentina_1985,drama).
pelicula(jurassic_park,aventura).
pelicula(interstellar,ciencia_ficcion).
pelicula(titanic,romance).
pelicula(the_matrix,ciencia_ficcion).

actor(leonardo_dicaprio,inception). % Dicaprio actua en Inception
actor(cillian_murphy,inception).
actor(tom_hanks,forrest_gump).
actor(robin_wright,forrest_gump).
actor(matthew_mcconaughey,interstellar).
actor(anne_hathaway,interstellar).
actor(leonardo_dicaprio,titanic).
actor(kate_winslet,titanic).
actor(keanu_reeves,the_matrix).
actor(carrie_anne_moss,the_matrix).

director(christopher_nolan,inception). % Nolan dirige Inception
director(steven_spielberg,jurassic_park).
director(christopher_nolan,interstellar).
director(james_cameron,titanic).
director(lana_wachowski,the_matrix).
director(lilly_wachowski,the_matrix).

sexo(leonardo_dicaprio,masculino).
sexo(cillian_murphy,masculino).
sexo(tom_hanks,masculino).
sexo(robin_wright,femenino).
sexo(matthew_mcconaughey,masculino).
sexo(anne_hathaway,femenino).
sexo(kate_winslet,femenino).
sexo(keanu_reeves,masculino).
sexo(carrie_anne_moss,femenino).

% REGLAS
% Verdadero si el actor actúa en una película de ese genero
actua_en_genero(NombreActor, Genero) :- actor(NombreActor, TituloPelicula), pelicula(TituloPelicula, Genero). 

% Verdadero si dos actores actúan en la misma película
colaboracion(NombreActor1, NombreActor2) :- actor(NombreActor1, TituloPelicula), actor(NombreActor2, TituloPelicula), NombreActor1 \= NombreActor2. 

% Verdadero si el director dirige una película de ese genero
director_de_genero(NombreDirector, Genero) :- director(NombreDirector,TituloPelicula), pelicula(TituloPelicula, Genero).

% Verdadero si una película tiene al menos dos actores distintos
pelicula_con_colaboracion(TituloPelicula) :- actor(NombreActor1,TituloPelicula), actor(NombreActor2,TituloPelicula), NombreActor1 \= NombreActor2.

% Verdadero si un actor trabajó en una película dirigida por un determinado director.
trabajo_con(NombreActor, NombreDirector) :- actor(NombreActor, TituloPelicula), director(NombreDirector, TituloPelicula).

actriz_en_pelicula(NombreActriz,TituloPelicula) :- sexo(NombreActriz,femenino), actor(NombreActriz,TituloPelicula).