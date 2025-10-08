function cbc = cbcstate(n, c, k)
% Calculate the distribution of common bit (CB) states that is n-qubit states that in the computational basis 
% have 0 <= c <= n-1 bit(s) in common in the same position(s) for the support size k
% Input: 
% n - number of qubits
% c - number of common bit(s)
% k - support size
%
% E.g. cbcstate(3, 0, 2) = 4
% There are four diagonals (k=2) in 3-cube that have the addresses of their ends
% being bitwise complements (0 bits in common)
%
% (c) Szymon Lukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 05.08.2025

fct  = mynchoosek(n, c)*2^c;
msum = 0;
for m=0:n-c
    prod = (-1)^m * mynchoosek(n-c, m) * 2^m * mynchoosek(2^(n-c-m), k);
    msum = msum + prod;
end
cbc = msum*fct;

