% Working with images

% Load the image package (downloaded from octave-forge)
pkg load image;

img = imread('img/tesla_model_s.jpg');
img_gray = rgb2gray(img);
imshow(img_gray);

% You can think of images as functions 
% An image can be a function I(x,y) of intensity in the XY plane
% For example, smoothing out an intensity function of an image is blurring

img2 = imread('img/forest.jpg');
% get only the red channel of the image
img2red = img2(:, :, 1);
figure, imshow(img2red);
% When doing integer division Octave will round the result to the nearest integer. 
% This is different from most programming languages, where the result is often 
% floored to the nearest integer. So, the result of int32 (5) ./ int32 (8) is 1.
img_size = size(img2red);
img_rows = img_size(1);
img_rows_half = img_rows / 2;
img_columns = img_size(2);
img_columns_half = img_columns / 2;
line([1, img_columns], [img_rows_half, img_rows_half], 'color', 'r');
line([img_columns_half, img_columns_half], [1, img_rows], 'color', 'b');
% plot the first row of an image
figure, plot(img2red(1,:));