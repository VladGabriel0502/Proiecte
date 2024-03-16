%%% Proiect %%%
%%% Grigore Vlad-Gabriel %%%
%%% Grupa 334AB%%%

%%% ng = 2 si ns = 8

%%% Faza 1 %%%
%%% subpunctul a)
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
%%
clc
w = boxcar( M );
stem( w )
title(' Fereastra Dreptunghilara ');
grid on
ax = gca;
copygraphics(ax)

%%
% Figura 1
clc
% cele 4 ferestre fara parametrii
%t = tiledlayout(2,2); pentru a copia subploturile ca imagine si a le pune
%in document
subplot( 2, 2, 1 )
w1 = triang( M );
%nexttile
stem( w1 );
title(' Fereastra Triunghilara ');
grid on

subplot( 2, 2, 2 )
w2 = blackman( M );
%nexttile
stem( w2 );
title(' Fereastra Blackman ');
grid on

subplot( 2, 2, 3 )
w3 = hamming( M );
%nexttile
stem( w3 );
title(' Fereastra Hamming ');
grid on

subplot( 2, 2, 4 )
w4 = hanning( M );
%nexttile
stem( w4 );
title(' Fereastra Hanning ');
grid on
%copygraphics( t )

%%
% Figura 2
%t = tiledlayout( 2, 3 );
% Cebisev
subplot( 2, 3, 1 )
w11 = chebwin( M, r );
%nexttile
stem( w11 );
title( 'Fereasta Chebyshev r = ', num2str(r) );
grid on

subplot( 2, 3, 2 )
w12 = chebwin( M, r - 5 );
%nexttile
stem( w12 );
title( 'Fereasta Chebyshev r = ', num2str(r - 5) );
grid on

subplot( 2, 3, 3 )
w13 = chebwin( M, r + 5 );
%nexttile
stem( w13 );
title( 'Fereasta Chebyshev r = ', num2str(r + 5) );
grid on

%Kaiser
subplot( 2, 3, 4 )
w21 = kaiser( M, beta );
%nexttile
stem( w21 );
title( 'Fereasta Kaiser beta = ', num2str( beta ) );
grid on

subplot( 2, 3, 5 )
w22 = kaiser( M, beta - 1 );
%nexttile
stem( w22 );
title( 'Fereasta Kaiser beta = ', num2str( beta - 1 ) );
grid on

subplot( 2, 3, 6 )
w23 = kaiser( M, beta + 1 );
%nexttile
stem( w23 );
title( 'Fereasta Kaiser beta = ', num2str( beta + 1 ) );
grid on

%copygraphics( t )

%%
clc
% Figura 3
% Lanczos
lanczos = @( n, L, M ) ( ( sin( 2 * pi * ( ( 2 * n - M + 1)/( 2 * ( M - 1) ) ) )/( 2 * pi * ( ( 2 * n - M + 1)/( 2 * ( M - 1) ) ) ) ) ^ L );
%t = tiledlayout( 2, 3 );
subplot( 2, 3, 1 )
for i = 0:M - 1
    wl1( i + 1 ) = lanczos( i, L, M );
end
wl1( ( M + 1 ) / 2 ) = 1;% prelungit prin continuitate
%nexttile
stem(wl1);
title( ' Fereastra Lanczos L = ', num2str( L ) );
grid on

subplot( 2, 3, 2 )
for i = 0:M - 1
    wl2( i + 1 ) = lanczos( i, L - 1 , M );
end
wl2( ( M + 1 ) / 2 ) = 1;
%nexttile
stem(wl2);
title( ' Fereastra Lanczos L = ', num2str( L - 1 ) );
grid on

subplot( 2, 3, 3 )
for i = 0:M - 1
    wl3( i + 1 ) = lanczos( i, L + 1 , M );
end
wl3( ( M + 1 ) / 2 ) = 1;
%nexttile
stem(wl3);
title( ' Fereastra Lanczos L = ', num2str( L + 1 ) );
grid on

% Tukey
subplot( 2, 3 , 4 )
wt1 = tukeywin( M, alfa/100 );
%nexttile
stem(wt1);
title( ' Fereasta Tukey alfa = ', num2str(alfa) );
grid on;

subplot( 2, 3 , 5 )
wt2 = tukeywin( M, (alfa - 15)/100 );
%nexttile
stem(wt2);
title( ' Fereasta Tukey alfa = ', num2str(alfa - 15) );
grid on;

subplot( 2, 3 , 6 )
wt3 = tukeywin( M, (alfa + 15)/100 );
%nexttile
stem(wt3);
title( ' Fereasta Tukey alfa = ', num2str(alfa + 15) );
grid on;

%copygraphics(t)
%%
%%% subpunctul b)
clear, clc
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );

% Fereastra Dreptunghiulara
N = 5000;
omega = linspace( 0, pi, N )/pi;
w = boxcar( M );
w = w / sum( w );
W = freqz( w, 1, omega );
W = 20 * log10( abs( W ) );
plot( omega, W );
title(' Spectru Freastra Dretunghiulara ');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on
ax = gca;
copygraphics(ax)

%%
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
N = 5000;

% cele 4 ferestre fara parametrii
%t = tiledlayout(2,2);

