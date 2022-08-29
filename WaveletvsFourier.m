% Fourier vs Wavelet with ECGs | Jackson Jost
clear; clc;
% Load the signal
load('ecg.mat');

% Calculate the spectral density
fs = 1000;
n = length(ecg);
xdft = fft(ecg);
xdft = xdft(1:n/2+1);
psdx = (1/(fs*n)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:fs/n:fs/2;

% Calculate the wavelet transform
cwtmatr = cwtft({ecg,1/fs},'scales',1:100,'plot');

% Plot the results
figure
subplot(2,1,1)
plot(freq,10*log10(psdx))
title('Spectral Density')
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

subplot(2,1,2)
plot(cwtmatr.scales,cwtmatr.cfs)
title('Wavelet Transform')
xlabel('Scales')
xlim([0 100])
ylabel('Coefficients')