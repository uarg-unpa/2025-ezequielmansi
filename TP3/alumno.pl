% EJERCICIO 1 TP3
:- dynamic(alumno/1).
alumno(gonzales).
alumno(perez).
alumno(aguirre).
escuela(gonzales, industrial6).
escuela(perez, enet1).
es_alumno(X,Y) :- alumno(X), escuela(X,Y).

% listing para listar
% assert agrega en el hecho que sigue, asserta para inserta al principio, assertz para insertar al final
% retract para eliminar
% se usan asi: asserta(alumno(mansilla)), o retract(alumno(mansilla))
% X is random(10) 

% EJERCICIO 1 DEL TP N4
% Punto de entrada
aleatorio :- numeros(1).

% Caso base: cuando llegamos a 10, imprimimos y terminamos, sin volver a llamar
numeros(10) :- X is random(10), write(X), nl.

% Caso general: mientras sea menor a 10, generamos nro e imprimimos
numeros(C) :- C < 10, X is random(10), write(X), nl, C1 is C + 1, numeros(C1).

% Ejercicio EJEMPLO: Sumar N veces un nro
sumar_veces(0,_,0). % No importa las veces que quiera sumar 0, mi resultado va a ser 0
sumar_veces(X,Y,R) :- X =\= 0, suma(X,Y,0,0,R). % No es necesario un write, ya que cuenta con una variable R para imprimir el resultado
% Caso base
suma(X,Y,C,A,R) :- Y =:= C, R is A.
% Caso general
suma(X,Y,C,A,R) :- C<Y, A1 is X+A, C1 is C+1, suma(X,Y,C1,A1,R).