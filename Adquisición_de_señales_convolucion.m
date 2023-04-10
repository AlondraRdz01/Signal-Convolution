clear all
close all
clc

%Ingresar valores
xn=input('Ingresar señal en forma de vector X(n), ejemplo[1 2 3]: \n');
n6=input('Ingresar indice de X(n), usar cualquier valor > 0 : \n');
n= xn(n6);

hn=input('Ingresar señal en forma de vector H(n), ejemplo[1 2 3]: \n');
n9=input('Ingresar indice de H(n), usar cualquier valor > 0 : \n');
n7= hn(n9);

xn
hn

nxn=length(xn);
nhn=length(hn);

%Calculo para energia
Exn=sum((xn).^2);
Ehn=sum((hn).^2);
fprintf('El valor de la energia del vector X(n) es: \n')
Exn
fprintf('El valor de la energia del vector H(n) es: \n')
Ehn

%Calculo para potencia
Pxn=Exn/nxn;
Phn=Ehn/nhn;
fprintf('El valor de la potencia del vector X(n) es: \n')
Pxn
fprintf('El valor de la potencia del vector H(n) es: \n')
Phn

%Calculo del filtro de valor medio para X(n)
t1=nxn+1;
v=1;
v0=0;
s=v+1;
t2=1-1;

%Para X(n)(x+1)
n1=n+1;
n2=n-1;
xn1=xn(n1:nxn);
xnn=xn(1:n);
xnn1=xn(n1:nxn);

for i=n1:t1
    i=0;
    vrtxnm=[xnn,xn1,i,i];
      
end

%Para X(n)
for i1=xn
    i1=0;
    vrtxn=[i1,xn,i1];

    
end

%Para X(n)(x-1)
for i2=n2:t1
    i2=0;
    vrtnm=[i2,i2,xnn,xnn1];
    
end

%Vector restultante con filtro medio
fprintf('X(n) filtrado: \n')
vrt_filtro_medio=(vrtnm+vrtxn+vrtxnm)*1/3


%Calculo del filtro de valor medio para H(n)
th1=nhn+1;
vh=1;
vh0=0;
sh=vh+1;
th2=1-1;

%Para H(n)(x+1)
nh1=n7+1;
nh2=n7-1;
hn1=hn(nh1:nhn);
hnn=hn(1:n7);
hnn1=hn(nh1:nhn);


for i5=nh1:th1
    i5=0;
    vrthnm=[hnn,hn1,i5,i5];
        
end

%Para H(n)
for i6=hn
    i6=0;
    vrthn=[i6,hn,i6];
    
end

%Para H(n)(x-1)
for i7=nh2:th1
    i7=0;
    vrthnn=[i7,i7,hnn,hnn1];
    
end

%Vector restultante con filtro medio
fprintf('H(n) filtrado: \n')
vrt_filtro_medio_hn=(vrthnm+vrthn+vrthnn)*1/3

%Convolucion
NA = length(vrt_filtro_medio_hn);
NB = length(vrt_filtro_medio); 
NC = NA + NB -1;
vrt_filtro_medio_hn(NA+1:NC) = 0; 
vrt_filtro_medio(NB+1:NC) = 0; 

for i=1:NC
    C(i) = 0;
    for j = 1:i
        C(i) = C(i) + (vrt_filtro_medio_hn((i-j)+1)*vrt_filtro_medio(j));
    end
end

%Resultado de la convolucion
fprintf('Vector resultante de la convolucion: \n')
C

 %Graficas  
 subplot(3,2,1),stem(xn),title ('X(n)'),xlabel('n'),ylabel('X(n)')
 subplot(3,2,2),stem(hn),title ('H(n)'),xlabel('n'),ylabel('H(n)')
 subplot(3,2,3),stem(vrt_filtro_medio), title ('X(n)filtrada'),xlabel('n'),ylabel('X(n)')
 subplot(3,2,4),stem(vrt_filtro_medio_hn), title ('H(n)filtrada'),xlabel('n'),ylabel('H(n)')
 subplot(3,2,5),stem(C), title ('Convolucion'),xlabel('n'),ylabel('C(n)')

