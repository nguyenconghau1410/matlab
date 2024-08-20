I = imread('cameraman.tif');

subplot(2, 2, 1);
imshow(I);

I_salt = imnoise(I, 'speckle', 0);
subplot(2, 2, 2);
imshow(I_salt)

I_poiss = imnoise(I, 'poisson');

J = I + I_poiss;
subplot(2, 2, 3)
imshow(J)