subplot( 2, 2, 1 )
omega = linspace( 0, pi, N )/pi;
w1 = triang( M );
w1 = w1 / sum( w1 );
W1 = freqz( w1, 1, omega );
W1 = 20 * log10( abs( W1 ) );
%nexttile
plot( omega, W1 );
title(' Spectru Freastra Triunghiulara ');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

subplot( 2, 2, 2 )
omega = linspace( 0, pi, N )/pi;
w2 = blackman( M );
w2 = w2/ sum( w2 );
W2 = freqz( w2, 1, omega );
W2 = 20 * log10( abs( W2 ) );
%nexttile
plot( omega, W2 );
title(' Spectru Freastra Blackman ');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

subplot( 2, 2, 3 )
omega = linspace( 0, pi, N )/pi;
w3 = hamming( M );
w3 = w3 / sum( w3 );
W3 = freqz( w3, 1, omega );
W3 = 20 * log10( abs( W3 ) );
%nexttile
plot( omega, W3 );
title(' Spectru Freastra Hamming ');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

subplot( 2, 2, 4 )
omega = linspace( 0, pi, N )/pi;
w4 = hanning( M );
w4 = w4 / sum( w4 );
W4 = freqz( w4, 1, omega );
W4 = 20 * log10( abs( W4 ) );
%nexttile
plot( omega, W4 );
title(' Spectru Freastra Hanning ');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%copygraphics( t )
%%
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
N = 5000;


% Figura 2
%t = tiledlayout( 2, 3 );
% Cebisev
subplot( 2, 3, 1 )
omega = linspace( 0, pi, N )/pi;
w11 = chebwin( M, r );
w11 = w11 / sum( w11 );
W11 = freqz( w11, 1, omega );
W11 = 20 * log10( abs( W11 ) );
%nexttile
plot( omega, W11 );
title(' Freastra Chebyshev r =  ', num2str(r));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

subplot( 2, 3, 2 )
omega = linspace( 0, pi, N )/pi;
w12 = chebwin( M, r - 5 );
w12 = w12 / sum( w12 );
W12 = freqz( w12, 1, omega );
W12 = 20 * log10( abs( W12 ) );
%nexttile
plot( omega, W12 );
title(' Freastra Chebyshev r =  ', num2str(r - 5) );
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

subplot( 2, 3, 3 )
omega = linspace( 0, pi, N )/pi;
w11 = chebwin( M, r + 5 );
w11 = w11 / sum( w11 );
W11 = freqz( w11, 1, omega );
W11 = 20 * log10( abs( W11 ) );
%nexttile
plot( omega, W11 );
title(' Freastra Chebyshev r =  ', num2str(r + 5));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%Kaiser
subplot( 2, 3, 4 )
omega = linspace( 0, pi, N )/pi;
w21 = kaiser( M, beta );
w21 = w21 / sum( w21 );
W21 = freqz( w21, 1, omega );
W21 = 20 * log10( abs( W21 ) );
%nexttile
plot( omega, W21 );
title(' Freastra Kaiser beta =  ', num2str(beta));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

subplot( 2, 3, 5 )
omega = linspace( 0, pi, N )/pi;
w21 = kaiser( M, beta - 1 );
w21 = w21 / sum( w21 );
W21 = freqz( w21, 1, omega );
W21 = 20 * log10( abs( W21 ) );
%nexttile
plot( omega, W21 );
title(' Freastra Kaiser beta =  ', num2str(beta - 1));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

subplot( 2, 3, 6 )
omega = linspace( 0, pi, N )/pi;
w31 = kaiser( M, beta + 1 );
w31 = w31 / sum( w31 );
W31 = freqz( w31, 1, omega );
W31 = 20 * log10( abs( W31 ) );
%nexttile
plot( omega, W31 );
title(' Freastra Kaiser beta =  ', num2str(beta + 1));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%copygraphics( t )

%%
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
N = 5000;

lanczos = @( n, L, M ) ( ( sin( 2 * pi * ( ( 2 * n - M + 1)/( 2 * ( M - 1) ) ) )/( 2 * pi * ( ( 2 * n - M + 1)/( 2 * ( M - 1) ) ) ) ) ^ L );

% Figura 3
t = tiledlayout( 2, 3 );
% Cebisev
%subplot( 2, 3, 1 )
omega = linspace( 0, pi, N )/pi;
for i = 0:M - 1
    w11( i + 1 ) = lanczos( i, L, M );
end
w11( ( M + 1 ) / 2 ) = 1;% prelungit prin continuitate
w11 = w11 / sum( w11 );
W11 = freqz( w11, 1, omega );
W11 = 20 * log10( abs( W11 ) );
nexttile
plot( omega, W11 );
title(' Freastra Lanczos L =  ', num2str(L));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%subplot( 2, 3, 2 )
omega = linspace( 0, pi, N )/pi;
for i = 0:M - 1
    w12( i + 1 ) = lanczos( i, L - 1, M );
