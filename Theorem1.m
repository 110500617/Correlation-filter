clc
clear all
FN=zeros(100,100);
n=[0:100-1]; 
k=[0:100-1];
Wn=exp(-j*2*pi/100); 
nk=n'*k; 
FN=Wn.^nk; 


t=0:1/100:(1-1/100);
x=sin(2*pi*25*t);

figure;
plot(real((fft(x))),'g','LineWidth',2);
xlabel('Frequency Point');
ylabel('Amplitude');
set(gca,'FontWeight','bold','fontweight','b');
axis tight;
hold on

figure;
plot(imag((fft(x))),'-.g','LineWidth',2);
xlabel('Frequency Point');
ylabel('Amplitude');
set(gca,'FontWeight','bold','fontweight','b');
axis tight;
hold on



C_x=zeros(size(x,2),size(x,2));
C_x(:,1)=x.';
for i=1:size(x,2)-1
      C_x(:,i+1)=circshift(x,i).';     
end

DiagM=FN*C_x*inv(FN);
D=zeros(100,1);
for i=1:100
    D(i)=DiagM(i,i);
end
figure;
plot(real(D),'r','LineWidth',2);
xlabel('Frequency Point');
ylabel('Amplitude');
set(gca,'FontWeight','bold','fontweight','b');
axis tight;
hold on
figure;
plot(imag(D),'-.r','LineWidth',2);
xlabel('Frequency Point');
ylabel('Amplitude');
set(gca,'FontWeight','bold','fontweight','b');
axis tight;
hold on

