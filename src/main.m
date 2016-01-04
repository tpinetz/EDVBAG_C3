function main()
marker = rgb2gray(imread('Assets/Marker1.png'));
inputImage = rgb2gray(imread('Assets/CCLfail02.jpg'));
sizeOfMarker = 80;
pixelInMM = distanceToMarker(inputImage,marker,sizeOfMarker)

inputImage1 = imread('Assets/CCLfail01.jpg');
inputImage2 = imread('Assets/CCLfail02.jpg');
[first, second, distInPx] = calculateDistance(inputImage1,inputImage2);
dist = distInPx * pixelInMM

end