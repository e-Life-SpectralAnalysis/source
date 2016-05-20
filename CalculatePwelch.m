
% Essential Input:
% TempTrace:  trace cutout for which the wavelet transform has to be calculated 
%             (length > SamplingRate)
% SamplingRate: original sampling rate of the data (20 kHz in our case)

SR=1;                             % desired spectral resolution (Hz)
nfft = SamplingRate/SR;           % length of fft (samples)
nfft = 2^nextpow2(nfft);          % round to nearest power of 2
bw = SamplingRate / nfft;         % actual resolution = bandwidth
% Estimate the power spectral density with the Welch's method
[Pyy, f_fft] = pwelch(TempTrace, hann(nfft), nfft/2, nfft, SamplingRate);

%Plot example in the range of 2-100 Hz
figure
bar(f_fft, Pyy,'k')
xlim([2 100])