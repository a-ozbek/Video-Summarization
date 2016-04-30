width = 480;
height = 270;
channels = 3;

pixel_per_frame = width * height * channels;

% Getting the first frame
pixel = pixel(1:pixel_per_frame);

%Red
red = pixel(1:end/3);
red = reshape(red,width,height);
red = uint8(red');
%Green
green = pixel(end/3+1:end*(2/3));
green = reshape(green,width,height);
green = uint8(green');
%Blue
blue = pixel(end*(2/3)+1:end);
blue = reshape(blue,width,height);
blue = uint8(blue');

rgb_im(:,:,1) = red;
rgb_im(:,:,2) = green;
rgb_im(:,:,3) = blue;


figure(); imshow(rgb_im);

