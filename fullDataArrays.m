function [fullnTurnsStore,fullTotalBets,fullTotalDice,fullPlayerData]...
 = fullDataArrays(iC,nTurnsStore,totalBets,totalDice,playerData)
% stores the values in different arrays
%
% Zach Kreft and Zach Safford
% April 7, 2019


    fullnTurnsStore{1,iC} = iC;
    fullnTurnsStore{2,iC} = nTurnsStore;
    fullTotalBets{1,iC} = iC;
    fullTotalBets{2,iC} = totalBets;
    fullTotalDice{1,iC} = iC;
    fullTotalDice{2,iC} = totalDice;
    fullPlayerData{1,iC} = iC;
    fullPlayerData{2,iC} = playerData;