%I am using edge detection with gausian to clean up the noise and get the clear image, so that it's parts are easi;y observable for further expermient.
G = fspecial('gaussian',[5 5], 2.5);
Tongue1f = imfilter(Tongue1,G,'same');
Edge1f=edge(Note1f,'sobel');
sub_Tonguef = imcrop(Edge1f,rect_Tongue1);
figure(5), imshow(sub_Tonguef);
close All;
clear All;
Tongue1 = imread('tongue1.jpg');
Tongue2 = imread('tongue5.jpg');
figure(1), imshow(Tongue1);
figure(2), imshow(Tongue2);
up=100;                                                                    
low=70;                                                                  
set(0,'RecursionLimit',10000);                                             
for i=1:m
    for j=1:n
      if new_edge(i,j)>up &&new_edge(i,j)~=255                           
            new_edge(i,j)=255;
            new_edge=connect(new_edge,i,j,low);
      end
    end
end
figure,imshow(new_edge==255);
Tongue1=rgb2gray(Tongue1);
Tongue2=rgb2gray(Tongue2);
Edge1=edge(Tongue1,'sobel');
Edge2=edge(Tongue2,'sobel');
figure(5), imshow(Edge1),title('Edge sobel1');
figure(6), imshow(Edge2),title('Edge sobel2');

rect_Tongue1 = [20 425 150 70];
rect_Tongue2 = [20 425 150 70];
sub_Tongue1 = imcrop(Edge1,rect_Tongue1);
sub_Tongue2 = imcrop(Edge2,rect_Tongue2);
figure(7), imshow(sub_Tongue1);
figure(8), imshow(sub_Tongue2);
