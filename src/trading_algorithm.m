CDR =readtable("cdr_d_otwarcie.csv");
MACD = readmatrix("macd.csv");
SIGNAL = readmatrix("signal.csv");

capital = 1000;
cash = 0.0;
holding = true;

before = capital .* CDR(1, "Otwarcie");
disp("Cash before transactions:")
disp(before);

for i = 1:length(MACD)
    if (MACD(i) < SIGNAL(i) ) && holding == true
        cash = cash + CDR(i, "Otwarcie") .* capital;
        capital = 0;
        holding = false;
    end

    if (MACD(i) > SIGNAL(i) ) && ~holding
        capital = floor(cash ./ CDR(i, "Otwarcie"));
        cash = cash - capital .* CDR(i, "Otwarcie");
        holding = true;
    end
end

after = cash + capital .* CDR(end, "Otwarcie");
disp("Cash after transactions:")
disp(after);

disp("Profit in %:")
disp((after ./ before - 1) .* 100);