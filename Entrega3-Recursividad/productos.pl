:- dynamic producto/3.
% producto(Nombre, Precio, Categoria)
producto(manzana, 100, e).
producto(leche, 200, f).
producto(pan, 150, e).
producto(carne, 500, g).
producto(arroz, 250, f).
producto(gaseosa, 180, e).

% Predicado recursivo aumento_productos
% Aumenta 5% todos los productos de la categoría e
aumento_productos :-
    producto(Nombre, Precio, e),         
    NuevoPrecio is Precio * 1.05,        % Aumento del 5%
    retract(producto(Nombre, Precio, e)),% Elimina el hecho viejo
    assert(producto(Nombre, NuevoPrecio, e)), % Inserta el hecho nuevo
    write(Nombre), write(': $'), write(NuevoPrecio),
    write(' (categoria e)'), nl,
    fail. % Prolog sigue buscando más productos

aumento_productos. % Cuando no haya más hechos finaliza.

% Al iniciar la base de conocimientos queda con los productos
% de la siguiente manera:
% producto(manzana, 100, e).
% producto(leche, 200, f).
% producto(pan, 150, e).
% producto(carne, 500, g).
% producto(arroz, 250, f).
% producto(gaseosa, 180, e).

% Y al ejecutar aumento_productos. Se actualizan los productos
% de categoria e y quedan de la siguiente manera:
% manzana: $105.0 (categoria e)
% pan: $157.5 (categoria e)
% gaseosa: $189.0 (categoria e)