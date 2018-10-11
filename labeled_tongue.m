dirstruct = dir('Training_set/*.png');
data = [];
for i = 1:length(dirstruct),
   
    im = imread(strcat('Training_set/',dirstruct(i).name));
    dirstruct(i).name
%     imshow(im);
    select = 1;
    while(select)
        disp 'please label the tongue with different properties'
        BW = roipoly(im);
        d = input('please input the tongue color:');
         
        c = input('if continue label this image, please input 0, otherwise, input 1:');
        select = select +1;
        if(c ~= 0)
            select = 0;
        end
        
%         data = [data;dirstruct(i).name, d,BW, select];
        s = struct('name', dirstruct(i).name, 'color', col, 'shape', sh, 'num', select);
        data = [data; s];
    end

end
save('labeled_tongue.mat', 'data');
