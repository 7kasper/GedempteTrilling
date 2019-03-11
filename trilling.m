# -=-=-= Gedempte Trilling =-=-=- #
#   Kasper Müller & Siem Bosgoed  #
#    Natuurkunde V6A Hendrikson   #
# -=-=-= Gedempte Trilling =-=-=- #

# == Globale Definities == #
t = 0; # huidige tijd
g = 9.81; # gravitatie constante
dt = 1; # tijd interval (s)

# == Uitkomst Experiment 1 == #
M1 = 555; # Massa 1 magneet (kg)
M2 = 666; # Massa 2 magneten (kg)
Mv = 999; # Massa veer (kg)
u1 = 4; # Uitrekking 1 magneet
u2 = 4; # Uitrekking 2 magneten

# == Berekeningen 1 == #
# De veerkracht is gelijk aan de zwaartekracht 
# die de veer kan tegenwerken.
F1 = M1 * g; #[2.5] (veerkracht)
F2 = M2 * g;
# De veerconstante wordt vervolgens berekend
# in duplo voor extra nauwkeurigheid.
C1 = F1 / u1; #[3] (veerconstante)
C2 = F2 / u2;
C = (C1 + C2) / 2;
# De massa van het trillende gedeelte is:
M = M2 + (1/3) * Mv; #[2] (trillende massa)
# Trillingstijd
Tt = 2 .* pi .* sqrt(M ./ C); #[1] (trillingstijd theoretisch)

# == Uitkomst Experiment 2 == #
# Het voltage wordt afgezet over de tijd,
# vervolgens worden de toppen genoteerd:
tabel = [
  1, 5;
  2, 4;
  3, 3;
  4, 2;
  5, 1
];

# == Berekeningen 2 == #
# In de resultaten zijn de amplitudes gelijk aan de moduli van de toppen.
amplitudes = abs(tabel(:,2)); # [4.5] amplitude
# Daarmee kunnnen de logaritmes worden berekend:
logAmps = log10(amplitudes); # [7] logAt (logU)
# Ook de gemeten trillingstijd kan worden vastgesteld.
# Deze is namelijk gelijk aan de tijd tussen een top en een dal *2.
# Gemiddeld genomen is dit dus het gemiddelde van de verschillen
# uit de tijd van de gemeten toppen (kolom 1 van de tabel) * 2.
Tex = mean(diff(tabel(:,1))) * 2; # [8] (trillingstijd experimenteel)

# == Vragen == #
disp('1: Bereken de veerconstante C uit de meetresultaten van experiment 1.');
C
disp('-----------------------');

disp(['2: Bereken voor de trilling uit experiment 2.',
'de trillingstijd via formule 1 met de juiste massa.']);
Tt
disp('-----------------------');

disp(['3: Bepaal de trillingstijd zo nauwkeurig mogelijk ',
'met behulp van de meetresultaten uit de Spark.']);
Tex
disp('-----------------------');

disp('4: Vergelijk de gemeten en berekende trillingstijden met elkaar.');
disp(['Afwijking theorie / experimenteel: ', num2str(abs(Tt-Tex))]);
disp('-----------------------');

disp('5: Maak een At,t-grafiek.');
figure(1);
hold on;
scatter(tabel(:,1), tabel(:,2));
# trendline (smooth)
xspline = min(tabel(:,1)):0.1:max(tabel(:,1));
yspline = interp1(tabel(:,1), tabel(:,2), xspline, "pchip");
plot(xspline, yspline);
legend({'At (Umax)', 'Vloeiende Kromme'});
hold off;
xlabel('Tijd (s)');
ylabel('At (V)');
title ("Figure 1: At,t-grafiek");
disp('(Zie Figure 1)');
disp('-----------------------');

disp('6: Bereken log At en noteer de waarde in de derde kolom van de tabel.');
tabel = [tabel(:,1), tabel(:,2), logAmps];
disp('t[s], U[V], logU');
tabel
disp('-----------------------');

disp('7: Maak ook een logAt,t-grafiek.');
figure(2);
hold on;
scatter(tabel(:,1), tabel(:,3));
# Linear fit
fit = polyfit(tabel(:,1), tabel(:,3), 1);
plot(polyval(fit, tabel(:,1)));
legend({'logAt', 'Liniare Fit'});
xlabel('Tijd (s)');
ylabel('logAt');
title ("Figure 2: logAt,t-grafiek");
hold off;
disp('(Zie Figure 2)');
disp('-----------------------');

disp('8: Bereken de dempingfactor a.');
fit(1)
disp('-----------------------');


disp('9: Welke waarde heeft a voor een ongedempte trilling?');
disp(['Een ongedempte trilling blijft in amplitude steeds gelijk. ',
'Af te leidden uit formule 4 en met de kennis dat At overal hetzelfde is, ',
'kunnen we concluderen dat At = A0 en dus 10^(-a*t) = 1 ',
'daaruit volgt natuurlijk dat -a = 0 dus a = 0.']);
disp('-----------------------');
