function detect_image_conditions(img)
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    mean_img = mean(img(:));
    std_img = std(double(img(:)));
    if mean_img > 180
        disp('Image is Bright');
    elseif mean_img < 100
        disp('Image is Dark');
    else
        disp('Image has Normal Brightness');
    end
    if std_img > 50
        disp('Image is Noisy');
    else
        disp('Image is Not Noisy');
    end
end
img = imread('image.jpg');
detect_image_conditions(img);
