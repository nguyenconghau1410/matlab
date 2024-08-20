%% fourier of an image/ tham khao fft2 help

I = imread('ccc.jpg');
I_gray = rgb2gray(I);
figure
imshow(I_gray);
title('Image', 'FontSize', 20);

%% Fourier transform
F = fft2(I_gray);    % Fourier transform
S = abs(F);     % tinh bien do cua F = Sqrt(Real^2 + Imaginary^2)

figure
imshow(S,[])    % ve bien do cua F, chua doi truc (0,0) vào giua
title('Amplitude of Fourier Image (not center)', 'FontSize', 20);

%% Fourier centered spectrum (doi truc toa do vao giua buc anh)
F_shift = fftshift(F);      % anh Fourier sau khi doi truc vao giua
S_shift = abs(F_shift);     % bien do cua F_shift
figure
imshow(S_shift,[])
title('Amplitude of Fourier Image (center)', 'FontSize', 20);

% apply log transform
S2 = log(1+abs(F_shift));
figure
imshow(S2,[])
title('Log Magnitude with center', 'FontSize', 20);
colorbar

% reconstruct image
F = ifftshift(F_shift);
f = ifft2(F);                   % ham bien doi Fourier nguoc
figure
imshow(f,[]);
title('reconstruct image', 'FontSize', 20);