%----------------------------------------------------------
%%              Define the environment
%----------------------------------------------------------
environment = [0.7 0.1 0.1];
Horizon = 1000; %Overall number of interaction with the environment


%----------------------------------------------------------
%%                Launching the stochastic bandits
%----------------------------------------------------------
c = 1.01;
HF = 1; % Horizon Free option for Bayes UCB and KL-UCB

alpha0 = 1; beta0 = 1;
[~, ArmsPlayedTS] = ThompsonSampling(environment, Horizon, alpha0, beta0);

[~, ArmsPlayedUCB1] = UCB1(environment, Horizon);
[~, ArmsPlayedUCBV] = UCBV(environment, Horizon);
c = 1;
variant = 0;
[~, ArmsPlayedCPUCB] = CPUCB(environment, Horizon, c);
[~, ArmsPlayedMOSS] = MOSS(environment, Horizon);
[~, ArmsPlayedKLUCB] = KLUCB(environment, Horizon, HF, c);
[~,ArmsPlayedBayesUCB] = BayesUCB(environment, Horizon, alpha0, beta0, HF, c);

%-----------------------------------------------------------
%%             Plotting the results
%-----------------------------------------------------------

plottingStochasticRegret(environment,ArmsPlayedTS,'Thompson Sampling');

plottingStochasticRegret(environment,ArmsPlayedKLUCB,'KL UCB');

plottingStochasticRegret(environment,ArmsPlayedUCB1,'UCB 1');

plottingStochasticRegret(environment,ArmsPlayedUCBV,'UCB V');


plottingStochasticRegret(environment,ArmsPlayedCPUCB,'CPUCB');

plottingStochasticRegret(environment,ArmsPlayedMOSS,'MOSS');

plottingStochasticRegret(environment,ArmsPlayedBayesUCB,'BayesUCB');
