function r = baza(sursa, b1, b2)
  x = [0];
  sursa = tolower(sursa); % tratam si cazul cu uppercase
  
  for i = length(sursa):-1:1
    if sursa(i) >= 'a' && sursa(i) <= 'z'
      n = sursa(i) - 'a' + 10;
    elseif sursa(i) >= '0' && sursa(i) <= '9'
      n = sursa(i) - '0';
    else
      n = 0;
    end
    % aux va fi un numar mare ce va retine cifra_i * baza_veche ^ i in baza noua
    aux = [1];
    aux = big_number_multiply(aux, b2, n);
    for j = (i + 1):length(sursa)
      aux = big_number_multiply(aux, b2, b1);
    end
    % adunam valoarea obtinuta pentru cifra curenta la x (x este in noua baza)
    x = big_number_add(x, b2, aux);
  end
  
  % trecem de la vector de numere (care sunt cifrele in noua baza) la string
  r = '';
  for i = 1:length(x)
    if x(i) <= 9
      n = '0' + x(i);
    else
      n = 'a' + x(i) - 10;
    end
    r(length(x) - i + 1) = n;
  end
end