% HECHOS
pelicula(inception,ciencia_ficcion). % Inception es una pelicula de ciencia ficcion
pelicula(forrest_gump,drama).
pelicula(live_is_beatiful,drama).
pelicula(argentina_1985,drama).
pelicula(jurassic_park,aventura).

actor(leonardo_dicaprio,inception). % Dicaprio actua en Inception
actor(cillian_murphy,inception).
actor(tom_hanks,forrest_gump).
actor(robin_wright,forrest_gump).

director(christopher_nolan,inception). % Nolan dirige Inception
director(steven_spielberg,jurassic_park).

sexo(leonardo_dicaprio,masculino).
sexo(cillian_murphy,masculino).
sexo(tom_hanks,masculino).
sexo(robin_wright,femenino).

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