end
w12( ( M + 1 ) / 2 ) = 1;% prelungit prin continuitate
w12 = w12 / sum( w12 );
W12 = freqz( w12, 1, omega );
W12 = 20 * log10( abs( W12 ) );
nexttile
plot( omega, W12 );
title(' Freastra Lanczos L =  ', num2str(L - 1));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%subplot( 2, 3, 3 )
omega = linspace( 0, pi, N )/pi;
for i = 0:M - 1
    w13( i + 1 ) = lanczos( i, L + 1, M );
end
w13( ( M + 1 ) / 2 ) = 1;% prelungit prin continuitate
w13 = w13 / sum( w13 );
W13 = freqz( w13, 1, omega );
W13 = 20 * log10( abs( W13 ) );
nexttile
plot( omega, W13 );
title(' Freastra Lanczos L =  ', num2str(L + 1));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%Kaiser
%subplot( 2, 3, 4 )
omega = linspace( 0, pi, N )/pi;
w21 = tukeywin( M, alfa/100 );
w21 = w21 / sum( w21 );
W21 = freqz( w21, 1, omega );
W21 = 20 * log10( abs( W21 ) );
nexttile
plot( omega, W21 );
title(' Freastra Tukey alfa =  ', num2str(alfa));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%subplot( 2, 3, 5 )
omega = linspace( 0, pi, N )/pi;
w22 = tukeywin( M, (alfa - 15)/100 );
w22 = w22 / sum( w22 );
W22 = freqz( w22, 1, omega );
W22 = 20 * log10( abs( W22 ) );
nexttile
plot( omega, W22 );
title(' Freastra Tukey alfa =  ', num2str(alfa - 15));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%subplot( 2, 3, 6 )
omega = linspace( 0, pi, N )/pi;
w31 = tukeywin( M, (alfa + 15)/100 );
w31 = w31 / sum( w31 );
W31 = freqz( w31, 1, omega );
W31 = 20 * log10( abs( W31 ) );
nexttile
plot( omega, W31 );
title(' Freastra Tukey alfa =  ', num2str(alfa + 15));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

copygraphics( t )
%%
%%% Faza 2 %%%
%%% subpunctul a)
% Figura 8
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
omega_c = PS_PRJ_1_Faza_2a( 2, 8 );
K = 5000;
freq_c = omega_c/pi;

%t = tiledlayout( 5, 1 );
subplot( 5, 1, 1 );
w1 = boxcar( M );
h1 = fir1( M - 1, freq_c, w1 );
%nexttile
stem( h1 )
title(' Fereastra Dreptunghiulara ');
grid on

subplot( 5, 1, 2 );
w2 = triang( M );
h2 = fir1( M - 1, freq_c, w2 );
%nexttile
stem( h2 )
title(' Fereastra Triunghiulara ');
grid on

subplot( 5, 1, 3 );
w3 = blackman( M );
h3 = fir1( M - 1, freq_c, w3 );
%nexttile
stem( h3 )
title(' Fereastra Blackman ');
grid on

subplot( 5, 1, 4 );
h4 = fir1( M - 1, freq_c );
%nexttile
stem( h4 )
title(' Fereastra Hamming ');
grid on

subplot( 5, 1, 5 );
w5 = hanning( M );
h5 = fir1( M - 1, freq_c, w5 );
%nexttile
stem( h5 )
title(' Fereastra Hanning ');
grid on

%copygraphics( t )
%%
% Figura 9
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
omega_c = PS_PRJ_1_Faza_2a( 2, 8 );
K = 5000;
freq_c = omega_c/pi;

t = tiledlayout( 2,3 )
w11 = chebwin( M, r );
h1 = fir1( M - 1, freq_c, w11 );
nexttile
stem( h1 )
title( 'Fereasta Chebyshev r = ', num2str(r) );
grid on

w12 = chebwin( M, r - 5 );
h2 = fir1( M - 1, freq_c, w12 );
nexttile
stem( h2 )
title( 'Fereasta Chebyshev r = ', num2str(r - 5) );
grid on

w13 = chebwin( M, r + 5 );
h3 = fir1( M - 1, freq_c, w13 );
nexttile
stem( h3 )
title( 'Fereasta Chebyshev r = ', num2str(r + 5) );
grid on

w21 = kaiser( M, beta );
h4 = fir1( M - 1, freq_c, w21 );
nexttile
stem( h4 )
title( 'Fereasta Kaiser beta = ', num2str( beta ) );
grid on

w22 = kaiser( M, beta - 1 );
h5 = fir1( M - 1, freq_c, w22 );
nexttile
stem( h5 )
title( 'Fereasta Kaiser beta = ', num2str( beta - 1 ) );
grid on

w23 = kaiser( M, beta + 1 );
h6 = fir1( M - 1, freq_c, w23 );
nexttile
stem( h6 )
title( 'Fereasta Kaiser beta = ', num2str( beta + 1 ) );
grid on

copygraphics( t )
%%
% Figura 10
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
omega_c = PS_PRJ_1_Faza_2a( 2, 8 );
K = 5000;
freq_c = omega_c/pi;

t = tiledlayout( 2,3 )
lanczos = @( n, L, M ) ( ( sin( 2 * pi * ( ( 2 * n - M + 1)/( 2 * ( M - 1) ) ) )/( 2 * pi * ( ( 2 * n - M + 1)/( 2 * ( M - 1) ) ) ) ) ^ L );

