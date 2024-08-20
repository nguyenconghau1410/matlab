I = imread('cameraman.tif');
figure
imshow(I);
I_dtc = dct2(I);
I_dtc = I_dtc - 100;
figure
res = idct2(I_dtc);
imshow(res);