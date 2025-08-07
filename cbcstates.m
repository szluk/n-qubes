function cbc = cbcstates(n, c)
% Calculate the distribution of common bit (CB) states that is n-qubit states that in the computational basis 
% have 0 <= c <= n-1 bit(s) in common in the same position(s) as a dunction of the support size
% Input: 
% n - number of qubits
% c - number of common bit(s)
% For c=0 returns the number of entangled states
% For c=1 returns the number of all-partition separable states
%
% E.g. cbc = cbcstates(3, 0)
% spsize =  2 3  4  5  6  7 8
% cbc    =  4 32 64 56 28 8 1
%
% (c) Szymon Lukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 05.08.2025

if nargin < 2
  error 'Wrong number of arguments in cbcstates.';
end

if c < 0 | c > n-1
  error 'c must be 0 <= c <= n-1 in cbcstates.';
end

fct = mynchoosek(n, c)*2^c;
k=2:2^(n-c);

for kk=1:length(k)
    msum = 0;
    for m=0:n-c
        prod = (-1)^m * mynchoosek(n-c, m) * 2^m * mynchoosek(2^(n-c-m), k(kk));
        msum = msum + prod;
    end
    cbc(kk) = msum*fct;
end

end
