% This function displays MEIs as a video, for better visuallization
function a = myDisplay(MEI)
figure();
n = 3;
if size(size(MEI),2) == 4
    n =4;
end
    
for k = 1 : size(MEI,n)
  if n == 4
    wave_frame = MEI(:,:,:,k);
  else
    wave_frame = MEI(:,:,k);
  end
  subplot(10,7,k);
  imshow(wave_frame);
  title(sprintf('Frame #%d', k));
  truesize([300,200]);
end
end