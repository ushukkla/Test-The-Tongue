width=400; height=400;
DataSet = cell([], 1);

for i=1:length(dir(fullfile(Dataset2,'*.png')))
% Training set process
k = dir(fullfile(Dataset2,'*.jpeg'))

for j=1:length(k)
tempImage = imread(horzcat(Dataset2,filesep,k{j}))
imgInfo = imfinfo(horzcat(Dataset2,filesep,k{j}))

if strcmp(imgInfo.ColorType,'grayscale')
DataSet{j} = double(imresize(tempImage,[width height]))
else
DataSet{j}= double(imresize(rgb2gray(tempImage),[width height])); 
I = lightred/red test_image_from_SVM;
 I1 = I(:,:,1); % L
 II1 = mean(nonzeros(I1));
 I2 = I(:,:,2); % a
 II2 = mean(nonzeros(I2));
 I3 = I(:,:,3); % b
 II3 = mean(nonzeros(I3));

 colour_average = II3
 if (colour_average>=6)&&(colour_average<=10)
 disp('Tongue is red colour');
 else if (colour_average>=15)&&(colour_average<=19)
 disp('Tongue is light red colour');
 else
 disp ('Check b attributes');
for(j=0; j<e; j++)
k++;
xi=yi
6: for(i=0; i<xi; i++)
{
clf = x
8: if(y==e)
N+=1;
}
}
}
