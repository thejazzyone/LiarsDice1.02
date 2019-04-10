function [weightsArray] = diceWeights(bets, pHonestArray, turn, traits, nDice, nsDice, goDice)
% 
% Calculates the weight for each dice identity using the equation:
% WeightsArray = trusting*percieved honesty*quantity/total number of dice*
% number of dice in player's hand
%
% INPUT:
%   bets - the bets from the current round
%   pHonestArray - the general array containing the percieved honesty for
%       each player
%   turn - the current turn, or player
%   traits - structure containing the traits
%   nDice - the total number of dice present for a round
%   nsDice - the number of dice in each player's hand
%   goDice - the hand of the player who's turn it is
%
% OUTPUT:
%   weightsArray - 1x6 array with the weighted value for each dice identity
%   for a particular player

% Initialize Weights Array
weightsArray = zeros(1,6);

% number of bets made in the current round, max can be 5
betsSize = size(bets);
nTotalBets = betsSize(2);


% number of dice in current player's hand
handLength = length(goDice);


% Generates Weights
switch nTotalBets
    case 1
        indexLength = 0;
    case 2
        indexLength = 1;
    case 3
        indexLength = 2;
    case 4
        indexLength = 3;
    case 5
        indexLength = 4;
    otherwise
        indexLength = 4;
end
            
    
for ibet = 0:indexLength
    quantityBet = bets{1,(nTotalBets-ibet)};
 
    identityBet = bets{2,(nTotalBets-ibet)};
 
    playerNumber = bets{3,(nTotalBets-ibet)};
    
    
    weightsArray(identityBet) = ...
        weightsArray(identityBet)+...
        (traits(turn).trust*pHonestArray(playerNumber)*quantityBet)/(nDice*nsDice(playerNumber));
end

for nHand = 1:handLength
    weightsArray(goDice(nHand)) = (weightsArray(goDice(nHand)) + ...
        goDice(nHand) * traits(turn).honesty);
end