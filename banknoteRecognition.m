function [ currency_name ] = banknoteRecognition( im )
% This function is used to take the input image for testing  
% The input image is preprocessed and its features are extracted
% The features are compared with the sample images in the database and the output is given 
clc;
if (exist('currency_db.mat')==2)
    
%resize image
im=imresize(im,[128 128]);
%remove noise;
%seperate channels
 r_channel=im(:,:,1);
 b_channel=im(:,:,2);
 g_channel=im(:,:,3);
 %denoise each channel
 r_channel=medfilt2(r_channel);
 g_channel=medfilt2(g_channel);
 b_channel=medfilt2(b_channel);
 %restore channels
 rgbim(:,:,1)=r_channel;
 rgbim(:,:,2)=g_channel;
 rgbim(:,:,3)=b_channel;
 %featureextraction
fet=getFeature(rgbim);

    load('currency_db.mat','-mat');
    msgbox('Searching in Database','Database result','help');
    k=length(currency);
    for j=1:k
        D(j)=dist(fet',currency{j,1});
    end
    [value,index]=min(D);
    if value<0.001
        currency_name=currency(index,2);
        
    else
        currency_name = 'No matches found';
    end
else
    msgbox('Database is empty.','Database result','help');
    currency_name = 'No database';
end
end

