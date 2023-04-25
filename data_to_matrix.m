function matrix = data_to_matrix(start, holds, finish)
    matrix = zeros(18, 11); % Initialize an 18x11 matrix of zeros (18 rows, 11 columns)

    % Helper function to set a point in the matrix to 1
    function set_point(point_str)
        row = 18 - str2double(point_str(2:end)) + 1;
        col = letter_to_number(point_str(1));
        matrix(row, col) = 1;
    end


    % Process Start, Holds, and Finish
    start_points = split(start, ', ');
    holds_points = split(holds, ', ');
    finish_points = split(finish, ', ');

    cellfun(@(point) set_point(point), start_points);
    cellfun(@(point) set_point(point), holds_points);
    cellfun(@(point) set_point(point), finish_points);
end