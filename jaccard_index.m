function index = jaccard_index(matrix1, matrix2)
    intersection = sum(sum(matrix1 & matrix2));
    union = sum(sum(matrix1 | matrix2));
    index = intersection / union;
end