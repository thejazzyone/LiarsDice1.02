function [winners,fullnTurnsStore,fullTotalBets,fullTotalDice,bestTraits] = ldgameNEW(n)
% plays n games of liar's dice with 6 players starting with 5 dice each and
% starting with a random player.
%   INPUT
%    n - number of games to be played
%   OUTPUTS
%    winners - a 1 x n array of the numbers corresponding to the winning
%              players
%    fullnTurnsStore - a cell array with two rows, the first row is the
%                      game number and the second row contains an array
%                      with the first row being the round number and the
%                      second row being the total # of turns in that round
%    fullTotalBets - a cell array with two rows, the first row is the game
%                    number and the second row contains a cell array with
%                    all of the bets from each round of that game and the
%                    total number of dice in the corresponding round
%    fullTotalDice - a cell array with two rows, the first row containing
%                    the game number and the second row containing a cell
%                    array with the dice rolls for each player and each
%                    round
%    fullPlayerData - a cell array with two rows, the first row is game
%                     number, and the second row contains a cell array with
%                     the round playerWhoLost and playerWhoBSed data
%
% 3/19/19
% Thomas Kasl
% ensure randomness
rng shuffle
% preallocates the array to store the numbers of the winners
winners = zeros(1,1);
% cell array to store an array with number of turns for each round for each
% game
fullnTurnsStore = {}; % row 1 is game number, row 2 is array with round numbers and # of turns
% cell array to store the bets from each round for each game
fullTotalBets = {};
% cell array to store the dice from each round for each game
fullTotalDice = {};
% cell array to store the player who lost and player who bsed for each
% round for each game
fullPlayerData = {};
%% loop that runs the game as many times as specified

[fullnTurnsStore,fullTotalBets,fullTotalDice,winners,traitsWinner] = gameLoop(n,winners,fullnTurnsStore,fullTotalBets,fullTotalDice,fullPlayerData);

%% Call output best traits function
bestTraits = outputTraitsStructure(traits,traitsWinner);