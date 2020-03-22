
% Sample Code for running for FFTs with different techniques

%%

img = double(rgb2gray(imread('sample.png')));
img = img(:,1:52);
[x,y] = size(img);

figure; subplot(141);
imshow(mat2gray(img));
xlabel('Input Image');



%% 2D FT with 1D FFT Matrix

F = fft(eye([x,y]));
imgcap = fftshift(F*img*F.');
subplot(142);
imagesc(100*log(abs(imgcap)));
xlabel('2D FT with 1D FT');



%% 2D FT with kronecor tensor product

imgvec = img(:);
F2 = kron(F,F);
imgcap2 = F2*imgvec;
imgcap2 = fftshift(reshape(imgcap2,[x,y]));
subplot(143);
imagesc(100*log(abs(imgcap)));
xlabel('2D FT with kronc');



%%

imgcap3 = fft2(img);
subplot(144);
imagesc(100*log(abs(imgcap)));
xlabel('2D FT with fft2');

