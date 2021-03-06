close all;

%Define number of samples to take
Fs = 128;               % Sampling frequency
T = 1/Fs;               % Sampling period
L = 4*Fs;                % Length of signal
%Define signal
t = (0:L-1)*T;          % Time vector
signal = f1(t);
%signal = f2(t);

%Plot to illustrate that it is a sine wave
subplot(2,2,1);
plot(t, signal);
title('Time-Domain signal');

%Take fourier transform
fftSignal = fft(signal);
% subplot(2,2,1);
% plot(fftSignal);
% title('FFT Output');

%apply fftshift, explanation: https://de.mathworks.com/matlabcentral/newsreader/view_thread/285244
fftSignalShifted = fftshift(fftSignal);

%Next, calculate the frequency axis, which is defined by the sampling rate
f = L/2*linspace(-1,1,L);

%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
P2_Shifted = abs(fftSignalShifted/L);
subplot(2,2,2);
plot(f, P2_Shifted);
title('Double-Sided Amplitude Spectrum of X(t)');
xlabel('Frequency (Hz)');
ylabel('magnitude');

%Plot single-sided spectrum
f = Fs*(0:(L/2))/L;
P2 = abs(fftSignal/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
subplot(2,2,3);
plot(f,P1);
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('Frequency (Hz)')
ylabel('magnitude')

%Plot spectrum in dB
ResultDB = mag2db(P1); % 20*log10(P1);
subplot(2,2,4);
plot(f, ResultDB);
title('Single-Sided Amplitude Spectrum of X(t) in DB');
xlabel('Frequency (Hz)');
ylabel('magnitude (DB)');
