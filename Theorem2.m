clc
clear all
FN=zeros(100,100);
n=[0:100-1]; 
k=[0:100-1];
Wn=exp(-j*2*pi/100); 
nk=n'*k; 
FN=Wn.^nk; 
Fn=FN/sqrt(100);

t=0:1/100:(1-1/100);
x=sin(2*pi*25*t);

C_xt=zeros(size(x,2),size(x,2));
C_xt(1,:)=x;
for i=1:size(x,2)-1
      C_xt(i+1,:)=circshift(x,i);     
end
figure
imagesc(C_xt);
hold on;
figure
imagesc(real(Fn*diag(fft(x))*inv(Fn)));
hold on;

