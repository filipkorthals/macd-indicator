CDR =readtable("cdr_d_otwarcie.csv");

figure;
plot(CDR{:,"Otwarcie"});
xticks(1:60:1000);
xticklabels(string(CDR{1:60:1000, "Data"}));
title("CD Projekt SA (CDR)");
xlabel("Time");
ylabel("Value");

print -dpng notowania.png;

MACD = readmatrix("macd.csv");
SIGNAL = readmatrix("signal.csv");
figure;
hold on;
plot(MACD);
plot(SIGNAL);

intersection_points = [];
for i = 36:length(MACD)-1
    if (MACD(i) - SIGNAL(i)) * (MACD(i+1) - SIGNAL(i+1)) <= 0
        intersection_points = [intersection_points, i];
    end
end

intersection_values = MACD(intersection_points);
scatter(intersection_points, intersection_values, 50, 'r', 'o');
scatter(intersection_points(15:16), intersection_values(15:16), 100, 'black', 'filled');

disp(CDR{intersection_points(15), "Otwarcie"});
disp(CDR{intersection_points(16), "Otwarcie"});


legend("MACD", "SIGNAL");
xticks(1:60:1000);
xticklabels(string(CDR{1:60:1000, "Data"}));
xlabel('Time');
ylabel('Value');
title('MACD');
hold off;

print -dpng macd.png;

figure;
plot(CDR{800:1000, "Otwarcie"});
xlim([0 200]);
title("CD Projekt SA (CDR)");
xticks(1:20:200);
xticklabels(string(CDR{800:20:1000, "Data"}));
xlabel("Time");
ylabel("Value");

print -dpng notowania200.png;


MACD200 = readmatrix("macd200.csv");
SIGNAL200 = readmatrix("signal200.csv");
figure;
hold on;
plot(MACD200);
plot(SIGNAL200);

intersection_points = [];
for i = 36:length(MACD200)-1
    if (MACD200(i) - SIGNAL200(i)) * (MACD200(i+1) - SIGNAL200(i+1)) <= 0
        intersection_points = [intersection_points, i];
    end
end

intersection_values = MACD200(intersection_points);
scatter(intersection_points, intersection_values, 100, 'r', 'o');
scatter(intersection_points(2:3), intersection_values(2:3), 100, 'black', 'filled');

disp(CDR{800+intersection_points(2), "Otwarcie"});
disp(CDR{800+intersection_points(3), "Otwarcie"});


legend("MACD", "SIGNAL");
xticks(1:20:200);
xticklabels(string(CDR{800:20:1000, "Data"}));
xlabel('Time');
ylabel('Value');
title('MACD');
hold off;

print -dpng macd200.png;