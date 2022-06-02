function s = signal(N, w, fe, phi, SNR)
    dt = 1/fe;
    t = ((0:N-1)*dt)';
    
    for k = 1:N
     s(k) = exp(1j*w*t(k)+1j*phi); %signal
    end
    
    global DRAW_SIGNAL ADD_NOISE
    if ADD_NOISE
        s = add_awgn_noise(s, SNR);
    end
    
    if DRAW_SIGNAL
        hold on
        plot(t,s)
        grid on
        title("Signaux")
    end
end