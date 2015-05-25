%MonteCarlo Simulation and study for Wind Farm Clutter Modeling:


function [] = clutterred(N1,M1,Vavg,Vpeak,Bladelength,lambda,Kr,Km )
%example: function [] = clutterred(3,40,1.47,2.20,3657.6, 1,100,500)
% reference from code presented in solution
%Input Variables::
%Number of Blades: N1
%Number of Scatterers: M1
%Average Rotational Speed: Vavg
%Peak Rotational Speed: Vpeak
%Length of the Blade (3657.6cm = 120 feet): Bladelength
%Transmit wavelength (in cm: 1cm for X-Band in question)lambda
%Number of Simulation: Kr
%Number of Monte Carlos per Run: Km
%--------------------------------------------------------------------------
theta = 0; % angle of blade at illumination (initialising, will be random)
alpha = 0; % turbine angle relative to radar (initialising,will be random)
%--------------------------------------------------------------------------
% Initialising loop varaibles
m = 1; % number of scatterersvariable
n = 1; % number of blades variable
r = 1; % simulation run variable
k = 1; % montecarlovariable
% Simulation calculation variables
Dr= Bladelength/M1; % Distance between scatterers(cm)
nm = N1*M1; % Total number of scatterersfor all N blades
Xf_avgA= zeros([1,nm]); % Array of Xfavgfor montecarlorun
Xf_peakA= zeros([1,nm]); % Array of Xfpeak for montecarlorun
x = 1; % Array position
perc25 = round(nm-(nm*.25)); % value equivalent to the top 25% location in array
display(perc25);
Xf_avgMA= zeros([1,Km]); % Array of Xf_avgfor all montecarloruns
Xf_peakMA= zeros([1,Km]); % Array of Xf_peakfor all montecarloruns
%-------------------------------------------------------------------------
for r = 1:Kr
for k = 1:Km
theta = rand(1)*(pi/2); % Random theta from 0-pi/2 radians (or 0-90 degrees)
alpha = rand(1)*(pi/2); % Random alpha from 0-pi/2 radians (or 0-90 degrees)
x = 1;
for n=1:N1
for m=1:M1
Vnm_avg= Vavg*m*Dr*sin(theta+(n-1)*(2*pi)/N1)*cos(alpha); % Avgvelocity equation
Vnm_peak= Vpeak*m*Dr*sin(theta+(n-1)*(2*pi)/N1)*cos(alpha); % Peak velocity equation
Xf_avg= 2*Vnm_avg/lambda; % delta function average freqspike
Xf_peak= 2*Vnm_peak/lambda; % delta function peak freqspike
Xf_avgA(1,x) = Xf_avg; % Array of Xfavgfor montecarlorun
Xf_peakA(1,x) = Xf_peak; % Array of Xfpeak for montecarlorun
x = x+1;
end
end
Xf_avgAs= sort(Xf_avgA); % Sorted Array of Xfavgfor montecarlorun
Xf_peakAs= sort(Xf_peakA); % Sorted Array of Xfpeak for montecarlorun
Xf_avgM= Xf_avgAs(perc25);
Xf_peakM= Xf_peakAs(perc25);
Xf_avgMA(1,k) = Xf_avgM; % Array of Xfavgfor all montecarloruns
Xf_peakMA(1,k) = Xf_peakM; % Array of Xfavgfor all montecarloruns
display(k); %verify montecarlorun is complete
end
Xf_avgS= mean(Xf_avgMA);
Xf_peakS= mean(Xf_peakMA);
Xf_avgSA(1,r) = Xf_avgS;
Xf_peakSA(1,r) = Xf_peakS;
Xf_avgSAC=min(Xf_avgSA);
Xf_peakSAC=min(Xf_peakSA);
display(r); %To verify run is complete
end
plot(Xf_avgSA)
hold on
plot(Xf_peakSA)
Xf_avgSAC
Xf_peakSAC
end
