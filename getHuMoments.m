% This functions get the HU's moments
function hus = getHuMoments(MEI)
    hus = zeros(45,8);
for i = 1 : size(MEI,3)
    hu = hu_moments(MEI(:,:,i));
    hus(i,:) = hu;
end
end