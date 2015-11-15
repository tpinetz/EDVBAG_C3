function main()
    A = imread('Assets/testimg1.png');
    B = imread('Assets/testimg2.png');
    [first, second, dist] = calculateDistance(A,B);
    dist
end