%-- Inmultire intre un numar mare in baza b si un scalar de dimensiuni mici --%
function x = big_number_multiply(x, b, y)
  r = 0;
  for i = 1:length(x) % pentru fiecare cifra a numarului
    x(i) = x(i) * y + r;
    r = idivide(x(i), b, "floor"); % calculam valoarea care va vi "carried over"
    x(i) = rem(x(i), b); % si noua cifra
  end
  ++i;
  while r != 0 % continuam algoritmul anterior pana cand nu vom mai avea "carry"
    x(i) = rem(r, b);
    r = idivide(r, b, "floor");
    ++i;
  end
end