function[out] = is_valid_change(segment)

    if(segment(end/2) ~= 1)
        out = false;
        return;
    end
    
    
    %Remove 1
    segment(end/2) = [];
    
    if(numel(find(segment)) ~= 0)
        out = false;
        return;
    end
    
    out = true;
    
end