for i = 0:M - 1
    w11( i + 1 ) = lanczos( i, L, M );
end
w11( ( M + 1 ) / 2 ) = 1;% prelungit prin continuitate
h11 = fir1( M - 1, freq_c, w11 );
nexttile
stem(h11);
title( ' Fereastra Lanczos L = ', num2str( L ) );
grid on

for i = 0:M - 1
    w12( i + 1 ) = lanczos( i, L - 1, M );
end
w12( ( M + 1 ) / 2 ) = 1;% prelungit prin continuitate
h12 = fir1( M - 1, freq_c, w12 );
nexttile
stem(h12);
title( ' Fereastra Lanczos L = ', num2str( L - 1 ) );
grid on

for i = 0:M - 1
    w13( i + 1 ) = lanczos( i, L + 1, M );
end
w13( ( M + 1 ) / 2 ) = 1;% prelungit prin continuitate
h13 = fir1( M - 1, freq_c, w13 );
nexttile
stem(h13);
title( ' Fereastra Lanczos L = ', num2str( L + 1 ) );
grid on

w21 = tukeywin( M, alfa/100 );
h21 = fir1( M - 1, freq_c, w21 );
nexttile
stem(h21);
title( ' Fereasta Tukey alfa = ', num2str(alfa) );
grid on;

w22 = tukeywin( M, (alfa - 15)/100 );
h22 = fir1( M - 1, freq_c, w22 );
nexttile
stem(h22);
title( ' Fereasta Tukey alfa = ', num2str(alfa - 15) );
grid on;

w23 = tukeywin( M, (alfa + 15)/100 );
h23 = fir1( M - 1, freq_c, w23 );
nexttile
stem(h23);
title( ' Fereasta Tukey alfa = ', num2str(alfa + 15) );
grid on;

copygraphics(t)
%%
% Figura 11
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
omega_c = PS_PRJ_1_Faza_2a( 2, 8 );
K = 5000;
freq_c = omega_c/pi;

t = tiledlayout( 2,5 );

omega = linspace( 0, pi, K )/pi;
w1 = boxcar( M );
h1 = fir1( M - 1, freq_c, w1 );
h1 = h1 / sum( h1 );
H1 = freqz( h1, 1, omega * pi );
ang1 = angle( H1 );
H1 = 20 * log10( abs( H1 ) );
nexttile
plot( omega, H1 );
title(' Dretunghiulara ');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

w2 = triang( M );
h2 = fir1( M - 1, freq_c, w2 );
h2 = h2 / sum( h2 );
H2 = freqz( h2, 1, omega * pi );
ang2 = angle( H2 );
H2 = 20 * log10( abs( H2 ) );
nexttile
plot( omega, H2 );
title(' Triunghiulara ');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

w3 = blackman( M );
h3 = fir1( M - 1, freq_c, w3 );
h3 = h3 / sum( h3 );
H3 = freqz( h3, 1, omega * pi );
ang3 = angle( H3 );
H3 = 20 * log10( abs( H3 ) );
nexttile
plot( omega, H3 );
title(' Blackman ');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

h4 = fir1( M - 1, freq_c );
h4 = h4 / sum( h4 );
H4 = freqz( h4, 1, omega *pi );
ang4 = angle( H4 );
H4 = 20 * log10( abs( H4 ) );
nexttile
plot( omega, H4 );
title(' Hamming ');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

w5 = hanning( M );
h5 = fir1( M - 1, freq_c, w5 );
h5 = h5 / sum( h5 );
H5 = freqz( h5, 1, omega * pi );
ang5 = angle( H5 );
H5 = 20 * log10( abs( H5 ) );
nexttile
plot( omega, H5 );
title(' Hanning ');
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang1 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang2 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang3 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang4 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang5 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

copygraphics(t)
%%
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
omega_c = PS_PRJ_1_Faza_2a( 2, 8 );
K = 5000;
freq_c = omega_c/pi;

