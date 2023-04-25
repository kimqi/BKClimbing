% Get User Inputs
level = 8;
vmax = '6C+';

% Initialize variables
warning off;
next_climbs = {};
total_climb_count = 532;


% Get Climbs per Level
level_dict = [4 5 1;
              4 4 2;
              4 3 3;
              3 4 3;
              3 3 4;
              2 4 4;
              2 3 5;
              1 4 5;
              1 3 6;
              0 4 6;];


% Map grades
grades = {'6B', '6B+', '6C', '6C+', '7A', '7A+', '7B', '7B+', '7C', '7C+', '8A'};
grade_value = [4 4 5 5.5 6 7 8 8.5 9 10 11];


vmax_idx = find(strcmp(grades, vmax));
rng('shuffle');

cur_level = level_dict(level,:);

%% Get Climbs from VMax-2
climb_list = readtable('MB2016.xlsx', 'Sheet', grades{vmax_idx - 2});
total_vmax2_climbs = height(climb_list);
todo_climbs = climb_list(climb_list.Sent ~= 1, :);

% If there are any climbs that aren't done, then make that the list of climbs to complete
if height(todo_climbs) >= cur_level(1)
    climb_list = todo_climbs;
end

ii = cur_level(1);
while ii > 0
    r = randi([1 height(climb_list)]);
    if ~ismember(r, session_climbs)
        session_climbs = [session_climbs; r];
        ii = ii - 1;
    end
end

