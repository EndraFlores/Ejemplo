function [ G ] = Funcion_opSobel( im,b )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here


%
im=double(im);
[fil,col]=size(im);
%Matrices para calcular el filtro 
G=zeros(fil,col); 
Gbin=zeros(fil,col);
Gx=zeros(fil,col);
Gy=zeros(fil,col);
%M?scara y sus ?ndices 
x=[1 0 -1;2  0 -2;1 0 -1];
y=[-1 -2 -1;0 0 0;1 2 1]
%?ndices de la m?scara para recorrerla en la imagen 
f1=1;f2=3;
c1=1;c2=3; 
m1=1;m2=1;
suma1=double(0);
suma2=double(0);
%para binarizar los bordes 
%disp('Detección de bordes, por diferencia de pixeles.');
%b=input('Umbral para la binarización de los bordes = ');
%aplicaci?n del operadr 
for i=1:fil-2
    for j=1:col-2
        for k=f1:f2
            for l=c1:c2
                suma1=suma1 + (im(k,l) * x(m2,m1));
                suma2=suma2 + (im(k,l) * y(m2,m1));
                m1=m1+1;
            end
            m1=1;
            m2=m2+1;
        end
        m2=1;
        Gx(i+1,j+1)=round(suma1);
        Gy(i+1,j+1)=round(suma2);
        G(i+1,j+1)=((Gx(i+1,j+1))^2+(Gy(i+1,j+1))^2)^(1/2);
    %Binarizar la matriz
        if G(i+1,j+1)<=b
            Gbin(i+1,j+1)=0;
        else
            Gbin(i+1,j+1)=255;
        end
        c1=c1+1;c2=c2+1;
        suma1=0;
        suma2=0;
    end
    c1=1;c2=3;
    f1=f1+1;f2=f2+1;
end
end

