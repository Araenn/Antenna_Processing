function D = steering_vector(Nc, w, theta, c, d)
    D = zeros(Nc, 1);
    for n = 0:Nc-1
        D(n+1) = exp(-1j*w*n*d*sin(theta)/c); %steering vector
    end
end