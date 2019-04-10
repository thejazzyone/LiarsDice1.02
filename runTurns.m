function [quant,numb,likelyBS,totalTurns,turn,playerOfInterest,playerOfInterest2,bets] = runTurns(dice,nsDice,quant,numb,nDice,bets,...
   traits,pHonestArray,turn,totalTurns,likelyBS,bs,rounds)
% loop that runs turns around the circle until "BS" is called
%
% Zach Kreft and Zach Safford
% April 7, 2019
counter = 0;
while ~bs
    totalTurns = totalTurns+1; % increments total turns counter
    goDice = dice{turn}; % the hand of the player on turn
    % runs turns operated by betting function until "BS" is called
    [quant,numb,bs,turn,likelyBS] = betting(quant,numb,goDice,nDice,turn,bets,nsDice,likelyBS,totalTurns,traits,pHonestArray,bs); 
    if ~bs
        bets{1,totalTurns} = quant;
        bets{2,totalTurns} = numb;
    elseif bs
        bets{1,totalTurns} = 0;
        bets{2,totalTurns} = 0;
    end
    % saves the player number for this turn
    if turn >= 2 
        bets{3,totalTurns} = turn-1;
        playerOfInterest = turn-1;   
    else 
        bets{3,totalTurns} = 6;
        playerOfInterest = 6;
    end  
    if playerOfInterest >= 2
        playerOfInterest2 = playerOfInterest-1;
    else
        playerOfInterest2 = 6;
    end
  % adjust likelyBS array by the only information that is available to the player  
    if bs
        if rounds == 0
            matrix1 = cell2mat(bets);
            likelyBS(playerOfInterest) = binocdf((matrix1(1,(totalTurns-1))),nDice,(1/3));
        else
            matrix1 = cell2mat(bets);
            likelyBS(playerOfInterest) = (binocdf((matrix1(1,(totalTurns-1))),nDice,(1/3))+likelyBS(playerOfInterest))/2;
        end
    end
    disp(['Turn Passed (No BS)' num2str(rounds)])
    counter = counter+1;
    
end

disp(['Round Complete (BS)' num2str(rounds)])
