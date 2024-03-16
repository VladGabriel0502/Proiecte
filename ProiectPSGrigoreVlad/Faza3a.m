function [ Delta_pr, Delta_sr ] = Faza3a( h, omega_p, omega_s )
    K = 5000;
    [ H , w ] = freqz( h, 1, K );
    H_abs = abs( H );
    w_p = w( w <= omega_p );
    w_s = w( w >= omega_s );
    K_p = size( w_p , 1 );
    K_s = size( w_s , 1 );
    H_p = H_abs( 1:K_p );
    H_s = H_abs( end - K_s + 1:end );
    Delta_pr = max( abs( H_p - 1 ) );
    Delta_sr = max( H_s );
end