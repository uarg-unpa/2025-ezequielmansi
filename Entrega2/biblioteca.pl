% dynamic, permite que los hechos se ejecuten en tiempos de ejecucion.
% SIEMPRE SE DEFINE AL PRINCIPIO.
:-dynamic libro/2.
:-dynamic prestado/2.

libro("el_principito","antoine_de_saint_exupery").
libro("1984","george_orwell").
prestado("el_principito","juan").

%Regla: Un libro está disponible si no está prestado
disponible(Titulo) :- libro(Titulo,_), \+ prestado(Titulo,_).

%Procedimiento para agregar un libro nuevo (al final)
agregar_libro(Titulo,Auto) :- assertz(libro(Titulo,Autor)).

%Procedimiento para agregar un libro nuevo (al inicio)
agregar_libro_al_inicio(Titulo,Autor) :- asserta(libro(Titulo,Autor)).

%Procedimiento para registrar un préstamo
prestar(Titulo,Persona) :- disponible(Titulo),assertz(prestado(Titulo,Persona)).

%Consulta para ver todos los libros
listar_libros :- 
    libro(Titulo, Autor), 
    write('Libro: '), write(Titulo), write(', Autor: '), write(Autor), nl,
    fail.  % Fuerza backtracking para listar todos
listar_libros.  % Clausula vacía para terminar

% Caso 1: el libro existe y no está prestado → se elimina
eliminar_libro(Titulo) :- libro(Titulo, _),
    \+ prestado(Titulo, _),
    retract(libro(Titulo, _)),
    write('Libro eliminado: '), write(Titulo), nl.

% Caso 2: el libro existe pero está prestado → error
eliminar_libro(Titulo) :- prestado(Titulo, _),
    write('Error: Libro '), 
    write(Titulo), 
    write(' está prestado.'), nl,
    fail.

% Caso 3: el libro no existe → error
eliminar_libro(Titulo) :- \+ libro(Titulo, _),
    write('Error: Libro '), 
    write(Titulo), 
    write(' no existe.'), nl,
    fail.

% EJERCICIOS SOLICITADOS

% 1. En Prolog, los hechos normalmente son estáticos: no se pueden agregar, modificar ni eliminar mientras 

% Respuesta: el programa está corriendo. Por lo tanto, cuando se declara dynamic libro y dynamic prestado, se 
% está declarando que los predicados libro/2 y prestado/2 son dinámicos.
% Esto significa que se puede utilizar asserta/1, assertz/1 y retract/1 para agregar o 
% eliminar hechos en tiempo de ejecución.



% PRUEBA: Ejecuta ?- eliminar_libro("1984"). y ?- eliminar_libro("el_principito"). Explica cada ejecución.

% Consulta: ?- eliminar_libro("1984"). 
% Salida: Libro eliminado: 1984 true; Error: Libro 1984 no existe. false.
% Explicacion: En la base está libro("1984","george_orwell"). Como ese libro no está en prestado/2, Prolog entra al Caso 1. 
% Se ejecuta retract(libro("1984","george_orwell")). y Prolog lo elimina de la base.

% Consulta: ?- eliminar_libro("el_principito"). 
% Salida: Error: Libro el_principito está prestado. false.
% Explicacion: Existe libro("el_principito","antoine_de_saint_exupery"). Pero también está prestado("el_principito","juan"). 
% Entonces entra al Caso 2. En este caso no se elimina el libro, y la consulta falla (false).



% EJERCICIO ADICIONAL: Agrega un procedimiento propio eliminar_prestamo(Titulo) usando 
% retract(prestado(Titulo, _)) y pruébalo (e.g., ?- eliminar_prestamo("el_principito").).

eliminar_prestamo(Titulo) :-
    retract(prestado(Titulo, Persona)),
    write('Préstamo eliminado: '), write(Titulo),
    write(' (estaba prestado a '), write(Persona), write(')'), nl.

eliminar_prestamo(Titulo) :-
    \+ prestado(Titulo, _),
    write('Error: No existe préstamo para el libro '), write(Titulo), nl,
    fail.

% Consulta: ?- eliminar_prestamo("el_principito").
% Salida: Préstamo eliminado: el_principito (estaba prestado a juan) true ; Error: No existe préstamo para el libro el_principito false.