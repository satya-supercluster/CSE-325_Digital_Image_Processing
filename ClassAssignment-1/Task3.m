img = imread('image.jpg');
img = rgb2gray(img);
hist_img = imhist(img);
num_bits_without_change = sum(hist_img > 0);
message = uint8('SatyamWasHere');
message_bits = reshape(dec2bin(message, 8).' - '0', 1, []);
num_pixels = numel(img);
if length(message_bits) > num_pixels
    error('Message too long to hide in the image.');
end
img_lsb = img;
img_lsb(1:length(message_bits)) = bitset(img(1:length(message_bits)), 1, message_bits);
subplot(1, 2, 1), imshow(img), title('Original Image');
subplot(1, 2, 2), imshow(img_lsb), title('Image with Hidden Message');
num_bits_used = length(message_bits);
disp(['Number of bits used to hide message: ', num2str(num_bits_used)]);