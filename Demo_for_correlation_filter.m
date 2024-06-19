clc
lambda=0.001;
for i=1:32*32
X1 = linspace(-10,10,32);
X2 = linspace(-10,10,32);
[X,Y] = meshgrid(X1,X2);
M=imread('lena.png');%lena.png
M=M(1:4:end,1:4:end);
M=double(M);
I = zeros(32,32);
I(1:32,1:32)=M(512/4/2-16:512/4/2+15,512/4/2-16:512/4/2+15);
subplot(1,5,1);
imagesc(I);   %ÑµÁ·ÐÅºÅ
title('Traning sample');

G = exp(-((X-0).*(X-0)+(Y-0).*(Y-0))/20);
window = exp(-((X-0).*(X-0)+(Y-0).*(Y-0))/30);
I=I.*window;
subplot(1,5,2);
imagesc(G);
title('Desired response');

I2 = circshift(I(:),i);
I2=reshape(I2,[32,32]);
subplot(1,5,3);
imagesc(I2);
title('Test sample');

F1=(ifft2(fft2(G)./(fft2(I)+1E-40)));     %¶þÎ¬ÂË²¨
% F2=(ifft(fft(G(:))./(fft(I(:))+1E-40)));  %Ò»Î¬ÂË²¨

% R1=real(ifft2(fft2(I2).*fft2(F1)));       
% R2=real(reshape(ifft(fft(I2(:)).*fft(F2(:))),[32,32]));
x=I(:);
C_xt=zeros(size(x,1),size(x,1));
C_xt(1,:)=x.';
for i=1:size(x,1)-1
      C_xt(i+1,:)=circshift(x,i).';     
end

z=I2(:);
C_zt=zeros(size(z,1),size(z,1));
C_zt(1,:)=z.';
for i=1:size(z,1)-1
      C_zt(i+1,:)=circshift(z,i).';     
end
y_v=G(:)
h=inv(C_xt.'*C_xt+lambda)*C_xt.'*y_v(:);
C_ht=zeros(size(h,1),size(h,1));
C_ht(1,:)=h.';
for i=1:size(h,1)-1
      C_ht(i+1,:)=circshift(h,i).';     
end

R2=reshape(C_zt*h,[32,32]);
R1=reshape(C_ht*z,[32,32]);
% for i=2:32
%     Temp1=R2(i,:);
%     Temp1(1)=[];
%     R2(i,2:end)=fliplr(Temp1);  
%     for j=2:32
%         Temp2=R2(:,j);
%         Temp2(1)=[];
%         R2(2:end,j)=flipud(Temp2);    
%     end
% end
subplot(1,5,4);
imagesc(R1);
title('2D filter result via fft2');
subplot(1,5,5);
imagesc(R2);
title('Spatial 1D filter result');
drawnow
end