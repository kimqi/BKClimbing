% User Inputs
level = 6;
vmax = '6C+';

% Loading in data
D = readtable("D:\Data\Climbing\MB2016 Database.xlsx");
climbs = table2array(D);

% Initialize variables that are constant
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
next_climbs = {};

% Get all the values we need
cur_level = level_dict(level,:);

rng('shuffle')

for ilvl = 1:3
    v_grade = grades{find(strcmp(vmax, grades)) - 3 + ilvl};
    climb_list = climbs(strcmp(v_grade, climbs(:,2)),:);
    
    session_climbs = [];
    ii = 1;
    while ii <= cur_level(ilvl)
        r = randi([1 height(climb_list)]);
        
        if ~ismember(r, session_climbs)
            session_climbs = [session_climbs; r];
            ii = ii + 1;
        end
    end
    next_climbs= vertcat(next_climbs, climb_list(session_climbs,:));
end

disp('Next Session Climbs')
for txt = 1:height(next_climbs)
    disp(strcat(next_climbs{txt, 1}, ' (', next_climbs{txt,2}, ')'))
end




