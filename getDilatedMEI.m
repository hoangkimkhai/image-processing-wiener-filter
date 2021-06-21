% This function applied morphological dilation to the image
function MEI_dilated = getDilatedMEI(MEI)
    se = strel('square',5);
    MEI_dilated = zeros(size(MEI));
    
    % Get each frame
    for k = 1 : size(MEI,3)
        walk_frame = MEI(:,:,k);
    
        % Apply dilation
        dilate = imdilate(walk_frame,se);
        MEI_dilated(:, :, k ) = dilate;
    end
end