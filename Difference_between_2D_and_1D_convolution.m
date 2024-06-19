clc
clear all;  
I1=[1,4,7;2,5,8;3,6,9];
i1=I1(:);

I2=ones(3,3);
for i=1:3
   I2(i,i)=0.1;
end
i2=I2(:);
R1D=real(ifft((fft(i1)).*fft(i2)));
R1D=reshape(R1D,[3,3])
R2D=real(ifft2((fft2(I1)).*fft2(I2)))