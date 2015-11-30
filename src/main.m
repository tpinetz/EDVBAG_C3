function main()
marker = rgb2gray(imread('Assets/Marker0.jpg'));
inputImage = rgb2gray(imread('Assets/testImg4.JPG'));
sizeOfMarker = 80;
pixelInMM = distanceToMarker(inputImage,marker,sizeOfMarker)


%[first, second, dist] = calculateDistance(inputImage1,inputImage2);
%dist

end