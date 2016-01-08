function [dist, speed] = radarFalle(markerString, markerSize, strelType, inputImageString, image1String ,image2String)
% Diese Funktion ist unsere Abgabe. Als Input wird der Marker die Distanz
% und zwei Bilder erwartet. Daraus wird dann die Geschwindigkeit und die
% Distanz berechnet. 

% markerString.. Ort des Bildes vom Marker.
% markerSize.. reelle Größe des Markers in mm.
% inputImageString.. Ort des Bildes mit Marker zur Berechnung der Distanz.
% image1String.. Ort des ersten Bildes der Geschwindigkeitsmessung.
% sizeOfMarker.. Ort des zweiten Bildes der Geschwindigkeitsmesssung.

    marker = rgb2gray(imread(markerString));

    inputImage = rgb2gray(imread(inputImageString));

    f = 7000 / size(inputImage,1); % We need larger images for SURF / RANSAC to run decently

    inputImage = imresize(inputImage,f);
    sizeOfMarker = markerSize * f;

    originalImage = inputImage;

    pixelInMM = distanceToMarker(inputImage,marker,sizeOfMarker);

    inputImage1 = imread(image1String);
    inputImage2 = imread(image2String);
    [first, second, distInPx] = calculateDistance(inputImage1,inputImage2,strelType);
    dist = (distInPx * pixelInMM) / 1000;

    deltaTime = max(abs(extractTime(image1String) - extractTime(image2String)), 0.5);

    speed = dist / deltaTime;