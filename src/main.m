function main()
marker = rgb2gray(imread('Assets/i1.jpg'));

inputImage = rgb2gray(imread('Assets/x1.jpg'));

f = 7000 / size(inputImage,1)

inputImage = imresize(inputImage,f);
sizeOfMarker = 388 * f;

originalImage = inputImage;
    
pixelInMM = distanceToMarker(inputImage,marker,sizeOfMarker)
    
    
inputImage1 = imread('Assets/x2.jpg');
inputImage2 = imread('Assets/x3.jpg');
[first, second, distInPx] = calculateDistance(inputImage1,inputImage2);
dist = distInPx * pixelInMM
distInPx

end