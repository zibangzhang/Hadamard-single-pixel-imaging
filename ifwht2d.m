%=======================================================
%FUNCTIONS FOR 2-D SEQUENCY(WALSH),DYADIC(PALEY) AND 
%NATURAL(HADAMARD)ORDERED FAST WALSH-HADAMARD TRANSFORM
%=======================================================
function xx = ifwht2d(xx)
% The function implement the 2D fast Walsh-Hadamard transform.
% The dimension of the matrix must be an integer power of 2.

% Author: Gylson Thomas
% e-mail: gylson_thomas@yahoo.com
% Asst. Professor, Electrical and Electronics Engineering Dept.
% MES College of Engineering Kuttippuram,
% Kerala, India, February 2005.
% copyright 2007.

N = length(xx);
    for i = 1:N
        xx1(i,:) = fhtseq(xx(i,:)); 
    end
% REPLACE fhtseq BY fhtdya FOR DYADIC ORDER AND fhtnat FOR NATURAL ORDER
xx = zeros(N);
    for j = 1:N
        xx(:,j) = fhtseq(xx1(:,j)')';
    end

%-------------------------------------------------------
%1D sequency(Walsh)ordered Fast Walsh-Hadamard Transform
%-------------------------------------------------------
function x=fhtseq(data)
x=bitrevorder(data);
N=length(x);
k1=N; k2=1; k3=N/2;
for i1=1:log2(N)
    L1=1;
    for i2=1:k2
        for i3=1:k3
            i=i3+L1-1; j=i+k3;
            temp1= x(i); temp2 = x(j); 
            if(mod(i2,2) == 0)
              x(i) = temp1 - temp2;
              x(j) = temp1 + temp2;
            else
              x(i) = temp1 + temp2;
              x(j) = temp1 - temp2;
            end
        end
            L1=L1+k1;
    end
        k1 = k1/2;  k2 = k2*2;  k3 = k3/2;
end



%------------------------------------------------------
%1D Dyadic(Paley)ordered Fast Hadamard Transform
%------------------------------------------------------
function x=fhtdya(data)
% The function implement the 1D dyadic (Paley) ordered fast Hadamard transform,
x=bitrevorder(data);
N=length(x);
k1=N; k2=1; k3=N/2;
for i1=1:log2(N)   
    L1=1;
    for i2=1:k2
        for i3=1:k3
            i=i3+L1-1; j=i+k3;
            temp1= x(i); temp2 = x(j); 
            x(i) = temp1 + temp2;
            x(j) = temp1 - temp2;
        end
            L1=L1+k1;
    end
        k1 = k1/2;  k2 = k2*2;  k3 = k3/2;
end


%------------------------------------------------------
%1D Natural(Hadamard)ordered Fast Hadamard Transform
%------------------------------------------------------
function x=fhtnat(data)
% The function implement the 1D natural(Hadamard)ordered Fast Hadamard Transform,
N = pow2(floor(log2(length(data))));
x = data(1:N);
k1=N; k2=1; k3=N/2;
for i1=1:log2(N)
    L1=1;
    for i2=1:k2
        for i3=1:k3
            i=i3+L1-1; j=i+k3;
            temp1= x(i); temp2 = x(j); 
            x(i) = temp1 + temp2;
            x(j) = temp1 - temp2;
        end
            L1=L1+k1;
    end
        k1 = k1/2;  k2 = k2*2;  k3 = k3/2;
end
% x=inv(N)*x; %Delete this line for inverse transform

%------------------------------------------------------
% Function for bit reversal
%------------------------------------------------------
function R = bitrevorder(X)
%Rearrange vector X to reverse bit order,upto max 2^k size <= length(X)
[f,e]=log2(length(X));
I=dec2bin(0:pow2(0.5,e)-1);
R=X(bin2dec(I(:,e-1:-1:1))+1);
