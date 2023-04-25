% Get some User Inputs
level = 8;
vmax = '6C+';
warning off;

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


%% Get Climbs from V-Max - 2
vmax2 = vmax_index - 2;
climb_list = readtable('MB2016.xlsx', 'Sheet', grades{vmax2});
total_vmax2_climbs = height(climb_list);
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
next_vmax2_climbs = climb_list(session_climbs,:);



%% Get Climbs from V-Max - 1
vmax1 = vmax_index - 1;
climb_list = readtable('MB2016.xlsx', 'Sheet', grades{vmax1});
total_vmax1_climbs = height(climb_list);
todo_climbs = climb_list(climb_list.Sent ~= 1, :);

if height(todo_climbs) >= cur_level(2)
    climb_list = todo_climbs;
end

session_climbs = [];
ii = cur_level(2);
while ii > 0
    r = randi([1 height(climb_list)]);
    if ~ismember(r, session_climbs)
        session_climbs = [session_climbs; r];
        ii = ii - 1;
    end
end

next_vmax1_climbs = climb_list(session_climbs,:);

% Get Climbs from V-Max
climb_list = readtable('MB2016.xlsx', 'Sheet', grades{vmax_index});
total_vmax_climbs = height(climb_list);
todo_climbs = climb_list(climb_list.Sent ~= 1, :);
working_climbs = climb_list(climb_list.Sent == 0, :);
done_climbs = climb_list(climb_list.Sent == 1, :);

session_climbs = [];
ii = cur_level(3);

if ~isempty(done_climbs)
    r = randi([1 height(done_climbs)]);
    session_climbs = [session_climbs; r];
    next_vmax_climbs = done_climbs(session_climbs,:);
    ii = ii - 1;
end


session_climbs = [];
if ~isempty(working_climbs)
    if ii > 0
        r = randi([1 height(working_climbs)]);
        session_climbs = [session_climbs; r];
        ii = ii - 1;
    end
    next_vmax_climbs = vertcat(next_vmax_climbs, working_climbs(session_climbs,:));
end
    
session_climbs = [];
while ii > 0
    
    r = randi([1 height(todo_climbs)]);
    if ~ismember(r, session_climbs)
        session_climbs = [session_climbs; r];
        ii = ii - 1;
    end
   
end
next_vmax_climbs = vertcat(next_vmax_climbs, todo_climbs(session_climbs,:));

% Temporary while database is updating
next_vmax2_climbs = next_vmax2_climbs(:, 1:6);

next_climbs = vertcat(next_vmax2_climbs, next_vmax1_climbs, next_vmax_climbs);

disp('Next Session Climbs');
disp('----------------------------');
% Get the score of the session
for ii = 1:height(next_climbs)
    disp(strcat(num2str(ii), '. ', next_climbs.Name{ii}, ' (', num2str(next_climbs.Grade(ii)), ')'));
end
disp('----------------------------');
session_load = sum(next_climbs.Weight);
disp(strcat('Total Session Load: ', num2str(session_load)));

expected_load = cur_level(1) * (grade_value(vmax2) + 0.5) + cur_level(2) * (grade_value(vmax1) + 0.5) + cur_level(3) * (grade_value(vmax_index) + 0.5);
deviation = session_load - expected_load;
disp(['Deviation from Load: ', num2str(deviation)]);






