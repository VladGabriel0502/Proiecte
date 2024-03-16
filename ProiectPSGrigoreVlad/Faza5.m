function [ omega_p, omega_s ] = Faza5( h, Delta_p, Delta_s )
   K = 5000;
   [ H , w ] = freqz( h, 1, K );
   H_abs = abs( H );
   H_p = H_abs( H_abs >= ( 1 - Delta_p/100 ) );
   i1 = size( H_p, 1 );
   H_s = H_abs( H_abs <= Delta_s/100 );
   i2 = 5000 - size( H_s, 1 ) + 1;
   omega_p = w(i1);
   omega_s = w(i2);
   plot(w/pi,H_abs)
   dp1 = 1 - Delta_p/100;
   dp2 = 1 + Delta_p/100;
   ds = Delta_s/100;
   line( [ 0, omega_p/pi], [dp1 dp1],'Color','red' )
   line( [ 0, omega_p/pi], [dp2 dp2],'Color','red' )
   line( [ omega_p/pi, omega_p/pi], [min(H_abs) dp1],'Color','green' )
   line( [ omega_s/pi, omega_s/pi], [min(H_abs) dp1],'Color','green' )
   line( [ omega_s/pi, 1], [ds ds],'Color','red' )
end