function plottingStochasticRegret(environment,MatrixArmsPlayed,col, holding)

[NbrRuns, ~] = size(MatrixArmsPlayed);

regret = [];

for run = 1:NbrRuns;
    regret = [regret; cumsum(max(environment)- environment(MatrixArmsPlayed(run,:)))];
end
if holding == 0
   figure; 
   grid on
else
    hold on
end
plot(mean(regret,1),'Color',col, 'LineWidth',2);
xlabel('Time step')
ylabel('Cumulative regret')
set(gca,'FontSize',14,'fontWeight',...
    'bold', 'fontName','caladea')