t = tiledlayout( 3,4 );
%Chebysev spectru r
omega = linspace( 0, pi, K )/pi;
w11 = chebwin( M, r );
h11 = fir1( M - 1, freq_c, w11 );
h11 = h11 / sum( h11 );
H11 = freqz( h11, 1, omega * pi );
ang12 = angle( H11 );
H11 = 20 * log10( abs( H11 ) );
nexttile
plot( omega, H11 );
title(' Cebisev r =  ', num2str(r));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang12 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%Kaiser spectru
w13 = kaiser( M, beta );
h13 = fir1( M - 1, freq_c, w13 );
h13 = h13 / sum( h13 );
H13 = freqz( h13, 1, omega * pi );
ang14 = angle( H13 );
H13 = 20 * log10( abs( H13 ) );
nexttile
plot( omega, H13 );
title(' Kaiser beta = ', num2str(beta));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang14 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%Chebyshev
w21 = chebwin( M, r - 5 );
h21 = fir1( M - 1, freq_c, w21 );
h21 = h21 / sum( h21 );
H21 = freqz( h21, 1, omega * pi );
ang22 = angle( H21 );
H21 = 20 * log10( abs( H21 ) );
nexttile
plot( omega, H21 );
title(' Cebisev r =  ', num2str(r - 5));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang22 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%Kaiser spectru
w23 = kaiser( M, beta - 1 );
h23 = fir1( M - 1, freq_c, w23 );
h23 = h23 / sum( h23 );
H23 = freqz( h23, 1, omega * pi );
ang24 = angle( H23 );
H23 = 20 * log10( abs( H23 ) );
nexttile
plot( omega, H23 );
title(' Kaiser beta = ', num2str(beta - 1));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang24 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%Chebyshev
w31 = chebwin( M, r + 5 );
h31 = fir1( M - 1, freq_c, w31 );
h31 = h31 / sum( h31 );
H31 = freqz( h31, 1, omega * pi );
ang32 = angle( H31 );
H31 = 20 * log10( abs( H31 ) );
nexttile
plot( omega, H31 );
title(' Cebisev r =  ', num2str(r + 5));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang32 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%Kaiser spectru
w33 = kaiser( M, beta + 1 );
h33 = fir1( M - 1, freq_c, w33 );
h33 = h33 / sum( h33 );
H33 = freqz( h33, 1, omega * pi );
ang34 = angle( H33 );
H33 = 20 * log10( abs( H33 ) );
nexttile
plot( omega, H33 );
title(' Kaiser beta = ', num2str(beta + 1));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang34 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

copygraphics(t)
%%
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
omega_c = PS_PRJ_1_Faza_2a( 2, 8 );
K = 5000;
freq_c = omega_c/pi;

t = tiledlayout( 3,4 );
lanczos = @( n, L, M ) ( ( sin( 2 * pi * ( ( 2 * n - M + 1)/( 2 * ( M - 1) ) ) )/( 2 * pi * ( ( 2 * n - M + 1)/( 2 * ( M - 1) ) ) ) ) ^ L );

%Lanczos spectru L
omega = linspace( 0, pi, K )/pi;

for i = 0:M - 1
    w11( i + 1 ) = lanczos( i, L, M );
end
w11( ( M + 1 ) / 2 ) = 1;% prelungit prin continuitate
h11 = fir1( M - 1, freq_c, w11 );
h11 = h11 / sum( h11 );
H11 = freqz( h11, 1, omega * pi );
ang12 = angle( H11 );
H11 = 20 * log10( abs( H11 ) );
nexttile
plot( omega, H11 );
title(' Lanczos L =  ', num2str(L));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang12 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%Tukey spectru
w13 = tukeywin( M, alfa/100 );
h13 = fir1( M - 1, freq_c, w13 );
h13 = h13 / sum( h13 );
H13 = freqz( h13, 1, omega * pi );
ang14 = angle( H13 );
H13 = 20 * log10( abs( H13 ) );
nexttile
plot( omega, H13 );
title(' Tukey alfa = ', num2str(alfa));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang14 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%Lanczos spectru L

for i = 0:M - 1
    w21( i + 1 ) = lanczos( i, L - 1, M );
end
w21( ( M + 1 ) / 2 ) = 1;% prelungit prin continuitate
h21 = fir1( M - 1, freq_c, w21 );
h21 = h21 / sum( h21 );
H21 = freqz( h21, 1, omega * pi );
ang22 = angle( H21 );
H21 = 20 * log10( abs( H21 ) );
nexttile
plot( omega, H21 );
title(' Lanczos L =  ', num2str(L - 1));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang22 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%Tukey spectru
w23 = tukeywin( M, ( alfa - 15 )/100 );
h23 = fir1( M - 1, freq_c, w23 );
h23 = h23 / sum( h23 );
H23 = freqz( h23, 1, omega * pi );
ang24 = angle( H23 );
H23 = 20 * log10( abs( H23 ) );
nexttile
plot( omega, H23 );
title(' Tukey alfa = ', num2str(alfa - 15));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang24 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%Lanczos spectru L

for i = 0:M - 1
    w31( i + 1 ) = lanczos( i, L + 1, M );
end
w31( ( M + 1 ) / 2 ) = 1;% prelungit prin continuitate
h31 = fir1( M - 1, freq_c, w31 );
h31 = h31 / sum( h31 );
H31 = freqz( h31, 1, omega * pi );
ang32 = angle( H31 );
H31 = 20 * log10( abs( H31 ) );
nexttile
plot( omega, H31 );
title(' Lanczos L =  ', num2str(L + 1));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang32 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

%Tukey spectru
w33 = tukeywin( M, ( alfa + 15 )/100 );
h33 = fir1( M - 1, freq_c, w23 );
h33 = h33 / sum( h33 );
H33 = freqz( h33, 1, omega * pi );
ang34 = angle( H33 );
H33 = 20 * log10( abs( H33 ) );
nexttile
plot( omega, H33 );
title(' Tukey alfa = ', num2str(alfa + 15));
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang34 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

copygraphics(t);
%%
% subpunctul b)
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
omega_c = PS_PRJ_1_Faza_2a( 2, 8 );
freq_c = omega_c/pi;
K = 5000;
omega = linspace( 0, pi, K )/pi;

