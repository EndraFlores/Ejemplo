%limpiar variables
clear all
%leer la imagen
x=imread('coloredChips.png');

%escala de grises
grises = rgb2gray(x);

%
Lab= rgb2lab(x);

%
Ind= rgb2ind(x,200);

%
Hsv= rgb2hsv(x);

%Mostrar imagen original
subplot (1,5,1);
imshow(x)
title('original')

%Mostrar imagen
subplot (1,5,2);
imshow(grises)
title('GS')

%mostrar la imagen 
subplot(1,5,3);
imshow(Lab)
title('Lab')

%mostrar la imagen 
subplot(1,5,4);
imshow(Ind)
title('Ind')

%mostrar la imagen 
subplot(1,5,5);
imshow(Hsv)
title('Hsv')




