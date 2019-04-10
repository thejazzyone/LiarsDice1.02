function [nsDice] = playerDiceArray(startDice)
% player dice number arrray
%
% Zach Kreft and Zach Safford
% April 7, 2019

 % player dice number array intitialize
    nsDice = zeros(1,6);
    for i = 1:6
        nsDice(1,i) = startDice;
    end