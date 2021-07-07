%% Simulating of single-pixel imaging with Hadamard basis pattenrs
% Author: Zibang Zhang
% E-mail: charles.cheung.zzb@gmail.com

close all
clear all
clc
TimeStamp = datestr(now, 'YYmmDD_HHMMSS');

%% Parameters
nStep = 2;
amp = 1;
SNR = 0;

% Get input image
[imgFile pathname] = uigetfile({'*.bmp;*.jpg;*.tif;*.png;*.gif'','...
    'All Image Files';'*.*','All Files'});
InputImg = im2double(imread([pathname '\' imgFile]));

figure,imshow(InputImg);title('Input image'); axis image;

[mRow, nCol] = size(InputImg);
if mRow ~= nCol
    error('Hadamrad requries square input image.');
else
    nPixel  = mRow;
end

% Get the order matrix
PathMat = zigzag(nPixel);

% Get the path matrix
nCoeft = nPixel^2;

tic;
for iCoeft = 1:nCoeft
     [iRow, jCol] = find(PathMat == iCoeft);
    
    % Show fringe patterns and Capture
    for iStep = 1:nStep
        Pattern = getHadamardPattern(nPixel, iRow, jCol, -(-1)^iStep);
        IntensityMat(iRow,jCol,iStep) = sum(sum(Pattern .* InputImg));
    end
end

toc;

[img, spec] = getHSPIReconstruction( IntensityMat, nStep );

% figure, imagesc(img); colormap gray; title('Reconstructed Img');
figure, imagesc(img); caxis([0 1]); axis image; colormap gray; title('Reconstructed Img');
figure, specshow(spec);


ResultFolderName = sprintf('[%s]Hadamard_Simulation_mRow=%d_nCol=%d_nStep=%d', TimeStamp, mRow, nCol, nStep);

mkdir(ResultFolderName);
ResultFileName = 'results.mat';
ResultFilePath = fullfile(ResultFolderName, ResultFileName);
save(ResultFilePath);