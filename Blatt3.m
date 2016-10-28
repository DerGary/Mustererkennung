%---1a---%
disp('Aufgabe 1a')
t = 1:1/128:4;

f_1 = f1(t)
f_2 = f2(t)

%plot(t,f_1)
%plot(t,f_2)

%---1b---%
disp('Aufgabe 1b')

fs = 128;
t = 0:1/fs:1;
nf = 512;

%set(gca, 'XTick', 0:8:fs/2);
%set(gca, 'XTickLabel', 0:8:fs/2);
 
windowSize = fs;
 
x = 0:1/fs:1;

%--- plot f_1 ---%
fftVector = f_1(1:windowSize);
fftResult = fft(fftVector);

fftResultAbs = abs(fftResult);
 
useableResultRange = 1:windowSize/2;
 
ResultDB = 20 * log10(fftResultAbs / (windowSize/2));
 
%plot(1:fs/windowSize:fs/2, ResultDB(useableResultRange));
%plot(1:fs/windowSize:fs/2,  fftResultAbs(useableResultRange));

%--- plot f_2 ---%
fftVector = f_2(1:windowSize);
fftResult = fft(fftVector);

fftResultAbs = abs(fftResult);
 
useableResultRange = 1:windowSize/2;
 
ResultDB = 20 * log10(fftResultAbs / (windowSize/2));
 
%plot(1:fs/windowSize:fs/2, ResultDB(useableResultRange));
%plot(1:fs/windowSize:fs/2,  fftResultAbs(useableResultRange));

%---2a---%


erwartungswert_1 = 0;
varianz_1 = 0;

erwartungswert_2 = 0;
varianz_2 = 0;

wahrscheinlichkeiten = [0.00755884677751513681	0.01105318515665493297	0.01552914585389562714	0.02096215430501338377	0.02718644859950228935	0.03387640098714970286	0.04055741546189319733	0.04665213235521837843	0.05155857994653319296	0.05474678451379861925	0.05585274379367638072	0.05474680062863296940	0.05155880295637878421	0.04665452995170378158	0.04057749029178835355	0.03400730532177234166	0.02785123566449935189	0.02359143815148195519	0.02362791025837613087	0.03048111099822337004	0.04385499069231837677	0.05777709401642099699	0.06297750499206178847	0.05471222151487304766	0.03740432347806352078	0.02004839376889902891	0.00843254167469389231	0.00280179707400135780	0.00075045459849946796	0.00017177750696501301];
muster = 1:30;
maxSize = size(wahrscheinlichkeiten,2);

errors = zeros([1 maxSize]);
minError = inf;
besterSchwellwert = -1;


set(gca, 'YTick', 0:0.01:0.07);
set(gca, 'YTickLabel', 0:0.01:0.07);
for schwellwert = muster
        daten_links = wahrscheinlichkeiten(1:schwellwert);
        daten_rechts = wahrscheinlichkeiten(schwellwert:maxSize);
        
        indizes_rechts = muster(schwellwert :maxSize);
        indizes_links = muster(1:schwellwert);

    n = size(indizes_links,2);

    erwartungswert_1 = mean(indizes_links);
    mean_links = mean(indizes_links);
    
    summe = 0;
    for index = 1:n
        summe = summe + (indizes_links(index)-mean_links)^2;
    end
    varianz_1 = sqrt((1/(n-1))*summe);

    n = size(indizes_rechts,2);

    erwartungswert_2 = mean(indizes_rechts);
    mean_rechts = mean(indizes_rechts);
    
    summe = 0;
    for index = 1:n
        summe = summe + (indizes_rechts(index)-mean_rechts)^2;
    end
    varianz_2 = sqrt((1/(n-1))*summe);

    masse_links = sum(daten_links);
    masse_rechts = sum(daten_rechts);
    gesamtmasse = sum(wahrscheinlichkeiten);

    alpha = 0;
    masse_links
    masse_rechts
    if(masse_links ~= 0)
        alpha = gesamtmasse * masse_links;
    end
    alpha
    
    approxWarscheinlichkeiten = alpha * normpdf(muster, erwartungswert_1, varianz_1) + (1-alpha)*normpdf(muster,erwartungswert_2, varianz_2);
    hold off;
    plot(muster, approxWarscheinlichkeiten);
    ylim([0 0.07]);
    hold on;
    plot(muster, wahrscheinlichkeiten);
    error = 0;
    for index = muster
        error = error + abs(wahrscheinlichkeiten(index)-approxWarscheinlichkeiten(index));
    end

    errors(schwellwert) = error;
    if error < minError
        minError = error;
        besterSchwellwert = schwellwert;
    end
end

minError
besterSchwellwert




