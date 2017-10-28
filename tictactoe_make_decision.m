% m = tabla de joc, x = -1 sau 1 (jucatorul care muta)
% move_x = 0 daca jocul s-a terminat deja
% winner = 1 daca -1 castiga, 1 daca 1 castiga sau 0 pentru egal
function [move_x, move_y, winner] = tictactoe_make_decision(m, x)
  winner = tictactoe_is_won(m);
  move_x = move_y = 0;
  if winner != 0
    return % s-a ajuns la o frunza a arborelui de decizie
  end
  
  % folosim backtracking pentru a analiza toate posibilitatile
  n_empty = 0;
  for p = 1:3
    for q = 1:3
      if m(p, q) == 0
        m(p, q) = x;
        [aux_x, aux_y, aux_winner] = tictactoe_make_decision(m, -x);
        if n_empty == 0 || x * aux_winner > x * winner
          winner = aux_winner;
          move_x = p;
          move_y = q;
        end
        if winner * x > 0
          return %   s-a gasit o configuratei castigatoare chiar daca adversarul
                 % joaca ideal
        end
        ++n_empty;
        m(p, q) = 0;
      end
    end
  end
end