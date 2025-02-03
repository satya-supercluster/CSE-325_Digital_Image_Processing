img = imread('image.jpg');

%%A
[rows, cols, ~] = size(img);
num_points = 10;
p_indices = randi([1, rows], num_points, 2);
q_indices = randi([1, cols], num_points, 2);
euclidean_distances = sqrt(sum((p_indices - q_indices) .^ 2, 2));
manhattan_distances = sum(abs(p_indices - q_indices), 2);
% disp('Euclidean distances:');
% disp(euclidean_distances);
% disp('Manhattan distances:');
% disp(manhattan_distances);



%%B
img_gray = rgb2gray(img);
equal_intensity_indices = find(img_gray(p_indices(:, 1), p_indices(:, 2)) == img_gray(q_indices(:, 1), q_indices(:, 2)));
equal_intensity_distances = sqrt(sum((p_indices(equal_intensity_indices, :) - q_indices(equal_intensity_indices, :)) .^ 2, 2));
disp('Distances between points with equal intensity:');
disp(equal_intensity_distances);




%%C
unique_distances = unique(euclidean_distances);
num_pairs_same_distance = zeros(size(unique_distances));
for i = 1:length(unique_distances)
    num_pairs_same_distance(i) = sum(euclidean_distances == unique_distances(i));
end
disp('Number of pairs with each unique distance:');
disp([unique_distances num_pairs_same_distance]);


%%D
shortest_distance = min(euclidean_distances);
longest_distance = max(euclidean_distances);
num_shortest_distances = sum(euclidean_distances == shortest_distance);
num_longest_distances = sum(euclidean_distances == longest_distance);
disp('Number of shortest distances:');
disp(num_shortest_distances);
disp('Number of longest distances:');
disp(num_longest_distances);
