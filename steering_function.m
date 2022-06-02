function theta_est = steering_function(theta, d, Nc, w, dT, N, c, x)
    g = x*x'/N; %gamma
    
    index = 1;
    xc = [0:d:(Nc-1)*d]';
    thetavec = deg2rad((-90:dT:90));
    maxX = -100;
    maxY = 0;
    for theta_c = thetavec
        wFC = exp(-1j*w*xc*sin(theta_c)/c);
        x_f = wFC'*x;
        steering(index) = wFC'*g*wFC;
        if (real(steering(index)) > maxY) %theta estime
            maxY = real(steering(index));
            maxX = theta_c;
            theta_est = maxX;
        end
        index = index + 1;
    end
    theta_est = rad2deg(theta_est); %affichage en degres
    disp("La valeur de θ estimé pour θ réel = " + num2str(rad2deg(theta)) + " est : " + num2str(theta_est))
    
    %% Affichage
    global DRAW_MESURE DRAW_BEANFORMING DRAW_FONCTION_DIRECTIVITE
    if DRAW_MESURE
        figure()
        plot(real(x(1,:)))
        hold on
        plot(imag(x(1,:)))
        plot(real(x(2,:)))
        plot(imag(x(2,:)))
        grid()
        title("Mesures x(t) sur les 2 premiers capteurs pour \theta =", num2str(rad2deg(theta')))
    end

    if DRAW_BEANFORMING
        figure()
        plot(real(x_f))
        hold on
        plot(imag(x_f))
        grid()
        title("Beanforming x(t,\theta) pour \theta =", num2str(rad2deg(theta')))
    end
    
    if DRAW_FONCTION_DIRECTIVITE
        figure()
        semilogy(thetavec*180/pi, real(steering))
        grid()
        title("Fonction de directivité pour \theta =", num2str(rad2deg(theta')))
    end
end
    