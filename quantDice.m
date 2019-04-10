function [realQuants] = quantDice(nsDice,dice,ones,twos,threes,fours,fives,sixes)
% counts the total real quantity of each number in all the dice rolls
% used in the function ldround
%
% Zach Kreft
% April 7, 2019

for i = 1:6
    if nsDice(i) ~= 0
        for j = 1:nsDice(i)
            diceId = dice{i}(j);
            switch diceId
                case 1
                    ones = ones+1;
                case 2
                    twos = twos+1;
                case 3
                    threes = threes+1;
                case 4
                    fours = fours+1;
                case 5
                    fives = fives+1;
                case 6
                    sixes = sixes+1;
            end
        end
    end
end

% puts the real quantities of each number into an array with ones counted
% for all others except itself
realQuants = [0,twos+ones,threes+ones,fours+ones,fives+ones,sixes+ones];