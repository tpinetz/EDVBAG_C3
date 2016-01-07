function main()

markerString = 'Assets/i1.jpg';
inputImageString = 'Assets/x1.jpg';

image1String = 'Assets/x2.jpg';
image2String = 'Assets/x3.jpg';

marker = rgb2gray(imread('Assets/i1.jpg'));

inputImage = rgb2gray(imread('Assets/x1.jpg'));

f = 7000 / size(inputImage,1); % We need larger images for SURF to run decently

inputImage = imresize(inputImage,f);
sizeOfMarker = 388 * f;

originalImage = inputImage;
    
pixelInMM = distanceToMarker(inputImage,marker,sizeOfMarker);
    
    
inputImage1 = imread('Assets/x2.jpg');
inputImage2 = imread('Assets/x3.jpg');
[first, second, distInPx] = calculateDistance(inputImage1,inputImage2);
dist = (distInPx * pixelInMM) / 1000;

deltaTime = max(abs(extractTime(image1String) - extractTime(image2String)), 0.5);

speed = dist / deltaTime;

fprintf('Distance is %f m.\n', dist);
fprintf('Speed is %f m/s.\n', speed);

end