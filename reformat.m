function [dice] = reformat(dice)
% Reformats the dice array
%
% Zach Kreft & Zach Safford
% April 7, 2019

for i = 1:6
    dice{2,i} = dice{1,i};
    dice{1,i} = i;
end