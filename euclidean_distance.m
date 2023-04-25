function distance = euclidean_distance(matrix1, matrix2)
    distance = sqrt(sum(sum((matrix1 - matrix2).^2)));
end