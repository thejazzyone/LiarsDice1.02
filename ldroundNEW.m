function [nsDice,turn,totalTurns,likelyBS,nDice,bets,dice,playerWhoLost,playerWhoBSed,lies,truths,pHonestArray] = ...
    ldroundNEW(nsDice,turn,likelyBS,traits,pHonestArray,lies,truths,rounds)
% Plays 1 round of liar's dice using bet function and returns adjusted 
% numbers of dice for each player. Only one person will lose a die after 
% 1 round.
%   INPUTS
%    nsDice - an array with the number of dice for each player
%    turn - the number corresponding to the player who's turn it is
%    likelyBS - a 1x6 array with general percieved likelihood of calling BS
%               by each player
%    traits -
%    pHonestArray -
%   OUTPUTS
%    nsDice - an array with the number of dice for each player
%    turn - the number corresponding to the player who's turn it is
%    totalTurns - the total number of turns in this round
%    likelyBS - a 1x6 array with general percieved likelihood of calling BS
%               by each player
%    nDice - the total number of dice in play from this round
%    bets - cell array with all the bets from this round
%           the first row is the quantity
%           the second row is the number
%           the third row is the player whose turn it was
%    dice - a 2x6 array with the player number and the dice for each player
%           in this round
%           the first row is the player number
%           the second row is the dice the player had in hand
%    playerWhoLost - the number corresponding to the player who lost a die
%    playerWhoBSed - the number corresponding to the player who BSed
%
% 3/18/19
% Thomas Kasl

% calculates the total number of dice in play for decision usage
nDice = sum(nsDice);

% presets the #'s counters to 0
ones = 0;
twos = 0;
threes = 0;
fours = 0;
fives = 0;
sixes = 0;

%% Rolls the dice
dice = rollingDice(nsDice);

%% counts the total real quantity of each number in all the dice rolls
realQuants = quantDice(nsDice,dice,ones,twos,threes,fours,fives,sixes);

%% preset variables for first turn
quant = 0; % the quantity of a certain number in the bet
numb = 0; % the number in the bet
bs = 0; % logical variable "BS"
bets = {}; % cell array that stores each bet for this round
totalTurns = 0; % the total number of turns in this round

%% loop that runs turns around the circle until "BS" is called
    [quant,numb,likelyBS,totalTurns,turn,playerOfInterest,playerOfInterest2,bets] = runTurns(dice,nsDice,quant,numb,nDice,bets,...
   traits,pHonestArray,turn,totalTurns,likelyBS,bs,rounds);
    
%% Once BS is called, checks to see if bet wins or BS wins, and
% changes player dice numbers accordingly
[BScheckresults,nsDice] = BScheck(realQuants,quant,playerOfInterest,playerOfInterest2,nsDice,numb);

playerWhoLost = BScheckresults(1);
playerWhoBSed = BScheckresults(2);

%% Rounds counter FOR DEBUGGING PURPOSES
rounds = rounds+1;

%% Adjust the pHonestArray
[pHonestArray,lies,truths] = pHonestyAdjust(bets,dice,pHonestArray,lies,truths,nDice,traits,rounds);

%% Reformats the dice array
dice = reformat(dice);