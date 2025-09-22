% Caso base: cuando M = 10
tabla(N, 10) :-
    R is N * 10,
    write(N), write(' x 10 = '), write(R), nl.

% Caso general: mientras M < 10
tabla(N, M) :-
    M < 10,
    R is N * M,
    write(N), write(' x '), write(M), write(' = '), write(R), nl,
    M1 is M + 1,
    tabla(N, M1).

% Consultas:
% tabla(5,1).
% RESULTADO: 5 x 1 = 5
%5 x 2 = 10
%5 x 3 = 15
%5 x 4 = 20
%5 x 5 = 25
%5 x 6 = 30
%5 x 7 = 35
%5 x 8 = 40
%5 x 9 = 45
%5 x 10 = 50

% tabla(2,1).
% RESULTADO:2 x 1 = 2
%2 x 2 = 4
%2 x 3 = 6
%2 x 4 = 8
%2 x 5 = 10
%2 x 6 = 12
%2 x 7 = 14
%2 x 8 = 16
%2 x 9 = 18
%2 x 10 = 20

% tabla(10,1).
% RESULTADO:10 x 1 = 10
%10 x 2 = 20
%10 x 3 = 30
%10 x 4 = 40
%10 x 5 = 50
%10 x 6 = 60
%10 x 7 = 70
%10 x 8 = 80
%10 x 9 = 90
%10 x 10 = 100