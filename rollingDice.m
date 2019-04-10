function [dice] = rollingDice(nsDice) 

% Rolls the dice
% creates 1x6 cell array with vectors of random integers from 1 to 6
%  with lenghts corresponding to the number of dice each player has
%  for example if player 1 had 5 dice, then the first cell of the array
%  would containg a 1x5 vector with random integers
for i = 1:6
    dice{i} = randi(6,1,nsDice(i));
end