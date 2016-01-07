function main()

    markerString = 'Assets/i1.jpg';
    inputImageString = 'Assets/x1.jpg';

    image1String = 'Assets/x2.jpg';
    image2String = 'Assets/x3.jpg';

    [dist, speed] = radarFalle(markerString, inputImageString, image1String, image2String);

    fprintf('Distance is %f m.\n', dist);
    fprintf('Speed is %f m/s.\n', speed);

end