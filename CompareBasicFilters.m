% Comparing Basic Filters for ECG Signals | Jackson Jost
clear; clc;
%% Load Data
load('ecg.mat')
t = 1:length(ecg);
fs = 1024;
%% Filter Data
% Moving Average
y_ma = movmean(ecg, 10);

% Low Pass
fc = 10; % Cutoff frequency
order = 4; % Order
[b,a] = butter(order,fc/(fs/2),'low');
y_lp = filter(b,a,ecg);

% High Pass
fc = 1; % Cutoff frequency
order = 4; % Order
[b,a] = butter(order,fc/(fs/2),'high');
y_hp = filter(b,a,ecg);


%% Plot Results
figure
subplot(2,2,1)
plot(t,ecg)
xlabel('Time (s)')
ylabel('Amplitude (mV)')
title('Raw ECG Signal')

subplot(2,2,2)
plot(t,y_ma)
xlabel('Time (s)')
ylabel('Amplitude (mV)')
title('Moving Average Filtered Signal')

subplot(2,2,3)
plot(t,y_lp)
xlabel('Time (s)')
ylabel('Amplitude (mV)')
title('Low Pass Filtered Signal')

subplot(2,2,4)
plot(t,y_hp)
xlabel('Time (s)')
ylabel('Amplitude (mV)')
title('High Pass Filtered Signal')