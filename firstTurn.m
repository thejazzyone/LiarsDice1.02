function[quant, numb, bs] = firstTurn(goDice,traits,turn,nDice)
% Determines the first bet of the round based on the players dice in hand,
% the turn number telling what player's turn it is, and the total number of
% dice. The first bet simply consists of number(identity) and a quantity.
%   INPUTS
%    goDice - see above
%    traits - see above
%    nDice - see above
%   OUTPUTS
%    numb -  the number (identity) of the bet
%    quant - the quantity of the bet
% 4/1/19
% Thomas Kasl, Zach 

%% Idenity
% chance variable
probs = rand;

% determines logical variable based on trait
if probs <= traits(turn).honesty
    beHonest = true;
else
    beHonest = false;
end

% intializing counters
ones = 0;
twos = 0;
threes = 0;
fours = 0;
fives = 0;
sixes = 0;

% Counts quantities of each identity
for i = 1:length(goDice)
    diceId = goDice(i);
        switch diceId
            case 1
                ones = ones + 1;
            case 2
                twos = twos + 1;
            case 3
                threes = threes + 1;
            case 4
                fours = fours + 1;
            case 5
                fives = fives + 1;
            case 6 
                sixes = sixes + 1;
        end   
end


% aggregates quanitities in arrray
realQuants = [twos+ones, threes+ones, fours+ones, fives+ones, sixes+ones];


% returns the max quant and the identity of the max quant
max1 = max(realQuants);

% Counter
maxes = 0;

% returns a vector with identities with the max quants
for i = 1:5
    if realQuants(i) == max1
        maxes = maxes + 1;
        maxQuants(maxes) = i+1; 
    end
end


% Sets the identity
if beHonest
    index = randi(length(maxQuants));
    numb = maxQuants(index); 
elseif length(maxQuants) ~= 5
    notmaxQuants = [2,3,4,5,6];
   for i = 1:maxes
       test = maxQuants(i);
       for j = 2:6
         if test == j
             notmaxQuants(j-1) = 0;
         end
       end
   end
   a = nonzeros(notmaxQuants);
   b = a';
   notmaxQuants = b;
   [widthBitch,lengthNMQ] = size(notmaxQuants);
   if lengthNMQ ~= 0
        index = randi(lengthNMQ);
   end
   numb = notmaxQuants(index);
else
    index = randi(length(maxQuants));
    numb = maxQuants(index); 
end


%% Quanity
quantThreshold = probabilityThresholdtoQuantity(nDice,traits,turn);
quant = ceil(traits(turn).aggressive*quantThreshold);

%% BS
bs = false;

