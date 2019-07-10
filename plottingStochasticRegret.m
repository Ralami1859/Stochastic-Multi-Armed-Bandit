function plottingStochasticRegret(environment,ArmsPlayed,titre)

regret = max(environment) - environment(ArmsPlayed);

figure; plot(cumsum(regret),'r.');
xlabel('Time step')
ylabel('Cumulative regret')
title(titre)
set(gca,'FontSize',14,'fontWeight',...
    'bold', 'fontName','caladea')
