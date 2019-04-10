function [quant, numb, bs] = normalTurn(goDice,traits,turn,nDice,bets,likelyBS,pHonestArray,nsDice,quant,numb,bs)
% Description
%   INPUTS
%    goDice - see above
%    traits - see above
%    turn - see above
%    nDice - see above
%    bets - see above
%    likelyBS - see above
%    pHonestArray - see diceWeights
%    nsDice - see above
%    quant - see above
%    numb - see above
%   OUTPUTS
%    quant - a new quantity
%    numb - a new identity
%    bs - logical variable see above
%
% 4/1/19
% Thomas Kasl

% saves the input quantity for later use
oldQuant = quant;
oldNumb = numb;
%% Identity
weightsArray = diceWeights(bets, pHonestArray, turn, traits, nDice, nsDice, goDice);

max1 = max(weightsArray);
maxes = 0;

for i = 1:length(weightsArray)
    if weightsArray(i) == max1
        maxes = maxes+1;
        numbersWithMaxWeights(maxes) = i;
    end
end

index = randi(maxes);

numb = numbersWithMaxWeights(index);

%% Quantity
% check for logic
c = traits(turn).aggressive;
quantThreshold = probabilityThresholdtoQuantity(nDice,traits,turn);
if quant < c*quantThreshold
    quant = ceil(c*quantThreshold);
elseif quant >= c*quantThreshold
    quant = quant+1;
end

%% BS
% saves traits structure under new name
structure1 = traits;
% Change turn number (creates new turn variable for use)
if turn+1 > 6
    turnOfInterest = 1;
else
    turnOfInterest = turn+1;
end
% 
structure1(turnOfInterest).threshold = likelyBS(turnOfInterest);
perceivedNextThreshold = probabilityThresholdtoQuantity(nDice,structure1,turnOfInterest);

if  oldQuant > quantThreshold
    if perceivedNextThreshold > quant
        chance = rand;
        consideration1 = traits(turn).consideration;
        if chance <= consideration1
            bs = false;
        elseif chance > consideration1
            bs = true;
        end
    else 
        bs = true;
    end
elseif oldQuant == quantThreshold
    chance = rand;
    shifty1 = traits(turn).shifty;
    if chance <= shifty1
        bs = true;
    elseif chance > shifty1 % this if randomly chooses a new identity
        weightsArray(oldNumb) = [];
        max1 = max(weightsArray);
        maxes = 0;
        for i = 1:length(weightsArray)
            if weightsArray(i) == max1
                maxes = maxes+1;
                numbersWithMaxWeights(maxes) = i;
            end
        end
        index = randi(maxes);
        numb = numbersWithMaxWeights(index);
    end
elseif oldQuant < quantThreshold
    bs = false;
end

    

        