% This functions applied morphological boundary extraction method
% First, it find the eroded part
% Then subtract the eroded part from the image
function MEI_outlines = getMEIOutlines(MEI)
s=strel('disk',2,0);
MEI_outlines = zeros(size(MEI));
for k = 1 : size(MEI,3)
  this_frame = MEI(:,:,k);
  % FInd the erosion
  erode = imerode(this_frame,s);
  % Subtract the erosion
  bound = this_frame - erode;
  MEI_outlines(:,:,k) = bound;
end
end