function [img, spec] = getHSPIReconstruction( dataMat, nStep )
    if nStep == 2
        spec = dataMat(:,:,1) - dataMat(:,:,2);
        img  = ifwht2d(spec);
    end
end
