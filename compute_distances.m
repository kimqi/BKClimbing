function distances = compute_distances(matrix)
    % Find the row and column indices of each 1 in the matrix
    [row_indices, col_indices] = find(matrix);
    points = [row_indices, col_indices];

    % Compute pairwise distances using the Euclidean distance formula
    num_points = size(points, 1);
    distances = zeros(num_points);
    for i = 1:num_points
        for j = 1:num_points
            if i ~= j
                row_diff = points(i, 1) - points(j, 1);
                col_diff = points(i, 2) - points(j, 2);
                distances(i, j) = sqrt(row_diff^2 + col_diff^2);
            end
        end
    end
end