%-- Adunarea a doua numere mari in baza b --%
function x = big_number_add(x, b, y)
  r = 0; % Acesta va fi "carry"-ul
  % algoritmul este standard, adunarea facandu-se cifra cu cifra
  for i = 1:length(x)
    if i <= length(y)
      x(i) += y(i);
    end
    x(i) += r;
    r = idivide(x(i), b, "floor");
    x(i) = rem(x(i), b);
  end
  ++i;
  for j = i:length(y)
    x(j) = y(j);
  end
  while r != 0
    if i <= length(y)
      x(i) += rem(r, b);
    else
      x(i) = rem(r, b);
    end
    r = idivide(x(i), b, "floor");
    x(i) = rem(x(i), b);
    ++i;
  end
end