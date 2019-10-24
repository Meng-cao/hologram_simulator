close all
mkdir d350image
sizex = 512;
sizey = 512;
image = zeros(sizey,sizex);
%loop to get new pics

%{set square}
for n = 200 : +1 :204 %top left corner
 
%first row
image(n,n) = 1;
image(n,n+1) = 1;
image(n,n+2) = 1;
image(n,n+3) = 1;
image(n,n+4) = 1;

%second row
image(n+1,n) = 1;
image(n+1,n+1) = 1;
image(n+1,n+2) = 1;
image(n+1,n+3) = 1;
image(n+1,n+4) = 1;


%third row
image(n+2,n) = 1;
image(n+2,n+1) = 1;
image(n+2,n+2) = 1;
image(n+2,n+3) = 1;
image(n+2,n+4) = 1;

%fourth row
image(n+3,n) = 1;
image(n+3,n+1) = 1;
image(n+3,n+2) = 1;
image(n+3,n+3) = 1;
image(n+3,n+4) = 1;

%fifth row
image(n+4,n) = 1;
image(n+4,n+1) = 1;
image(n+4,n+2) = 1;
image(n+4,n+3) = 1;
image(n+4,n+4) = 1;


dx = 10e-3;
dy = 10e-3;
shiftx = 0;
shifty = 0;
wa = 532e-6;
d = 350;

i = sqrt(-1);

[Fx,Fy]= meshgrid(-sizey/2:sizey/2-1,-sizex/2:sizex/2-1);
reference = exp(i*2*pi*(Fx./20+Fy./20));
%reference = 1;
%imshow(atan2(real(reference),imag(reference)));show reference phase

 obj=nearpropCONV(image,sizex,sizey,dx,dy,shiftx,shifty,wa,d);
 %figure(),imshow(atan2(real(obj),imag(obj)));
 %obj =obj./max(max(abs(obj)));
 holo = (abs(obj+ reference)).^2;
 holo = holo./max((holo));
 
 %holo = imnoise(holo, 'gaussian');
 %figure(),imshow(holo,[]); % hologram
 %abs(holo).^2,[]
 
 OutputFileName = sprintf('./d350image/holo_%d.tif',n);
 imwrite((holo),OutputFileName);
  
 Fholo = fftshift(fft2(fftshift(holo)));
 %figure(),imshow(log(abs(Fholo)),[]); % holo after FFT
 %figure(),imshow(image,[]); % original object image
 OutputFileName = sprintf('./d350image/obj_%d.tif',n);
 imwrite((image),OutputFileName);
end
 %wsize1=30;
 %window1 = zeros(512);
 %window1(380-wsize1:380:wsize1,380-wsize1:380:wsize1)=1;
 %Fholo1 = Fholo.*window1;

