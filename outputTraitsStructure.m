function bestTraits = outputTraitsStructure(traits,traitsWinner)
%% Output Traits Structure
% adds the average of the winner of the last game
traits(6).honesty = (traitsWinner(1).honesty+traits(6).honesty)/2;
traits(6).trust = (traitsWinner(1).trust+traits(6).trust)/2;
traits(6).aggressive = (traitsWinner(1).agressive+traits(6).aggressive)/2;
traits(6).threshold = (traitsWinner(1).threshold+traits(6).threshold)/2;
traits(6).shifty = (traitsWinner(1).shifty+traits(6).shifty)/2;
traits(6).consideration = (traitsWinner(1).consideration+traits(6).consideration)/2;

% output of best traits
bestTraits(1).honesty = traits(6).honesty;
bestTraits(1).trust = traits(6).trust;
bestTraits(1).aggressive = traits(6).aggressive;
bestTraits(1).threshold = traits(6).threshold;
bestTraits(1).shifty = traits(6).shifty;
bestTraits(1).consideration = traits(6).honesty;