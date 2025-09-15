producto(laptop, 800). % producto(Nombre, Precio)
producto(celular, 300).
producto(tablet, 150).

% Regla con cut: Clasifica productos como 'caro' (>500), 'medio' (200-500), 
% o 'barato' (<200), usando cut para cortar una vez encontrada la categoría.

clasificar(Producto, Categoria) :- producto(Producto, Precio), Precio > 500, Categoria = caro, !. % Cut: No backtrack si caro
clasificar(Producto, Categoria) :- producto(Producto, Precio), Precio >= 200, Precio =< 500, Categoria = medio, !. % Cut: No backtrack si medio
clasificar(Producto, Categoria) :- producto(Producto, Precio), Precio < 200, Categoria = barato.

% Prueba: Ejecuta ?- clasificar(laptop, C). Explica qué pasa sin cut Elimina un cut y prueba para ver la diferencia.

% Consulta con cut: ?- clasificar(laptop, C).
% Salida: C = caro.

% Consulta sin cut:
% Salida: C = caro; false.

% Explicacion: sin cut (!), Prolog intentará verificar otras cláusulas de forma innecesario.
% Por ej: si borro el ! de la primer regla, Prolog encontrará que laptop cumple con Precio > 500
% Pero como no hay cut, al pedir más respuestas, Prolog intenta otras clausulas, es decir,
% Verifica la segunda regla → falla, y verifica la tercera → falla.
% Al final solo quedará C = caro, pero Prolog revisó todas las reglas de manera innecesario.



% Ejercicio Adicional: Agrega una regla propia con cut,, es_oferta(Producto) si precio < 300, usando cut para cortar si no es oferta.
% Un producto es oferta si cuesta menos de 300
es_oferta(Producto) :- producto(Producto, Precio), Precio < 300, !, 
    write(Producto), write(' es una oferta!'), nl.

% Si no cumple, cortamos y devolvemos false
es_oferta(Producto) :- producto(Producto, Precio), Precio >= 300, !, 
    write(Producto), write(' no es una oferta.'), nl, fail.

% PRUEBAS
% Consulta: ?- es_oferta(tablet).
% Salida: tablet es una oferta! true.

% Consulta: ?- es_oferta(celular).
% Salida: celular no es una oferta. false.

% Consulta: ?- es_oferta(laptop).
% Salida: laptop no es una oferta. false.

% Explicacion: Mediante el uso de cut podemos asegurar que una vez evaluado el precio,
% Prolog no buscará más reglas para el mismo producto