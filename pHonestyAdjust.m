function [pHonestArray,lies,truths] = pHonestyAdjust(bets,dice,pHonestArray,lies,truths,nDice,traits,rounds)

[height, length] = size(bets);

betsMatrix = cell2mat(bets);
identityBS = betsMatrix(2,length-1);

contains = false;

for i = 1:length-1
    betIdentity = betsMatrix(2,i);
    if betIdentity == identityBS
        playerNumber = betsMatrix(3,i);
        diceOfPlayer = dice(1,playerNumber);
        diceOfPlayerMatrix = cell2mat(diceOfPlayer);
        [heightBitch, vectorLength] = size(diceOfPlayerMatrix);
        foundALieAlready = false;
        for j = 1:vectorLength
            die = diceOfPlayerMatrix(j);
            if (die == identityBS || die == 1) && ~foundALieAlready
                contains = true;
                lies(playerNumber) = lies(playerNumber)+1;
                foundALieAlready = true;
            end
        end
        if foundALieAlready == false
                contains = false;
                truths(playerNumber) = truths(playerNumber)+1;
        end
        if contains
            liesN = lies(playerNumber);
            weight2 = (1/(1+1*liesN))*10;
            weight1 = 10-weight2;
            honestValue = pHonestArray(playerNumber);
            x = honestValue;
            newHonestValue = (weight1*x+weight2*(x/2))/10;
            pHonestArray(playerNumber) = newHonestValue;
        else
            truthsN = truths(playerNumber);
            honestValue = pHonestArray(playerNumber);
            weight2 = (1/(1+0.1*truthsN))*10;
            weight1 = 10-weight2;
            x = honestValue;
            newHonestValue = (weight1*x+weight2*((1-x)/2+x))/10;
            pHonestArray(playerNumber) = newHonestValue;
        end
    end
end