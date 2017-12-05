% load the image package
pkg load image;

function result = scale(img, scaling_factor)
  result = img .* scaling_factor;
endfunction

function result = apply_noise(img, sigma_noise)
  % randn generally outputs noise with std dev of 1
  % .* sigma_noise scales that std dev
  noise = randn(size(img)) .* sigma_noise;
  result = img + noise;
endfunction

% multiplying an image by a scalar will adjust the intensity of
% every single pixel in the image
test_img_1 = imread('img/forest.jpg') * 0.1;
test_img_2 = imread('img/ocean_1.jpg');
test_img_3 = imread('img/tesla_model_s.jpg');

% takes a really long time to plot the following
% test_img_3_red = test_img_3(:,:,1);
% test_img_3_green = test_img_3(:,:,2);
% test_img_3_blue = test_img_3(:,:,3);

% plot(test_img_3_red, test_img_3_green, test_img_3_blue);
% waitforbuttonpress;

imshow(test_img_1);
waitforbuttonpress;

% scale the intensity of the image, and then apply random noise
imshow(apply_noise(scale(test_img_2, 0.7), 66));
waitforbuttonpress;

% apply random noise to an image
sigma_3 = 50; % scaling factor for noise
noise_3 = randn(size(test_img_3)) .* sigma_3;
noisy_img = test_img_3 + noise_3;
imshow(noisy_img);
waitforbuttonpress;

% you can take the difference of two images
test_gray_1 = rgb2gray(test_img_2(1:100,1:100,:));
test_gray_2 = rgb2gray(imread('img/forest.jpg')(1:100,1:100,:));
imshow(test_gray_1 - test_gray_2);
waitforbuttonpress;

close all;