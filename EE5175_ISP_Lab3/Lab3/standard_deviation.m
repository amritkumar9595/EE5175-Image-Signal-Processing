function [sd]=standard_deviation(N,i,j) 

A=2;
B=N*N/(2*log(200));

pow=((i-N/2)*(i-N/2)+(j-N/2)*(j-N/2))/B;

sd=A*exp(-1*pow);
