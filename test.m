% I = im2double(imread('medtest.png'));
% J = regiongrowing(I);
% figure, subplot(1, 2, 1);
% imshow(I);
% subplot(1, 2, 2);
% 
% imshow(imoverlay(I, J, 'yellow'));

 I = imread('figXray.tif');
 g = splitmerge(I, 16, @predicate, 4);
 figure, subplot(1, 2, 1);
 imshow(I);
 subplot(1, 2, 2);
 imshow(g);
