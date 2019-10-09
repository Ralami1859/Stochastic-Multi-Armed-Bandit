addpath('Modules/');   
addpath('Algorithms/');  
%----------------------------------------------------------
%%              Define the environment
%----------------------------------------------------------
environment = [0.9 0.5 0.3 0.2];
Horizon = 2000; %Overall number of interaction with the environment

%--------------------------------------------------------------
%%               Running options
%--------------------------------------------------------------
NbrRuns = 100;

MatrixArmsPlayedBayesUCB = [];
MatrixArmsPlayedCPUCB    = [];
MatrixArmsPlayedKLUCB    = [];
MatrixArmsPlayedMOSS     = [];
MatrixArmsPlayedTS       = [];
MatrixArmsPlayedUCB1     = [];
MatrixArmsPlayedUCBV     = [];
MatrixArmsPlayedUCBTuned = [];
MatrixArmsPlayedDMED     = [];
 
%----------------------------------------------------------
%%                Launching the stochastic bandits
%----------------------------------------------------------
for run = 1:NbrRuns;
    display(run)
    c = 1.01;
    HF = 1; % Horizon Free option for Bayes UCB and KL-UCB
    alpha0 = 1; beta0 = 1;
    [~, ArmsPlayedTS] = ThompsonSampling(environment, Horizon, alpha0, beta0);
    [~, ArmsPlayedUCB1] = UCB1(environment, Horizon);
    [~, ArmsPlayedUCBV] = UCBV(environment, Horizon);
    [~, ArmsPlayedUCBTuned] = UCBTuned(environment, Horizon);
    variant = 0;
    [~, ArmsPlayedCPUCB] = CPUCB(environment, Horizon, c);
    [~, ArmsPlayedKLUCB] = KLUCB(environment, Horizon, HF, c);
    [~,ArmsPlayedBayesUCB] = BayesUCB(environment, Horizon, alpha0, beta0, HF, c);
    [~, ArmsPlayedMOSS] = MOSS(environment, Horizon);
    genuine = 1;
    [~, ArmsPlayedDMED] = DMED(environment, Horizon, genuine);

    % ---------Result storage----------------------------
    
    MatrixArmsPlayedBayesUCB = [MatrixArmsPlayedBayesUCB; ArmsPlayedBayesUCB];
    MatrixArmsPlayedCPUCB    = [MatrixArmsPlayedCPUCB; ArmsPlayedCPUCB];
    MatrixArmsPlayedKLUCB    = [MatrixArmsPlayedKLUCB; ArmsPlayedKLUCB];
    MatrixArmsPlayedMOSS     = [MatrixArmsPlayedMOSS; ArmsPlayedMOSS];
    MatrixArmsPlayedTS       = [MatrixArmsPlayedTS; ArmsPlayedTS];
    MatrixArmsPlayedUCB1     = [MatrixArmsPlayedUCB1; ArmsPlayedUCB1];
    MatrixArmsPlayedUCBV     = [MatrixArmsPlayedUCBV; ArmsPlayedUCBV];
    MatrixArmsPlayedUCBTuned = [MatrixArmsPlayedUCBTuned; ArmsPlayedUCBTuned];
    MatrixArmsPlayedDMED     = [MatrixArmsPlayedDMED; ArmsPlayedDMED];
end
%-----------------------------------------------------------
%%             Plotting the results
%-----------------------------------------------------------

plottingStochasticRegret(environment, MatrixArmsPlayedTS,      [0 0 0],0);
plottingStochasticRegret(environment, MatrixArmsPlayedKLUCB,   [1 0 0],1);
plottingStochasticRegret(environment, MatrixArmsPlayedUCB1,    [0 0.5 0],1);
plottingStochasticRegret(environment, MatrixArmsPlayedUCBV,    [0 0 1],1);
plottingStochasticRegret(environment, MatrixArmsPlayedUCBTuned,[1 0.5 0],1);
plottingStochasticRegret(environment, MatrixArmsPlayedCPUCB,   [1 1 0],1);
plottingStochasticRegret(environment, MatrixArmsPlayedBayesUCB,[0 1 1],1);
plottingStochasticRegret(environment, MatrixArmsPlayedMOSS,    [1 0.5 1],1);
plottingStochasticRegret(environment, MatrixArmsPlayedDMED,    [0.5 0.5 0],1);
legend('Thompson Sampling','KL UCB','UCB 1','UCB V','UCB Tuned','CP UCB','Bayes UCB','MOSS', 'DMED')
grid on;