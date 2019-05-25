function [ y ] = Umbral( x, b )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[fil,col,c] = size(x); 
%Convertir a escala de grises 
gs2=x;
gs2=uint8(gs2);
%Aplicamos el operador Umbral 
for i = 1:fil
    for j = 1:col
        if gs2(i,j) <= b 
            y(i,j) = 0; 
        else
            y(i,j) = 255;
        end
    end
end
y=uint8(y);
end