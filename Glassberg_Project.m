% Get some User Inputs
level = 6;
vmax = '6C+';

% Initialize variables
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

grades = {'6B', '6B+', '6C', '6C+', '7A', '7A+', '7B', '7B+', '7C', '7C+', '8A'};
grade_value = [4 4 5 5.5 6 7 8 8.5 9 10 11];
next_climbs = {};
total_climb_count = 532;

vmax_index = find(strcmp(grades, vmax));
rng('shuffle');

cur_level = level_dict(level,:);


% Get Climbs from V-Max - 2
vmax2 = vmax_index - 2;
climb_list = readtable('MB2016.xlsx', 'Sheet', grades{vmax2});
todo_climbs = climb_list(climb_list.Sent ~= 1, :);

if height(todo_climbs) >= cur_level(1)
    climb_list = todo_climbs;
end

session_climbs = [];
ii = cur_level(1);
while ii > 0
    r = randi([1 height(climb_list)]);
    if ~ismember(r, session_climbs)
        session_climbs = [session_climbs; r];
        ii = ii - 1;
    end
end



% Get Climbs from V-Max - 1

% Get Climbs from V-Max

% Do all the above in a loop?

% Loading in data
climbs = readtable('MB2016.xlsx', 'Sheet', vmax);
rng('shuffle');





