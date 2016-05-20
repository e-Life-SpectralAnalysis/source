
% Essential Input:
% TempTrace: trace cutout for the wavelet transformation  
% SamplingRate: original sampling rate of the data (20 kHz in our case)

WaveT='cmor2-1';
fc = centfrq(WaveT);
freqrange = [100 300];
scalerange = fc./(freqrange*(1/SamplingRate));
% scales to be used for wavelet calculation (20 kHz sampling rate assumed)
% a) threshold determination: scalerange(end):5:scalerange(1)
% b) wavelet illustration: scalerange(end):1:scalerange(1)
scales = scalerange(end):1:scalerange(1); 
% wavelet transform
Coeffs = cwt(TempTrace,scales,WaveT);


            % you can take the cumulative coefficient for e.g. threshold value
            % calculation; those values will then be averaged over all wavelet transforms
            CumCoeffs=sum(abs(Coeffs)); 


%Plot example
t=0:(1/SamplingRate):(length(TempTrace)/SamplingRate); t(1)=[];   % time vector
F = scal2frq(scales,WaveT,1/SamplingRate);                        % pseudo-frequency scale
figure
surf(t,F,abs(Coeffs),'EdgeColor','none'); view(0,90);
axis tight;


