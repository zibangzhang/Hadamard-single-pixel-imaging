function [ hadamardPattern ] = getHadamardPattern( nPoint, u, v, initPhase )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    spec = zeros(nPoint, nPoint);
    spec(u, v) = 1;
    
    hadamardPattern  = (ifwht2d(spec)*nPoint + 1) / 2;
    
    if initPhase == -1
        hadamardPattern = 1 - hadamardPattern;
    end
end

