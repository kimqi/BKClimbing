function similarity = cosine_similarity(matrix1, matrix2)
    dot_product = sum(sum(matrix1 .* matrix2));
    norm1 = sqrt(sum(sum(matrix1.^2)));
    norm2 = sqrt(sum(sum(matrix2.^2)));
    similarity = dot_product / (norm1 * norm2);
end