function [vector] = get_color_hist(im)

    red_hist = imhist(im(:,:,1))';
    green_hist = imhist(im(:,:,2))';
    blue_hist = imhist(im(:,:,3))';
    
    vector = [red_hist,green_hist,blue_hist];
    
end