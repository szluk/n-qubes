function nk = mynchoosek(n, k)
% Binomial coefficient or all combinations defined in term of the falling factorial
% INPUT:
% n   - cardinality of the set to choose from (must be an integer)
% k   - number of chosen elements (can be a vector)
% OUTPUT:
% nk  - number of ways to choose an (unordered) subset of k elements from a fixed set of n elements
% (can be a vector)
% (c) Szymon Lukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 15.06.2023

if nargin < 2
  error 'Wrong number of arguments in mynchoosek.';
end

for l=1:length(k)
  nk(l) = 1;
  for j=1:k(l)
    nk(l) = nk(l) * (n+1-j)/j;
  end
end
