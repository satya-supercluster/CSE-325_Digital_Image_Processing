img = imread('image.jpg');
imshow(img);
title('Original Image');

resized_img = imresize(img, 0.5);
imshow(resized_img);
title('Resized Image');

gray_img = rgb2gray(img);
imshow(gray_img);
title('Grayscale Image');

bw_img = imbinarize(gray_img);
imshow(bw_img);
title('Black & White Image');

line_row = 100;
profile = gray_img(line_row, :);
figure;
plot(profile);
title('Image Profile');
xlabel('Column Index');
ylabel('Intensity Value');

R = img(:, :, 1);
G = img(:, :, 2);
B = img(:, :, 3);
figure;
subplot(1, 3, 1); imshow(R); title('Red Plane');
subplot(1, 3, 2); imshow(G); title('Green Plane');
subplot(1, 3, 3); imshow(B); title('Blue Plane');

reconstructed_img = cat(3, R, G, B);
imshow(reconstructed_img);
title('Reconstructed Color Image');
