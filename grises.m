function [ gs1] = grises(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%para hacer las operaciones es necesario cambiarlo a doble

x=double(x);

%ESCALA DE GRISES
%Para saber el numero de matrices de la imagen
[fil,col,c]=size(x);
for i=1:fil
    for j=1:col
          if c==1
              
            gs1(i,j)=x(i,j);
            %gs2(i,j)=x(i,j);
            
             else     
     %primero rojo luego se le suma el verde despues el azul
     
            gs1(i,j)=(x(i,j,1)+ x(i,j,2)+x(i,j,3))/3;
            %gs2(i,j)=0.299*x(i,j,1)+ 0.589*x(i,j,2)+0.114*x(i,j,3);
          end
    end
end

%Ahora es necesario cambiarla a entero sin signo
x=uint8(x);
gs1=uint8(gs1);
%gs2=uint8(gs2);

end

