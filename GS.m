function [ im ] = GS( x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[fil,col,c] = size(x); 
%Convertir a escala de grises 
for i = 1:fil
    for j = 1:col 
        if c == 3
            im(i,j)=0.299*x(i,j,1)+0.587*x(i,j,2)+0.114*x(i,j,3);
        else
            im(i,j)=x(i,j); 
        end
    end
end 
im=uint8(im);
end

