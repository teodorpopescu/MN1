%--   Returneaza castigatorul pentru o configuratiei a jocului sau 0 daca--%
%--nu exista inca un invingator--%
function x = tictactoe_is_won(m)
  % se verifica liniile si coloanele
  for p = 1:3
    if m(p, 1) != 0 && m(p, 1) == m(p, 2) && m(p, 2) == m(p, 3)
      x = m(p, 1);
      return
    end
    if m(1, p) != 0 && m(1, p) == m(2, p) && m(2, p) == m(3, p)
      x = m(1, p);
      return
    end
  end
  % se verifica diagonalele
  if m(1, 1) != 0 && m(1, 1) == m(2, 2) && m(2, 2) == m(3, 3)
    x = m(1, 1);
    return
  end
  if m(3, 1) != 0 && m(3, 1) == m(2, 2) && m(2, 2) == m(1, 3)
    x = m(3, 1);
    return
  end
  % nu s-a gasit un castigator
  x = 0;
end