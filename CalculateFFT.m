
% Essential Input:
% TempTrace: trace cutout for which the wavelet transform has to be calculated 
%            (usually an even number of data points)
% SamplingRate: original sampling rate of the data (suppose to be 20 kHz)

% note: we do not use the nearest power of 2 to calculate the fft with the optimal number of data points

pts=length(TempTrace);                          % number of points (normally we use 1s cutouts)
ny=floor(SamplingRate/2);                       % nyquist frequency
f_fft = ny*linspace(0,1,floor(pts/2));          % frequency values of x-axis
Y = fft(TempTrace)/pts;                         % calculate fft
Pyy = Y.* conj(Y);                              % power spectral densitiy
Pyy=Pyy(1:floor(pts/2));                        % one-sided

%Plot example in the range of 2-100 Hz
figure
plot(f_fft, Pyy,'k')
xlim([2 100])

