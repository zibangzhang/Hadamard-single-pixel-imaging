function [spec] = specshow( complexFourierSpec, mode )
%SPECSHOW Summary of this function goes here
%   Detailed explanation goes here
    [mRow, nCol] = size(complexFourierSpec);
    fxArr = linspace(-0.5, 0.5, nCol);
    fyArr = linspace(0.5, -0.5, mRow);

    spec = log(1+abs(complexFourierSpec)).^(1/6);
%     spec = (spec - min(min(spec))) ./ (max(max(spec)) - min(min(spec)));
    
    figure, imagesc(fxArr, fyArr, spec), colormap gray
    figure, imagesc(spec), colormap gray
    figure, imagesc(1-mat2gray(spec)), colormap gray
end

