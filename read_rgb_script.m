clc; clear;

%orig_im = imread('6472.png');
filename = 'Yin_Snack.rgb';
% Get file ID for file
fid=fopen(filename,'rb');
% Check if file exists
if (fid == -1)
    error('can not open input image file press CTRL-C to exit \n');
    pause
end
% Get all the pixels from the image
pixel = fread(fid, inf, 'uchar');
% Close file
fclose(fid);

% %Red
% red = pixel(1:end/3);
% red = reshape(red,1280,960);
% red = uint8(red');
% %Green
% green = pixel(end/3+1:end*(2/3));
% green = reshape(green,1280,960);
% green = uint8(green');
% %Blue
% blue = pixel(end*(2/3)+1:end);
% blue = reshape(blue,1280,960);
% blue = uint8(blue');
% 
% rgb_im(:,:,1) = red;
% rgb_im(:,:,2) = green;
% rgb_im(:,:,3) = blue;
% 
% figure(); imshow(rgb_im);

