function main()
marker = rgb2gray(imread('Assets/Marker0.jpg'));
inputImage = rgb2gray(imread('Assets/testimg4.jpg'));
sizeOfMarker = 80;
pixelInMM = distanceToMarker(inputImage,marker,sizeOfMarker)

inputImage1 = imread('Assets/testimg1.png');
inputImage2 = imread('Assets/testimg2.png');
[first, second, distInPx] = calculateDistance(inputImage1,inputImage2);
dist = distInPx * pixelInMM

end