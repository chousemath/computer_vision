% Working with images

% Load the image package (downloaded from octave-forge)
pkg load image;

img = imread('img/tesla_model_s.jpg');
img_gray = rgb2gray(img);
imshow(img_gray);
waitforbuttonpress;
% get the size of this image
disp(size(img_gray));
% get the value at row 50, column 100
disp(img_gray(50, 100));
% get the values at row 100, columns 1 -> 100
disp(img_gray(100, 1:10));
% practice exercise
disp(img_gray(101:103, 201:203));

% You can think of images as functions 
% An image can be a function I(x,y) of intensity in the XY plane
% For example, smoothing out an intensity function of an image is blurring

img2 = imread('img/forest.jpg');
% get only the red channel of the image
img2red = img2(:, :, 1);
imshow(img2red);
waitforbuttonpress;
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
plot(img2red(1,:));
waitforbuttonpress;
% load an image and crop it
img_bicycle = imread('img/bicycle.jpg');
imshow(img_bicycle);
waitforbuttonpress;
img_bicycle_size = size(img_bicycle);
img_bicycle_rows = img_bicycle_size(1);
img_bicycle_columns = img_bicycle_size(2);
% image is converted to b/w automatically
imshow(img_bicycle(:, 1:img_bicycle_columns/2));
waitforbuttonpress;

% define a function for scaling
function result = scale(img, value)
    result = value .* img;
endfunction

% load two images
ocean1 = imread('img/ocean_1.jpg');
ocean2 = imread('img/ocean_2.jpg');

ocean3 = scale(ocean1, 0.5) + scale(ocean2, 0.5);
imshow(ocean3);
waitforbuttonpress;