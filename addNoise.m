% This function adds noise to the image
function MEI_noise = addNoise(frames)
    MEI_noise = uint8(zeros(size(frames)));
    for k = 1 : size(frames,4)
        this_frame = frames(:, :, :, k);
        this_frame = uint8(imnoise(this_frame, 'salt & pepper', 0.02));
        MEI_noise(:, :, :, k) = this_frame;
    end
end