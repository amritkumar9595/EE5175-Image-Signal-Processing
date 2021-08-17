function [f]= filter_fun(vectorp,vectorq,sig)
vectorp
f=exp(-transpose(vectorp-vectorq)*(vectorp-vectorq)/(sig*sig));
f


 