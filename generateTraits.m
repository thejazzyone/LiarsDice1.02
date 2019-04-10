function traits = generateTraits(numPlayers)
% Establishes the character traits each computer player will adopt for the
% game
% The traits are split up in to two categories:
%   Identity: based off these character traits below, determines the new
%       idenity of the dice per round - idenity refers to the dice 
%       (two, three, four, five, six).
%       1. Honesty
%       2. Trust
%   Quanity: based off of the character traits below, determines the new
%       quanity of the dice present per round - refers to the number of dice in
%       the game (1-30)
%       3. Threshold
%       4. Aggressive
%       5. Shifty
%       6. Consideration
% 
% INPUTS
%   n - number of players 
%
% OUTPUTS
%   traits -  a structure

% preallocates the traits into a 1 x n array
% looked this up and this is the general structure for preallocating but not working... fix this later or ask Bartolini
% traits = struct('honesty',zeros(n,1),'trust',zeros(n,1),'aggressive',zeros(n,1)...
%  'threshold',zeros(n,1),'shifty',zeros(n,1));

% for loop that gives a certain trait to each person anywhere from 0-1
%   the closer to 1, the more the person embodies that specific trait
for i = 1:numPlayers
   traits(i).honesty = rand;
   traits(i).trust = rand;
   traits(i).aggressive = rand;
   traits(i).threshold = rand;
   traits(i).shifty = rand;
   traits(i).consideration = rand;
end
