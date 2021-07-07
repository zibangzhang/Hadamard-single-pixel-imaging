% Function to generate a square matrix of size NxN
% whose elements are integers going from 1 to N^2
% following the zig zag scan pattern
% used in image compression patterns, like JPEG.
%
% Input:
% N: the size of the matriz
%
% Output:
% zz_mtx: the zig zag matriz
%
% Raíza Oliveira 
% E-mail: rdso1@de.ufpe.br
% May 22, 2016

function zz_mtx = zigzag(N)
    % Creating a NULL matriz
    zz_mtx = zeros(N);
    
    % Generating the first column
    for n = 2:N+1
        zz_mtx(n-1, 1) = 1/2*(-1)^n*(n+(-1)^n*((n-2)*n+2)-2);
    end
    
    % Generating the rows recursively
    for i = 1:N
        for j = 2:N
            if ((mod(i, 2) == 0 && mod(j, 2) == 0) || (mod(i, 2) == 1 && mod(j, 2) == 1))
                zz_mtx(i, j) = zz_mtx(i, j-1) + (2*i-1);
            else 
                zz_mtx(i, j) = zz_mtx(i, j-1) + (j-1)*2;
            end
        end
    end
    
    % Correcting the elements bellow the secondary diagonal
    zz_mtx = fliplr(zz_mtx);
    
    for i = 2:N
        for j = 1:N-1
            if i>j
                zz_mtx(i, j) = zz_mtx(i, j) - (i-j)^2;
            end
        end
    end
    
    % Final zig zag matrix
    zz_mtx = fliplr(zz_mtx);
end