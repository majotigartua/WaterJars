accion([A, B, C], [0, B2, C]):- RESTO is (5 - B), A =< RESTO, B2 is B + A, B2 =< 5, B2 \== B.
accion([A, B, C], [A2, 5, C]):- RESTO is (5 - B), A > RESTO, A2 is A - RESTO, A2 =< 8, A2 \== A.

accion([A, B, C], [0, B, C2]):- RESTO is (3 - C), A =< RESTO, C2 is C + A, C2 =< 3, C \== C.
accion([A, B, C], [A2, B, 3]):- RESTO is (3 - C), A > RESTO, A2 is A - RESTO, A2 =< 8, A2 \== A.

accion([A, B, C], [A2, 0, C]):- RESTO is (8 - A), B =< RESTO, A2 is A + B, A2 =< 8, A2 \== A.
accion([A, B, C], [8, B2, C]):- RESTO is (8 - A), B > RESTO, B2 is B - RESTO, B2 =< 5, B2 \== B.

accion([A, B, C], [A, 0, C2]):- RESTO is (3 - C), B =< RESTO, C2 is C + A, C2 =< 3, C2 \== C.
accion([A, B, C], [A, B2, 3]):- RESTO is (3 - C), B > RESTO, B2 is B - RESTO, B2 =< 5, B2 \== B.

accion([A, B, C], [A2, B, 0]):- RESTO is (8 - A), C =< RESTO, A2 is A + C, A2 =< 8, A2 \== A.
accion([A, B, C], [8, B, C2]):- RESTO is (8 - A), C > RESTO, C2 is C - RESTO, C2 =< 3, C2 \== C.

accion([A, B, C], [A, B2, 0]):- RESTO is (5 - B), C =< RESTO, B2 is B + C, B2 =< 5, B2 \== B.
accion([A, B, C], [A, 5, C2]):- RESTO is (5 - B), C > RESTO, C2 is C - RESTO, C2 =< 3, C2 \== C.

profundidad(INICIAL):- profundidad(INICIAL, [4, _, _], [INICIAL]).
profundidad([4, _, _], _ , CAMINO):- write(CAMINO).
profundidad(ESTADO, META, CAMINO):- accion(ESTADO, SUCESOR),
   not(member(SUCESOR, CAMINO)),
   append(CAMINO, [SUCESOR], CAMINO_NUEVO),
    profundidad(SUCESOR, META, CAMINO_NUEVO).
