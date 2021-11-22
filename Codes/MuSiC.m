function Peakmusic = MuSiC(R,D,F,lambda,spacing,theta)
    
    [N,~] = eig(R); % Eigen Decomposition
    Noise = N(:,1:D-F); % Noise Eigen Vectors
    Peakmusic = zeros(1,length(theta)); 
    for k = 1:length(theta)
        Signal = zeros(1,D);
        for l = 0:D-1
            Signal(1+l) = exp(-1j*2*l*pi*spacing*sin(theta(k)/180*pi)/lambda);
        end
        min = Signal*(Noise*Noise')*Signal'; % Euclidean Distance
        Peakmusic(k) = abs(1/min); % Converting all to non-negative, real values
    end
    Peakmusic = 10*log10(Peakmusic/max(Peakmusic)); % Converting to dB Scales

end