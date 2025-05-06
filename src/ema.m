function val = ema(input, n, i)
    alpha = 2 / (n + 1);
    sum1 = 0;
    sum2 = 0;
    for index = 0:n
        sum1 = sum1 + (input(i-index, 1) * (1 - alpha) .^ index);
        sum2 = sum2 + (1 - alpha) .^ index;
    end
    val = sum1 / sum2;
end