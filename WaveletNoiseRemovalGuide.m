% Comparing Basic Filters for ECG Signals | Jackson Jost
clear; clc;
% Load data
load ecg.mat
Fs = 1000;

% Find the wavelet decomposition
[c,l] = wavedec(ecg,10,'db4');
cwtft({ecg,1/Fs},'scales',1:64, 'plot');
title('Wavelet Transform of ECG Signal');

% Plot results
figure;
subplot(2,1,1)
plot(ecg)
subplot(2,1,2)
imagesc(c);
colormap('bone');
title('Wavelet Transform of ECG Signal');
% To remove noise coefficients, set the coefficients to zero that are
% below the threshold of noise as seen in the plot.