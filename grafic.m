inputVoltage = 10;
frq = 1:1:100000;
r = 4700;
c = 4.7e-08;

x = frq.*(2.*pi.*r.*c);
logvar = abs(1-x.*x)./(3.*sqrt((1-x.*x).*(1-x.*x)+9.*x.*x));
gain = 20 .* log10(logvar);

plot(log10(frq), gain);

offset = atan(-3.*x./(1-x.*x));
plot(log10(frq), offset);