t = tiledlayout( 2, 3 );
%Kaiser
w11 = kaiser( M, beta + 1 );
h11 = fir1( M - 1, freq_c, w11 );
h11 = h11 / sum( h11 );
H11 = freqz( h11, 1, omega * pi );
ang11 = angle( H11 );
H11 = 20 * log10( abs( H11 ) );
nexttile
plot( omega, H11 );
title('Kaiser b+1 M');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

w12 = kaiser( M + floor(M/2), beta + 1 );
h12 = fir1( M + floor(M/2) - 1, freq_c, w12 );
h12 = h12 / sum( h12 );
H12 = freqz( h12, 1, omega * pi );
ang21 = angle( H12 );
H12 = 20 * log10( abs( H12 ) );
nexttile
plot( omega, H12 );
title('Kaiser b+1 M+[M/2]');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

w13 =kaiser( 2 * M, beta + 1 );
h13 = fir1( 2 * M - 1, freq_c, w13 );
h13 = h13 / sum( h13 );
H13 = freqz( h13, 1, omega * pi );
ang31 = angle( H13 );
H13 = 20 * log10( abs( H13 ) );
nexttile
plot( omega, H13 );
title(' Kaiser b+1 2 * M');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang11 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang21 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang31 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

copygraphics(t);
%%
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
omega_c = PS_PRJ_1_Faza_2a( 2, 8 );
freq_c = omega_c/pi;
K = 5000;
omega = linspace( 0, pi, K )/pi;

t = tiledlayout( 2, 3 );
%Dreptunghiulara
w11 = boxcar( M );
h11 = fir1( M - 1, freq_c, w11 );
h11 = h11 / sum( h11 );
H11 = freqz( h11, 1, omega * pi );
ang11 = angle( H11 );
H11 = 20 * log10( abs( H11 ) );
nexttile
plot( omega, H11 );
title('Dreptunghiulara M');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

w12 = boxcar( M + floor(M/2) );
h12 = fir1( M + floor(M/2) - 1, freq_c, w12 );
h12 = h12 / sum( h12 );
H12 = freqz( h12, 1, omega * pi );
ang21 = angle( H12 );
H12 = 20 * log10( abs( H12 ) );
nexttile
plot( omega, H12 );
title('Dreptunghiulara M + [M/2]');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

w13 =boxcar( 2 * M );
h13 = fir1( 2 * M - 1, freq_c, w13 );
h13 = h13 / sum( h13 );
H13 = freqz( h13, 1, omega * pi );
ang31 = angle( H13 );
H13 = 20 * log10( abs( H13 ) );
nexttile
plot( omega, H13 );
title('Dreptunghiulara 2*M');
ylabel( ' | W | [dB] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang11 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang21 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

nexttile
plot( omega, ang31 );
ylabel( ' angle [rad] ' );
xlabel( ' Omega [ rad/s ] ' );
grid on

copygraphics(t);
%%
%%% Faza 3 %%%
%%% subpunctul b)
clc, clear
[omega_p,omega_s,Delta_p] = PS_PRJ_1_Faza_3b( 2, 8 );
save( 'faza3.mat', 'omega_p', 'omega_s', 'Delta_p' );

%%
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
load faza3.mat
Delta_s = Delta_p;
w = [ 0.25 0.5 0.75 ];
M_val = [ M M + floor(M/2) 2 * M ];% vector cu valoriile lui M
omega_c = ( 1 - w ) * omega_p + w * omega_s;
l = 1; 

for i = 1:3 % parcurgem M_val
    for j = 1:3 % parcuegem omega_c
        w = kaiser( M_val(i), beta + 1 ); % proiectam
        h = fir1( M_val(i) - 1, omega_c(j) / pi, w );
        h = h / sum( h );
        [ Delta_pr( i, j ), Delta_sr( i, j ) ] = Faza3a( h, omega_p, omega_s );
    end
end
Delta_pr
Delta_sr
Delta_pr + Delta_sr

data(1).M = M_val(3)% conform clasificarii le punem intr-o structura pentru a putea apela in for 
data(1).wc = omega_c(2)

data(2).M = M_val(2)
data(2).wc = omega_c(2)

data(3).M = M_val(3)
data(3).wc = omega_c(3)

data(4).M = M_val(3)
data(4).wc = omega_c(1)

data(5).M = M_val(2)
data(5).wc = omega_c(3)

data(6).M = M_val(2)
data(6).wc = omega_c(1)

data(7).M = M_val(1)
data(7).wc = omega_c(2)

data(8).M = M_val(1)
data(8).wc = omega_c(3)

data(9).M = M_val(1)
data(9).wc = omega_c(1)


t = tiledlayout( 3, 3 )
for i = 1:9
    w = kaiser( data(i).M, beta + 1 ); % proiectam
    h = fir1( data(i).M - 1, data(i).wc / pi, w );
    h = h / sum( h );
    [ Delta_pr, Delta_sr ] = Faza3a( h, omega_p, omega_s );
    nexttile
    stem( h );
    title( ['Kaiser wc = ' num2str(data(i).wc)] );
    ylabel( [ 'M = ', num2str( data(i).M ) ] );
    xlabel( [ 'dp = ' num2str(Delta_pr) ' ds = ' num2str(Delta_sr) ] )
