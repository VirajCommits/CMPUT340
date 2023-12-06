% Sample script  that shows how to automate running problem solutions
close all;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% a) Load an image using the imread command 

i = imread("peppers3.png");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% b) Display original image in the first spot of a 2 x 3 a grid layout
%    Check the imshow and subplot commands.
subplot(2,3,1)
imshow(i)
title('Original peppers Image');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% c) Display a gray scale version of the image in position 2 of the grid.
%    help rgb2gray
gray_image = rgb2gray(i);
% Create a 2 x 3 grid layout
subplot(2, 3, 2);

% Display the grayscale image in position 2
imshow(gray_image);

% Optional: Add a title
title('Greyscale peppers image');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% d) Generate a new figure and ask user to manually select a region of the
%    image. Display the subimage in position 3 of the grid.
%    Hint 1: getrect()
%    Hint 2: to use getrect, you should first install Image Processing Toolbox:
%         (a) Open the Add-On Manager in MATLAB via "Home > Add-Ons > Get Add-Ons" and install the Add-On Explorer if it is not already installed.
%         (b) Search "Image Processing Toolbox" and install it.
%         (c) Restart MATLAB after installing

image = imread("peppers3.png");

subplot(2,3,1)
imshow(image);

figure;

% Get user input on a newly dislayed image
imshow(image);
title("Select Region")
rect = getrect;

% close the user input figure
close

% Extract the selected region from the original image
x = round(rect(1));
y = round(rect(2));
width = round(rect(3));
height = round(rect(4));
selected_region = image(y:y+height,x:x+width,:);
% Make grid the current figure
subplot(2,3,3)

% Display selected region. Make sure to apply the cut
% over all 3 channels.
imshow(selected_region);
title("Selected region");

pause();

% You are NOT ALLOWED to use the imcrop function of Matlab.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% e) Create a function J = luminance_change(I, option, value) such that:
%   * When given the option 'c', the contrast of image I's top-left and 
%     bottom-right quadrants will be modified by the given value.
%     Simple multiplication will achieve this.
%   * When given the option 'b', the brightness of image I's top-right and 
%     bottom-left quadrants will be modified by the given value.
%     Simple addition will achieve this.
%  
%   Showcase your function by filling positions 4 and 5 in the grid

% Contrast change
contrast_image = luminance_change(image, 'c', 1.5); % Example: Increase contrast by 1.5
subplot(2, 3, 4);
imshow(contrast_image);
title('Reduced Contrast');
brightness_image = luminance_change(image, 'b', 50); % Example: Increase brightness by 50

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% f) BONUS: Display a version of the image after it's been blurred using a
%    Gaussian filter. Hint: imgaussfilt()
B = imgaussfilt(image, 5);
subplot(2,3,6);
imshow(B);
title("Gaussian Blur")


% Brightness change
subplot(2, 3, 5);
imshow(brightness_image);
title('Increased Brightness');

function J = luminance_change(I,option,value)
    [rows,col,~] = size(I);

    J = I;

    mid_row = floor(rows/2);
    mid_col = floor(col/2);

    if option == 'c'
        fprintf("Value:");
        disp(value);
        J(1:mid_row , 1:mid_col,:) = I(1:mid_row,1:mid_col , :) * value;
        J(mid_row+1:end,mid_col+1:end,:) = I(mid_row+1:end,mid_col+1:end,:) * value;
    elseif option == 'b'
        J(1:mid_row, mid_col+1:end, :) = I(1:mid_row, mid_col+1:end, :) + value;
        J(mid_row+1:end, 1:mid_col, :) = I(mid_row+1:end, 1:mid_col, :) + value;
    end
end







