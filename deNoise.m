% This function denoises the noisy RGB image
% It applies Median Filter to each color channel of the RGB
% Then concats the filtered channel back to a denoised RGB image
function MEI_de_noise = deNoise(frames)
    MEI_de_noise = uint8(zeros(size(frames)));
    for k = 1 : size(frames,4)  %fill in the appropriate number
        this_frame = frames(:, :, :, k);
        redChannel = this_frame(:, :, 1);
        greenChannel = this_frame(:, :, 2);
        blueChannel = this_frame(:, :, 3);

        % Median Filter the channels:
        redMF = medfilt2(redChannel, [3 3]);
        greenMF = medfilt2(greenChannel, [3 3]);
        blueMF = medfilt2(blueChannel, [3 3]);
        % Find the noise in the red.
        noiseImage = (redChannel == 0 | redChannel == 255);
        noiseFreeRed = redChannel;
        noiseFreeRed(noiseImage) = redMF(noiseImage);
        noiseImage = (greenChannel == 0 | greenChannel == 255);
        noiseFreeGreen = greenChannel;
        noiseFreeGreen(noiseImage) = greenMF(noiseImage);
        noiseImage = (blueChannel == 0 | blueChannel == 255);
        noiseFreeBlue = blueChannel;
        noiseFreeBlue(noiseImage) = blueMF(noiseImage);
        rgbFixed = cat(3, noiseFreeRed, noiseFreeGreen, noiseFreeBlue);
       
        MEI_de_noise(:, :, :, k) = uint8(rgbFixed);
    end
end