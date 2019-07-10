%----------------------------------------------------------
%%              Define the environment
%----------------------------------------------------------
environment = [0.9 0.1 0.1];
Horizon = 1000; %Overall number of interaction with the environment


%----------------------------------------------------------
%%                Launching the stochastic bandits
%----------------------------------------------------------

alpha0 = 1; beta0 = 1;
[~, ArmsPlayedTS] = ThompsonSampling(environment, Horizon, alpha0, beta0);

[~, ArmsPlayedUCB1] = UCB1(environment, Horizon);
[~, ArmsPlayedUCBV] = UCBV(environment, Horizon);
[~,ArmsPlayedBayesUCB] = BayesUCB(environment, Horizon, alpha0, beta0);
variant = 0;
c = 1.01;
[~, ArmsPlayedKLUCB] = KLUCB(environment, Horizon, variant);
[~, ArmsPlayedCPUCB] = CPUCB(environment, Horizon, c);
[~, ArmsPlayedMOSS] = MOSS(environment, Horizon);

%-----------------------------------------------------------
%%             Plotting the results
%-----------------------------------------------------------
plottingStochasticRegret(environment,ArmsPlayedTS,'Thompson Sampling');

plottingStochasticRegret(environment,ArmsPlayedUCB1,'UCB 1');

plottingStochasticRegret(environment,ArmsPlayedUCBV,'UCB V');

plottingStochasticRegret(environment,ArmsPlayedBayesUCB,'BayesUCB');

plottingStochasticRegret(environment,ArmsPlayedKLUCB,'KLUCB');

plottingStochasticRegret(environment,ArmsPlayedCPUCB,'CPUCB');

plottingStochasticRegret(environment,ArmsPlayedMOSS,'MOSS');