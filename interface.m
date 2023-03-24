function interface(resistance,capacitance)
close all;

figure('Name','Laborator Grafica',...
    'Units','normalized',...
    'Position',[0.2 0.2 0.5 0.6],...
    'NumberTitle','off','color','#38b1e9');

f = uimenu('Label','Documentatie');
     about = uimenu(f,'Label','Pagina de inceput');
     about.MenuSelectedFcn = "web('C:\Users\DORIAN\Desktop\FiltruOpresteBanda\PaginaDeInceput.html')";
f1 = uimenu(f,'Label','Circuit si Formule','Separator','on');
    f1_1=uimenu(f1,'Label','Circuit');
    f1_1.MenuSelectedFcn = "web('C:\Users\DORIAN\Desktop\FiltruOpresteBanda\FOB\FOB.html')"
    f1_2=uimenu(f1,'Label','Formule');
    f1_2.MenuSelectedFcn = "web('C:\Users\DORIAN\Desktop\FiltruOpresteBanda\FOB\Formule FOB.html')"
f1 = uimenu(f,'Label','Tabel de valori standard','Separator','on');
    f1_1=uimenu(f1,'Label','Rezistente');
    f1_1.MenuSelectedFcn = "web('C:\Users\DORIAN\Desktop\FiltruOpresteBanda\Tabele valori\Tabel valori rezistente.html')"
    f1_2=uimenu(f1,'Label','Capacitati');
    f1_2.MenuSelectedFcn = "web('C:\Users\DORIAN\Desktop\FiltruOpresteBanda\Tabele valori\Tabel valori capacitati.html')"
    Bibliografie = uimenu(f,'Label','Bibliografie','Callback','bibliografie');
    Bibliografie.MenuSelectedFcn = "web('C:\Users\DORIAN\Desktop\FiltruOpresteBanda\documentatie.html')"
     uimenu(f,'Label','Close','Callback','close',...
 'Separator','on','Accelerator','Q');

    
uicontrol('Style','edit',...
    'Units','normalized',...
    'Position',[0.17 0.9 0.1 0.05],...
    'String',resistance,...
    'Callback', @changeInputR);

uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.05 0.9 0.1 0.05],...
    'String',"Rezistanta [ohm]");

uicontrol('Style','edit',...
    'Units','normalized',...
    'Position',[0.17 0.8 0.1 0.05],...
    'String',capacitance,...
    'Callback', @changeInputC);
    
uicontrol('Style','text',...
    'Units','normalized',...
    'Position',[0.05 0.8 0.1 0.05],...
    'String',"Capacitanta [F]");

function changeInputR(src, ~)
    resistance = str2num(src.String);
    interface(resistance, capacitance)    
end

function changeInputC(src, ~)
    capacitance = str2num(src.String);
    interface(resistance, capacitance)    
end

pos = [0.1, 0.3, 0.2, 0.4];
subplot('Position', pos);

frq = 1:1:100000;

x = frq.*(2.*pi.*resistance.*capacitance);
logvar = abs(1-x.*x)./(3.*sqrt((1-x.*x).*(1-x.*x)+9.*x.*x));
gain = 20 .* log10(logvar);

plot(log10(frq), gain);
xlabel("Frecventa [Hz] (Scala logaritmica)")
ylabel("Castig [dB]")

pos = [0.35, 0.3, 0.2, 0.4];
subplot('Position', pos);

offset = atan(-3.*x./(1-x.*x));
plot(log10(frq), offset);
xlabel("Frecventa [Hz] (Scala logaritmica)")
ylabel("Unghi [grade]")
end