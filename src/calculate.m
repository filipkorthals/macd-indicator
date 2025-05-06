CDR = readmatrix("cdr_d_otwarcie.csv");
MACD = zeros(1000, 1);
for i = 27:length(CDR)
    MACD(i, 1) = ema(CDR(:, 2), 12, i) - ema(CDR(:, 2), 26, i);
end

SIGNAL = zeros(1000, 1);
for i = 36:length(MACD)
    SIGNAL(i, 1) = ema(MACD, 9, i);
end

MACD200 = zeros(200, 1);
for i = 27:200
    MACD200(i, 1) = ema(CDR(800:1000, 2), 12, i) - ema(CDR(800:1000, 2), 26, i);
end

SIGNAL200 = zeros(200, 1);
for i = 36:length(MACD200)
    SIGNAL200(i, 1) = ema(MACD, 9, i);
end

writematrix(MACD, 'macd.csv');
writematrix(SIGNAL, 'signal.csv');
writematrix(MACD200, 'macd200.csv');
writematrix(SIGNAL200, 'signal200.csv');