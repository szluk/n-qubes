clear all

% val is the number of ways one can pick 2 <= k <= 2^(n-c) bitstrings from a set of all 2^n bitstrings
% so that each of them has only 0 <= c <= n-1 common bit(s) in the same position

n=5

for c=0:n-1
    fct = mynchoosek(n, c)*2^c;
    k=2:2^(n-c);
    for kk=1:length(k)
        msum = 0;
        for m=0:n-c
            prod = (-1)^m * mynchoosek(n-c, m) * 2^m * mynchoosek(2^(n-c-m), k(kk));
            msum  = msum + prod;
        end
        val(kk)  = msum*fct;
    end

    val
    sum(val)
    %xlswrite('Y:\___GRAFEN\___________________GHP\separ.xls', val, strcat('val',num2str(d)) );      
    clear val;
end
