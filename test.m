clear
clc
close all

M = 5;
A = randn(M,M)+1j*randn(M,M);
A = A*A'/2;
A = (A+A')/2;
B = randn(M,M)+1j*randn(M,M);
B = B*B'/2;
B = (B+B')/2;
C = randn(M,M)+1j*randn(M,M);
C = C*C'/2;
C = (C+C')/2;

cvx_begin sdp
variable p(2)
variable X(5,5) semidefinite hermitian
maximize(real(trace(A*X)))
subject to
real(trace(B*X))<=p(1);
real(trace(C*X))<=p(2);
sum(p)==1;
cvx_end