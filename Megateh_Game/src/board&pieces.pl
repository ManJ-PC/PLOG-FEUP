piece(flat).
piece(holed).
piece(doubleFlat).
piece(doubleHoled).
piece(empty).

char(flat,'f').
char(holed, 'h').
char(doubleFlat, 'dF').
char(doubleHoled, 'dH').
char(empty, ' ').

height(empty,0).
height(flat,1).
height(holed,1).
height(dF,2).
height(dH,2).

empty_board([[empty,empty,empty,empty],
               [empty,empty,empty,empty],
               [empty,empty,empty,empty],
               [empty,empty,empty,empty]
              ]).

empty_height([[0,0,0,0],
              [0,0,0,0],
              [0,0,0,0],
              [0,0,0,0]
             ]).

empty_numPieces([[0,0,0,0],
                 [0,0,0,0],
                 [0,0,0,0],
                 [0,0,0,0]
                ]).

display_board([],_):-
        write('     '), write('  ---------------------------------'), nl, nl,
        write('     '), write('      A       B       C       D '), nl.

display_board([Head|Tail],NumRows):- 
        write('    '), write('   ---------------------------------'),nl,
        write('    '), draw_empty_line([]),
        write('   '), write(NumRows), draw_line(Head), nl,
        write('    '), draw_empty_line([]),
        NewNumRows is NumRows - 1,
        display_board(Tail, NewNumRows).

draw_empty_line([]):-
        write('   '), write('|'),write('       '),
        write('|'), write('       '), write('|'),
        write('       '), write('|'), write('       '),
        write('|'), nl.

draw_line([]) :-
        write('   |   ').

draw_line([Head|Tail]) :-
        char(Head,S),
        write('   |   '), write(S), 
        draw_line(Tail).

get_piece(0,Col,[Head|_],Char):-
        get_list_element(Col,Head,Char).

get_piece(Row,Col,[_|Tail], Char):-
        Row > 0,
        NewRow is Row - 1,
        get_piece(NewRow,Col,Tail,Char).