function [BScheckresults,nsDice] =  BScheck(realQuants,quant,playerOfInterest,playerOfInterest2,nsDice,numb)
% Once BS is called, checks to see if bet wins or BS wins, and 
% changes player dice numbers accordingly
%
% Zach Kreft and Zach Safford
% April 7, 2019

if realQuants(numb) >= quant % real quantity of number called is greater
    % than or equal to bet quantity
    nsDice(playerOfInterest) = nsDice(playerOfInterest)-1; % BS-er loses a die
    playerWhoLost = playerOfInterest; % output for the player who lost a die
    playerWhoBSed = playerOfInterest;
else % real quantity is less than bet quantity
    nsDice(playerOfInterest2) = nsDice(playerOfInterest2)-1; % better (who had BS called on him,
    % loses a die
    playerWhoLost = playerOfInterest2; % output for the player who lost
    playerWhoBSed = playerOfInterest;
end
BScheckresults = [playerWhoLost,playerWhoBSed];

