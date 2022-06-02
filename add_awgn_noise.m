function[y,n,N0,noiseSigma] = add_awgn_noise(x,SNR_dB)
%[y,n]=awgn_noise(x,SNR) adds AWGN noise vector to signal ’x’ to generate a
%resulting signal vector y of specified SNR in dB. It also returns the
%noise vector ’n’ that is added to the signal x
[Nx,Lx] = size(x);
SNR = 10^(SNR_dB/10); %SNR to linear scale
y = zeros(Nx,Lx);
n = zeros(Nx,Lx);
for i = 1:Nx
    Esym = sum(abs(x(i,:)).^2)/Lx; %Calculate actual symbol energy
    N0(i) = Esym/SNR; %Find the noise spectral density
    if(isreal(x))
        noiseSigma(i) = sqrt(N0(i)); %Standard deviation for AWGN Noise when x is real
        n(i,:) = noiseSigma(i)*randn(1,Lx);%computed noise
    else
        noiseSigma(i) = sqrt(N0(i)/2);%Standard deviation for AWGN Noise when x is complex
        n(i,:) = noiseSigma(i)*(randn(1,Lx) + 1j*randn(1,Lx));
        %computed noise
    end
    y(i,:) = x(i,:) + n(i,:); %received signalend
end