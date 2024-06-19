clc
i=45;
X1 = linspace(-10,10,100);
X2 = linspace(-10,10,100);
[X,Y] = meshgrid(X1,X2);
I=imread('lena.png');%girl.png
I=I(1:2:end,1:2:end,:);


PaddingI=zeros(100,100,3);
PaddingI(50-15:50+15,50-15:50+15,:)=I(128-15:128+15,128-15:128+15,:);
% figure;
% imshow(uint8(PaddingI),[]);
% hold on;

X=double(PaddingI(:,:,1));

% subplot(2,3,1);
figure;
imagesc((X));   %ÑµÁ·ÐÅºÅ
set(gca,'xtick',[]);
set(gca,'ytick',[]);
% set(gca,'FontWeight','bold','fontweight','b');
% title('Traning sample');


N=100;
X1=[1:1:(N)];
X2=[1:1:(N)];
[X1grid,X2grid]=meshgrid(X1,X2);
G=exp(-((X1grid-(N)/2).*(X1grid-(N)/2)+(X2grid-(N)/2).*(X2grid-(N)/2))/5);

% subplot(2,3,2);
figure;
imagesc(G);
set(gca,'xtick',[]);
set(gca,'ytick',[]);
% set(gca,'FontWeight','bold','fontweight','b');
% title('Desired response');

I2 = circshift(X(:),i);
I2=reshape(I2,[100,100]);
% subplot(2,3,3);
figure;
imagesc(I2);
set(gca,'xtick',[]);
set(gca,'ytick',[]);
% set(gca,'FontWeight','bold','fontweight','b');
% title('Test sample');


F1=(ifft2(fft2(G)./(fft2(X)+1E-40)));     %¶þÎ¬ÂË²¨
F2=(ifft(fft(G(:))./(fft(X(:))+1E-40)));  %Ò»Î¬ÂË²¨

R1=real(ifft2(fft2(I2).*fft2(F1)));       
R2=real(reshape(ifft(fft(I2(:)).*fft(F2(:))),[100,100]));

% subplot(2,3,4);
figure;
imagesc(R1);
set(gca,'xtick',[]);
set(gca,'ytick',[]);
% set(gca,'FontWeight','bold','fontweight','b');
% title('2D response');

% subplot(2,3,5);
figure;
imagesc(R2);
set(gca,'xtick',[]);
set(gca,'ytick',[]);
% set(gca,'FontWeight','bold','fontweight','b');
% title('1D response');

% subplot(2,3,6);
figure;
imagesc(abs(R2-R1));
set(gca,'xtick',[]);
set(gca,'ytick',[]);
% set(gca,'FontWeight','bold','fontweight','b');
% title('Error of 2D and 1D responses');

drawnow
% end
