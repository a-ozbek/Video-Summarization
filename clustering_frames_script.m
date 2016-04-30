%Alireza_Day2_003, window_size = 6
frame_indices = 1:15:4500;
frames = v(:,:,:,frame_indices);

hist_m = zeros(numel(frame_indices),256*3);

for i=1:numel(frame_indices)
    hist_m(i,:) = get_color_hist(frames(:,:,:,i));    
end    
k = 10;
[idx,c] = kmeans(hist_m,k);

overview = medfilt1(medfilt1(idx,11),11);


window_size = 6;
diff_overview = (diff(overview) ~= 0);
n_scene_changes = 0;
scene_changes = [];
for i=1:numel(diff_overview)
    try
        if(diff_overview(i) == 1)
            %Change detected
            %Check if it is valid
            start_index = i-(window_size/2-1);
            stop_index = i+(window_size/2);
            segment = diff_overview(start_index:stop_index) ~= 0;
            if(is_valid_change(segment))
                n_scene_changes = n_scene_changes + 1;
                scene_changes = [scene_changes;[start_index,stop_index]];
            else
                continue;                
            end           
        end        
        
    catch
        continue;        
    end    
end


%crop the scenes from v
v_highlights = [];
for i=1:n_scene_changes
    
    start_frame = frame_indices(scene_changes(i,1));
    stop_frame = frame_indices(scene_changes(i,2));
    
    v_cropped = v(:,:,:,start_frame:stop_frame);
    v_highlights = cat(4,v_highlights,v_cropped);
    
end


