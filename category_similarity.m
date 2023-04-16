function sim = category_similarity(matrix1, matrix2, categories_matrix1, categories_matrix2, weights)
    total_weight = 0;
    matched_weight = 0;
    
    [rows, cols] = size(matrix1);
    for row = 1:rows
        for col = 1:cols
            if matrix1(row, col) == matrix2(row, col)
                category1 = categories_matrix1(row, col);
                category2 = categories_matrix2(row, col);
                
                weight = weights.(category1);
                total_weight = total_weight + weight;
                
                if category1 == category2
                    matched_weight = matched_weight + weight;
                end
            end
        end
    end
    
    sim = matched_weight / total_weight;
end

% Example matrices and categories
matrix1 = randi([0, 1], 18, 11);
matrix2 = randi([0, 1], 18, 11);
categories = {'A', 'B', 'C'};
categories_matrix1 = categories(randi([1, numel(categories)], 18, 11));
categories_matrix2 = categories(randi([1, numel(categories)], 18, 11));

% Example weights for categories
weights = struct('A', 0.4, 'B', 0.3, 'C', 0.3);

similarity = category_similarity(matrix1, matrix2, categories_matrix1, categories_matrix2, weights);
disp(similarity);