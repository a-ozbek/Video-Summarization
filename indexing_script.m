fps = 15;
v = v1;
%Query image
im_query = imread('11475.png');

%Sample frames (2 frames for each second)
n_frames_to_sample = 300;
frame_indices = round(linspace(1,4500,n_frames_to_sample));
frames = v(:,:,:,frame_indices);

%Extract features
n_frames = size(frames,4);
disp(['n_frames: ' num2str(n_frames)]);
pre = @(x) single(rgb2gray(x));
%Query image
[~, d_query] = vl_sift(pre(im_query));
%Frames
n_matches = zeros(n_frames,1);
h = waitbar(0,'Searching Frames');
for i=1:n_frames   
    [~,d_frames] = vl_sift(pre(frames(:,:,:,i)));
    [~, scores] = vl_ubcmatch(d_frames, d_query);
    n_matches(i,1) = size(scores,2);
    waitbar(i/n_frames);
end
close(h);

[~,max_match_frame_i] = max(n_matches);

%Get the 3 second before and after the match image from the video
start_frame_index = (4500/n_frames)*(max_match_frame_i) - 3*fps;
stop_frame_index = (4500/n_frames)*(max_match_frame_i) + 3*fps;

v_index = v(:,:,:,start_frame_index:stop_frame_index);

    