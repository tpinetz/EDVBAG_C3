function [ pixelInMM ] = distanceToMarker(inputImage, marker, sizeOfMarker)
% Diese Funktion soll die Entfernung zum Marker und somit das mm/pixel
% Verhältnis ermitteln. Damit kann unter anderem auch die zurückgelegte
% Distanz zur Kamera berechnet werden!

% inputImage.. Bild mit Person & Marker
% marker.. Bild vom Marker
% sizeOfMarker.. Größe des Markers in mm (sollte quadratisch sein).

%inputImage = im2bw(inputImage,0.9);

pointsOfMarker = detectSURFFeatures(marker);
pointsOfImage = detectSURFFeatures(inputImage);

[ features1, valid_points1] = extractFeatures(marker, pointsOfMarker);
[ features2, valid_points2] = extractFeatures(inputImage, pointsOfImage);

indexPairs = matchFeatures(features1, features2);

matchedPoints1 = valid_points1(indexPairs(:, 1), :);
matchedPoints2 = valid_points2(indexPairs(:, 2), :);

figure;
showMatchedFeatures(marker, inputImage, matchedPoints1, ...
    matchedPoints2, 'montage');
title('Putatively Matched Points (Including Outliers)');

[tform, inlierBoxPoints, inlierScenePoints, status] = estimateGeometricTransform(matchedPoints1, matchedPoints2, 'affine');

boxPolygon = [1, 1; size(marker, 2), 1;...  % top
        size(marker, 2), size(marker, 1); 1, size(marker, 1);...   % bottom
        1, 1]; % back to first Point
    
newBoxPolygon = transformPointsForward(tform, boxPolygon);
%length[newBoxPolygon(1,1),newBoxPolygon(1,2);newBoxPolygon(2,1),newBoxPolygon(2,2)]

figure;
imshow(inputImage);
hold on;
X = newBoxPolygon(:, 1);
Y = newBoxPolygon(:, 2);
line(X, Y, 'Color', 'r');
xLength = max(X) - min(X);
yLength = max(Y) - min(Y);
c = (sqrt((xLength^2)+(yLength^2)));

title('Detected Box');
%pixelInMM = c/sizeOfMarker;
pixelInMM = sizeOfMarker/c;

end