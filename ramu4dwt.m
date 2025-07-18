clc;
close all;
clear all;
X=imread('cat.jpg');



[c,s]=wavedec2(X,4,'haar');
[H1,V1,D1] = detcoef2('all',c,s,1);


subplot(2,2,2);
imshow(uint8(H1));
subplot(2,2,3);
imshow(uint8(V1));
subplot(2,2,4);
imshow(uint8(D1));
[H2,V2,D2] = detcoef2('all',c,s,2);


subplot(2,2,2);
imshow(uint8(H2));
subplot(2,2,3);
imshow(uint8(V2));
subplot(2,2,4);
imshow(uint8(D2));
[H3,V3,D3] = detcoef2('all',c,s,3);


subplot(2,2,2);
imshow(uint8(H3));
subplot(2,2,3);
imshow(uint8(V3));
subplot(2,2,4);
imshow(uint8(D3));
[H4,V4,D4] = detcoef2('all',c,s,4);


subplot(2,2,2);
imshow(uint8(H4));
subplot(2,2,3);
imshow(uint8(V4));
subplot(2,2,4);
imshow(uint8(D4));



figure;
X=imshow(X);




[M N]=size(H1);

Elf=0;
for i=1:M
for j=1:N
    Elf = Elf+H1(i,j);
end
end
disp(Elf)

Hlf1=0;
Hlf2=0;
Hlf3=0;

for i=1:M
for j=1:N
    Hlf1 = Hlf1+H1(i,j); %KASDHklasdh
    Hlf2 = Hlf2+V1(i,j);%aksdjfhalksdfa
    Hlf3 = Hlf3+D1(i,j);%sdfasfafa
end
end
% disp(Hlf1);

% disp(Hlf2)

% disp(Hlf3)

Hlf=Hlf1+Hlf2+Hlf3;

disp(Hlf)

Plf= (Elf/(Elf+Hlf));

disp(Plf);

s=sqrt(0.02*M*N)

disp(s);

 a =imread ('cat.jpg');
%Calculate superpixels of the image.
 
 [L,N] = superpixels(a,89);
 figure;
 BW = boundarymask(L);
 imshow(imoverlay(a,BW,'cyan'),'InitialMagnification',100);
  imtool(imoverlay(a,BW,'cyan'),'InitialMagnification',100);
    outputImage = cell(1,max(max(BW)));
    rgb_label=repmat(BW,[1 1 1]);
  for k=1:max(max(BW))
       color=a;
        color(rgb_label~=k)=0;
        outputImage{k}=color;end
    imshow( outputImage{1});
    title('objects in cluster 1');