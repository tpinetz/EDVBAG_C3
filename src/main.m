function main()
marker = rgb2gray(imread('Assets/Marker0.jpg'));
inputImage = rgb2gray(imread('Assets/testImg4.JPG'));
distanceToMarker(inputImage,marker);

%A = imread('Assets/testimg1.png');
%B = imread('Assets/testimg2.png');
%[first, second, dist] = calculateDistance(A,B);
%dist

end