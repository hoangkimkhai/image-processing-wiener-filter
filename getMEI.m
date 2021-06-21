% @Param: frames of the video
%         w: frame step size
% @Return: MEI
function MEI= getMEI(frames, w)
    % Initialize the MEI
    MEI = zeros(144,180, 1);
    frame_index = 2;
    
    % Initialize the first frame
    MEI(:,:,1) = rgb2gray(frames(:,:,:,1));
    prev_frame =  rgb2gray(frames(:,:,:,1));
    for k = 2 : w : 45
        % Extract the next frame
        this_frame = rgb2gray(frames(:,:,:,k));
        
        % If the difference between the current and the last frame exceeds
        % a threshold, then there is motion
        
        % Here the threshold is 0, because for some videos, the background
        % is mostly static, with really small changes (due to
        % lightning...), therefore, to clearly distingush the backgroud and
        % the object, the threshold should be a little high 
        MEI(:,:,frame_index) = abs(this_frame - prev_frame) > 10;
        
        % Increase the index
        frame_index = frame_index + 1;
        
        % The current frame will be the previous frame for the next frame
        prev_frame = this_frame;
    end
end