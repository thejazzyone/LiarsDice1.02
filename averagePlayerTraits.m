function traits = averagePlayerTraits(traits,traitsWinner,iC)
if iC == 1
    traits(6).honesty = 0.5;
    traits(6).trust = 0.5;
    traits(6).aggressive = 0.5;
    traits(6).threshold = 0.5;
    traits(6).shifty = 0.5;
    traits(6).consideration = 0.5;
else
    traits(6).honesty = (traitsWinner(1).honesty+traits(6).honesty)/2;
    traits(6).trust = (traitsWinner(1).trust+traits(6).trust)/2;
    traits(6).aggressive = (traitsWinner(1).agressive+traits(6).aggressive)/2;
    traits(6).threshold = (traitsWinner(1).threshold+traits(6).threshold)/2;
    traits(6).shifty = (traitsWinner(1).shifty+traits(6).shifty)/2;
    traits(6).consideration = (traitsWinner(1).consideration+traits(6).consideration)/2;
end
end