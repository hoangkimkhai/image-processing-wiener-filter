% This functions display MEIs as image, to show in the report
function a = myDisplayAsImage(MEI)
figure();
n = 3;
if size(size(MEI),2) == 4
    n =4;
end
for k = 2 : 10
  if n == 4
    wave_frame = MEI(:,:,:,k);
  else
    wave_frame = MEI(:,:,k);
  end
  subplot(3,3,k-1);
  imshow(wave_frame);
  title(sprintf('Frame #%d', k));
end