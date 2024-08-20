clc
clear
close all
img = (imread('abcxyz.jpg'));

[featureVector,hogVisualization] = extractHOGFeatures(img);

figure;
subplot(1,2,1)
imshow(img)
title('Original Image','FontSize',20)

subplot(1,2,2)
imshow(img); 
hold on;
plot(hogVisualization);
title('Histogram of Gradients','FontSize',20)
set(gcf,'Color','w');