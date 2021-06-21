clear;close all;
walk = VideoReader('denis_walk.avi');
jump = VideoReader('denis_jump.avi');
side = VideoReader('denis_side.avi');
walk_frames = walk.read();
jump_frames = jump.read();
wave_frames = side.read();

w = 1;


MEI_walk = getMEI(walk_frames, w);
MEI_side = getMEI(wave_frames, w);
MEI_jump = getMEI(jump_frames, w);

myDisplay(MEI_walk);
myDisplay(MEI_side);
myDisplay(MEI_jump);

MEI_walk_dilated = getDilatedMEI(MEI_walk);
MEI_side_dilated = getDilatedMEI(MEI_side);
MEI_jump_dilated = getDilatedMEI(MEI_jump);

myDisplay(MEI_walk_dilated);
myDisplay(MEI_side_dilated);
myDisplay(MEI_jump_dilated);


MEI_walk_outlines= getMEIOutlines(MEI_walk_dilated);
MEI_side_outlines= getMEIOutlines(MEI_side_dilated);
MEI_jump_outlines= getMEIOutlines(MEI_jump_dilated);

myDisplay(MEI_walk_outlines);
myDisplay(MEI_side_outlines);
myDisplay(MEI_jump_outlines);

hu_walk = getHuMoments(MEI_walk_outlines);
hu_side = getHuMoments(MEI_side_outlines);
hu_jump = getHuMoments(MEI_jump_outlines);

D = abs(hu_side-hu_walk).^2;
MSE_pair_side_walk = sum(D(:))/numel(hu_side);

D = abs(hu_side-hu_jump).^2;
MSE_pair_side_jump = sum(D(:))/numel(hu_side);

D = abs(hu_jump-hu_walk).^2;
MSE_pair_jump_walk = sum(D(:))/numel(hu_side);

walk_noise = addNoise(walk_frames);
MEI_walk_noise = getMEI(walk_noise,w);
myDisplay(walk_noise);
myDisplay(MEI_walk_noise);

walk_de_noise = deNoise(walk_noise);
MEI_walk_de_noise = getMEI(walk_de_noise,w);
myDisplay(walk_de_noise);
myDisplay(MEI_walk_de_noise);


MEI_walk_de_noise_dilated = getDilatedMEI(MEI_walk_de_noise);
MEI_walk_de_noise_outlines= getMEIOutlines(MEI_walk_dilated);
myDisplay(MEI_walk_de_noise_dilated);
myDisplay(MEI_walk_de_noise_outlines);
huss = zeros(45,8);
for i = 1 : size(MEI_walk_de_noise_dilated,3)
    hu = hu_moments(MEI_walk_de_noise_outlines(:,:,i));
    huss(i,:) = hu;
end



  D = abs(hu_walk-huss).^2;
  MSE = sum(D(:))/numel(huss);