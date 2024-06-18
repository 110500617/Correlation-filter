t=0:1/100:(1-1/100);
x=sin(2*pi*25*t);
h=sin(2*pi*10*t);


C_x=zeros(size(x,2),size(x,2));
C_x(:,1)=x.';
for i=1:size(x,2)-1
      C_x(:,i+1)=circshift(x,i).';     
end
figure;
plot(t,C_x*h.','g','LineWidth',2)
xlabel('Time(s)');
ylabel('Amplitude');
set(gca,'FontWeight','bold','fontweight','b');
hold on;
figure;
plot(t,real(ifft(fft(x).*fft(h))),'r','LineWidth',2)
xlabel('Time(s)');
ylabel('Amplitude');
set(gca,'FontWeight','bold','fontweight','b');
hold on
