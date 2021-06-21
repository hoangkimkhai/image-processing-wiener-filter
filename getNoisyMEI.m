% This functions add noises to each frame of the video
% Using salt and pepper noise
% Then it returns the noisy MEI of all the frames from the video
function MEI_noise = getNoisyMEI(video,w)
    MEI_noise = zeros(144,180, 1);
    frame_index = 1;
    MEI_noise(:,:,1) = rgb2gray(read(video,1));
    prev_frame = rgb2gray(read(video,1));
    
    % Get each frame
    for k = 2 : w : 45  
        this_frame = read(video, k);
        % Apply noise to colorful image
        this_frame = imnoise(this_frame,'salt & pepper',0.02);
        this_frame = rgb2gray(this_frame);
        
        % Detect MEI from the frames
        MEI_noise(:,:,frame_index) = abs(this_frame - prev_frame) > 10;
        frame_index = frame_index + 1;
        prev_frame = this_frame;
    end
end