end

copygraphics( t )
%%
K = 5000;
t = tiledlayout( 3, 3 )
for i = 1:9
    w = kaiser( data(i).M, beta + 1 ); % proiectam
    h = fir1( data(i).M - 1, data(i).wc / pi, w );
    [ Delta_pr, Delta_sr ] = Faza3a( h, omega_p, omega_s );
    h = h / sum( h );
    [ H, w ] = freqz( h, 1, K );
    H = 20*log10(abs(H));
    nexttile
    hold on
    plot( w/pi, H )
    dp1 = 20*log10( 1 - Delta_p/100 );
    dp2 = 20*log10( 1 + Delta_p/100 );
    ds = 20*log10( Delta_s/100 );
    line( [ 0, omega_p/pi], [dp1 dp1],'Color','red' )
    line( [ 0, omega_p/pi], [dp2 dp2],'Color','red' )
    line( [ omega_p/pi, omega_p/pi], [min(H) dp1],'Color','green' )
    line( [ omega_s/pi, omega_s/pi], [min(H) dp1],'Color','green' )
    line( [ omega_s/pi, 1], [ds ds],'Color','red' )
    title( ['Kaiser wc = ' num2str(data(i).wc)] );
    ylabel( [ 'M = ', num2str( data(i).M ) ] );
    xlabel( [ 'dp = ' num2str(Delta_pr) ' ds = ' num2str(Delta_sr) ] )
    hold off
end
copygraphics(t)
%%
t = tiledlayout( 3, 3 )
for i = 1:9
    w = kaiser( data(i).M, beta + 1 ); % proiectam
    h = fir1( data(i).M - 1, data(i).wc / pi, w );
    [ Delta_pr, Delta_sr ] = Faza3a( h, omega_p, omega_s );
    h = h / sum( h );
    [ H, w ] = freqz( h, 1, K );
    ang = angle(H);
    nexttile
    hold on
    plot( w/pi, ang )
    title( ['Kaiser wc = ' num2str(data(i).wc)] );
    ylabel( [ 'M = ', num2str( data(i).M ) ] );
    xlabel( [ 'dp = ' num2str(Delta_pr) ' ds = ' num2str(Delta_sr) ] )
    hold off
end
copygraphics(t)
%%
%%% Faza 4 %%%
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
load faza3.mat
Delta_s = Delta_p;
w = linspace( 0.1, 0.9, 100);% am variat de mai multe ori si cu cat se apropie fie de omega_p sau omega_s creste
omega_c = ( 1 -  w ) * omega_p + w * omega_s;
%m = 2;

for i = 1:size( w, 2 ) % parcurge toate omega_c urile posibile
    m = 3; % intializam cu 3 pentru ca la 2 da eroare functia fir1 pentru fereastra hamming
    Delta_pr = 1; % ca sa intram in while
    Delta_sr = 1;
    while( Delta_pr > Delta_p/100 || Delta_sr > Delta_s/100 )
        win = kaiser( m, beta - 1 );
        %display(['iteratia ', num2str(i)])
        h = fir1( m - 1, omega_c(i) / pi, win );
        h = h / sum( h );
        [ Delta_pr, Delta_sr ] = Faza3a( h, omega_p, omega_s ); % calculam pana gasim sa respecte criteriul de performanta
        m = m + 1;
    end
    m_val( i ) = m;% salvam toti parametrii necesari gasirii filtrului ideal pentru a-i putea minimkza dupa
    dp( i ) = abs( Delta_pr + Delta_sr );
    ds( i ) = abs( Delta_pr - Delta_sr );err( i ) = norma_ideal(  h, omega_p, omega_s );
    
end
Val = [ m_val; dp; ds; err ];% creeam o matrice cu toate elementele
weights = [ 0.1 0.2 0.2 0.50 ];
Val_n = weights * Val;% vector cu elementele de cost
[ fil_min, index ] = min( Val_n )% luam minimul
Val(:,index)
%%
clear, clc
load Gold.mat
load Silver.mat 
load Bronze.mat
index = 51;
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
load faza3.mat
Delta_s = Delta_p;
w = linspace( 0.1, 0.9, 100);
omega_c = ( 1 -  w ) * omega_p + w * omega_s;
K = 5000;

wc = omega_c(index);
freq_c = wc/pi;

M = [ fil1(1) fil2(1) fil3(1) ];

t = tiledlayout( 3, 3 );

for i = 1:3
    win = kaiser( M(i), beta - 1 );
    h = fir1( M(i) - 1, freq_c, win );
    h = h / sum( h );
    [ H, omega ] = freqz( h, 1, K );
    H = 20*log10(abs(H));
    nexttile
    hold on
    plot( omega/pi, H )
    dp1 = 20*log10( 1 - Delta_p/100 );
    dp2 = 20*log10( 1 + Delta_p/100 );
    ds = 20*log10( Delta_s/100 );
    line( [ 0, omega_p/pi], [dp1 dp1],'Color','red' )
    line( [ 0, omega_p/pi], [dp2 dp2],'Color','red' )
    line( [ omega_p/pi, omega_p/pi], [min(H) dp1],'Color','green' )
    line( [ omega_s/pi, omega_s/pi], [min(H) dp1],'Color','green' )
    line( [ omega_s/pi, 1], [ds ds],'Color','red' )
    title( ['Fereastra de pe locul = ' num2str( i )] );
    ylabel( [ 'M = ', num2str( M(i) ) ] );
    hold off
