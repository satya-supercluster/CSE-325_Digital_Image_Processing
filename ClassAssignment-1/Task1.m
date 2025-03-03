img = imread('image.jpg');
img = rgb2gray(img);
mean_img = mean(img(:));
std_img = std(double(img(:)));
iqr_img = iqr(double(img(:)));
lower_bound = mean_img - (0.5 * iqr_img);
upper_bound = mean_img + (0.5 * iqr_img);
disp(['Lower Bound: ', num2str(lower_bound)]);
disp(['Upper Bound: ', num2str(upper_bound)]);
img_contrast = imadjust(img, [lower_bound / 255, upper_bound / 255], [0, 1]);
subplot(1, 2, 1), imshow(img), title('Input Image');
subplot(1, 2, 2), imshow(img_contrast), title('Enhanced Image');