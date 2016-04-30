function[image_sequence] = read_rgb_vid(filename)

    %% Read the stream
    % Get file ID for file
    fid=fopen(filename,'rb');
    % Check if file exists
    if (fid == -1)
        error('can not open input image file press CTRL-C to exit \n');
        pause;
    end
    % Get all the pixels from the image
    disp('Reading data.')
    pixel = fread(fid, inf, 'uchar');
    % Close file
    fclose(fid);
    disp('RGB Video data read done.');

    %% Parameters
    width = 480;
    height = 270;
    n_channels = 3;
    pixel_per_frame = width * height * n_channels;
    %Number of frames
    n_frames = numel(pixel) / pixel_per_frame;
    disp(['NumberOfFrames: ' num2str(n_frames)]);

    %% Reading Frames
    disp('Start Reading Frames.');
    image_sequence = zeros(height,width,n_channels,n_frames,'uint8');
    h = waitbar(0,'Reading Frames');
    for i=1:n_frames
        waitbar(i/n_frames);        
        %Crop the pixels from the pixel array for the current frame
        start_index = (i-1) * pixel_per_frame + 1;
        stop_index = start_index + pixel_per_frame - 1;
        frame_pixels = pixel(start_index:stop_index);
    
        %Red
        red = frame_pixels(1:end/3);
        red = reshape(red,width,height);
        red = uint8(red');
        %Green
        green = frame_pixels(end/3+1:end*(2/3));
        green = reshape(green,width,height);
        green = uint8(green');
        %Blue
        blue = frame_pixels(end*(2/3)+1:end);
        blue = reshape(blue,width,height);
        blue = uint8(blue');
    
        image_sequence(:,:,1,i) = red;
        image_sequence(:,:,2,i) = green;
        image_sequence(:,:,3,i) = blue;        
    end    
    close(h);            
end