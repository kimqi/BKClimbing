function distance = hamming_distance(matrix1, matrix2)
    distance = sum(sum(matrix1 ~= matrix2));
end