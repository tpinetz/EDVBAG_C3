function [ distanceToMarker ] = distanceToMarker( inputImage, marker, sizeOfMarker )
% Diese Funktion soll die Entfernung zum Marker und somit das cm/pixel
% Verhältnis ermitteln. Damit kann unter anderem auch die zurückgelegte
% Distanz zur Kamera berechnet werden!

% inputImage.. Bild mit Person & Marker
% marker.. Bild vom Marker
% sizeOfMarker.. Größe des Markers in cm (sollte quadratisch sein).

marker = rgb2gray(imread('Assets/Marker0.jpg'));
inputImage = rgb2gray(imread('Assets/testimg4.jpg'));

pointsOfMarker = detectSURFFeatures(marker);
pointsOfImage = detectSURFFeatures(inputImage);

[ features1, valid_points1] = extractFeatures(marker, pointsOfMarker);
[ features2, valid_points2] = extractFeatures(inputImage, pointsOfImage);

indexPairs = matchFeatures(features1, features2);

matchedPoints1 = valid_points1(indexPairs(:, 1), :);
matchedPoints2 = valid_points2(indexPairs(:, 2), :);

figure; showMatchedFeatures(marker, inputImage, matchedPoints1, matchedPoints2);


% distanceToMarker = 0;

end