end

for i = 1:3
    win = kaiser( M(i), beta - 1 );
    h = fir1( M(i) - 1, freq_c, win );
    h = h / sum( h );
    [ H, omega ] = freqz( h, 1, K );
    ang = angle( H );
    nexttile
    plot( omega/pi, ang )
    ylabel( 'Angle [ rad ]');
    xlabel( ' omega [ rad/s ] ' )
end

for i = 1:3
    win = kaiser( M(i), beta - 1 );
    h = fir1( M(i) - 1, freq_c, win );
    h = h / sum( h );
    nexttile
    stem( h );
    ylabel( [ 'M = ' num2str( M(i) ) ] );
    xlabel( ' Timp ( s ) ' );
end

copygraphics( t );
%%
% salvare date pentru concurs
clc, clear
load Gold.mat
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
M = fil1(1)
index = 51;

load faza3.mat
Delta_s = Delta_p;
w = linspace( 0.1, 0.9, 100);
omega_c1 = ( 1 -  w ) * omega_p + w * omega_s;

omega_c = omega_c1(index);
freq_c = omega_c/pi;


win = kaiser( M, beta - 1 );
h = fir1( M - 1, freq_c, win );
h = h / sum( h );
save GRIGORE_Vlad_F#4 h omega_p omega_c omega_s Delta_p Delta_s
%%
%%% Faza 5 %%%
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
load faza3.mat
Delta_s = Delta_p;

w = linspace( 0.1, 0.9, 100)




for i = 1:size( w, 2 )
 m = 6;
 Delta_pr = 1;
 Delta_sr = 1;
 omega_c = 1/2;
 err  = 1; % elementul ce denota lungimea benzii de trecere
 
 while( Delta_pr > Delta_p/100 || Delta_sr > Delta_s/100 || err > w(i) )
        win = kaiser( m, beta - 1 );
        %display(['iteratia ', num2str(i)])
        h = fir1( m - 1, omega_c , win );
        h = h / sum( h );
        [ omega_p, omega_s ] = Faza5( h, Delta_p, Delta_s );
        [ Delta_pr, Delta_sr ] = Faza3a( h, omega_p, omega_s ); % calculam pana gasim sa respecte criteriul de performanta
        err = omega_s - omega_p;
        m = m + 1;
 end
 dp( i ) = abs( Delta_pr + Delta_sr );
 ds( i ) = abs( Delta_pr - Delta_sr );
 M_val(i) = m;
 err1( i ) = norma_ideal(  h, omega_p, omega_s );
end
%%
Val = [ M_val; dp; ds; err1 ];% creeam o matrice cu toate elementele
weights = [ 5 5000 5000 650 ];
Val_n = weights * Val;% vector cu elementele de cost
[ fil_min, index ] = min( Val_n );% luam minimul
Val(:,index);
M = Val(1,index)
save F5.mat M omega_p omega_c omega_s Delta_p Delta_s
%%
clc, clear

K = 5000;
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
load faza3.mat
load F5.mat
Delta_s = Delta_p;
t = tiledlayout( 1, 3 )

win = kaiser( M, beta - 1 );
    h = fir1( M - 1, 1/2, win );
    h = h / sum( h );
    [ H, omega ] = freqz( h, 1, K );
    ang = angle(H);
    H = 20*log10(abs(H));
    nexttile
    hold on
    plot( omega/pi, H )
    dp1 = 20*log10( 1 - Delta_p/100 );
    dp2 = 20*log10( 1 + Delta_p/100 );
    ds = 20*log10( Delta_s/100 );
    line( [ 0, omega_p/pi], [dp1 dp1],'Color','red' )
    line( [ 0, omega_p/pi], [dp2 dp2],'Color','red' )
    line( [ omega_p/pi, omega_p/pi], [min(H) dp1],'Color','green' )
    line( [ omega_s/pi, omega_s/pi], [min(H) dp1],'Color','green' )
    line( [ omega_s/pi, 1], [ds ds],'Color','red' )
    title( ' Spectru ' );
    ylabel( [ 'M = ', num2str( M ) ] );
    xlabel( ' omega [ rad ] ')
    hold off

    nexttile
    plot( omega/pi, ang )
    title( ' Faza ' );
    ylabel( [ 'M = ', num2str( M ) ] );
    xlabel( ' omega [ rad ] ')

    nexttile 
    stem(h)
    title( ' Functia Pondere ' );
    ylabel( [ 'M = ', num2str( M ) ] );
    xlabel( ' Timp [ s ] ')

    copygraphics(t)
%%
clc, clear
[M,r,beta,L,alfa] = PS_PRJ_1_Faza_1( 2, 8 );
load F5.mat
win = kaiser( M, beta - 1 );
h = fir1( M - 1, 1/2, win );
h = h / sum( h );
save GRIGORE_Vlad_F#5 h omega_p omega_c omega_s Delta_p Delta_s










