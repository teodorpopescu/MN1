function Z = zigzag(n)
  %-----Initializari-----%
  Z = zeros(n); % se creeaza matricea n x n
  x = 0;
  i = 1; j = 1; % parcurgerea incepe din coltul stanga-sus
  up = true; % initial parcurgerea se face 'in sus'
  
  %------Parcurgere------%
  while i <= n && j <= n
    Z(i,j) = x++;
    
    if up % daca parcurgerea se face 'in sus'
    
      if j == n % daca s-a ajuns pe ultima coloana
        up = false; % se schimba sensul de parcurgere
        ++i; % se schimba diagonala 

      elseif i == 1 % daca s-a ajuns pe prima linie
        up = false; % se schimba sensul de parcurgere
        ++j; % se schimba diagonala
      
      else % continuam parcurgerea in acelasi sens, pe aceeasi diagonala
        --i; ++j;
      end
      
    else % daca parcurgerea se face 'in jos'
    
      if i == n % daca s-a ajuns pe ultima linie
        up = true; % se schimba sensul de parcurgere
        ++j; % se schimba diagonala
        
      elseif j == 1 % daca s-a ajuns pe prima coloana
        up = true; % se schimba sensul de parcurgere
        ++i; % se schimab diagonala
      
      else % continuam parcurgerea in acelasi sens, pe aceeasi diagonala
        ++i; --j;
      end
    end
  end
end