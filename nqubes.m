clear all

% The number of PDS_c states for c
maxn=4
for n=1:maxn
    c=0;
    c=1;    
    %c=2;        
    %c=3;            
    %c=4;                
    %c=n-1;    
    k=2:2^n;
    for kk=1:length(k)
        msum = 0;
        for m=0:n-c-1
            fct = (-1)^m * mynchoosek(n-c, m) * 2^m * mynchoosek(2^(n-c-m), k(kk));
            msum = msum + fct;
        end
        val(kk) = msum * mynchoosek(n, c) * 2^c;
    end
    val
    sum(val)
end

return

% analysis of the superexponential growth
idx=1;
for n=1:10
    fct(idx) = 0;
    msum1(idx) = 0;
    msum2(idx) = 0;
    msum3(idx) = 0;        
    for m=0:n-1
        %                                    (2^(2^(n-m)) - 2^(n-m) - 1);
        fct(idx) = (-1)^m * nchoosek(n, m) * 2^m;
        msum1(idx) = msum1(idx) + fct(idx) * (2^(2^(n-m)));
        msum2(idx) = msum2(idx) + fct(idx) * (              2^(n-m)    );
        msum3(idx) = msum3(idx) + fct(idx) * (                        1);
    end
    idx = idx+1;
end

fct

msum1
msum2
msum3

return

% A131288 sequence formula A
for n=1:10
    msum = 0;
    for m=0:n-1
        %msum = msum + (-1)^m * nchoosek(n, m) * 2^m * (2^(2^(n-m)) - 1); % for m=0:n                    
        msum = msum + (-1)^m * nchoosek(n, m) * 2^m * (2^(2^(n-m)) - 2^(n-m) - 1); % also for m=0:n
    end
    msum
end

return

% A131288 sequence formula B
for n=1:4
    k=2:2^n;
    for kk=1:length(k)
        msum = 0;
        for m=0:n
            msum = msum + (-1)^m * mynchoosek(n, m) * 2^m * mynchoosek(2^(n-m), k(kk));
        end
        val(kk) = msum;
    end
    val;
    sum(val)
end

return

% A390536 sequence formula 
k=45
k_belongs=false;
    if mod(k, 2) %odd k
        f = factor(k);  % Prime factors
        n = numel(f);
        products = [];  % Generate all possible subsets (except empty) Using binary masks
        for i = 1:2^n - 1
            subset = f(logical(bitget(i, 1:n)));
            b = prod(subset);
            c = k / b;
            if mod(k, b) == 0 & b>1 & c>1
                products = [products; sort([b c])];
            end
        end
        products = unique(products, 'rows');  % Remove duplicate products
        if length(products)  % k is not a prime
            seq_candidate = 0;
            for l=1:size(products,1)
                if ceil(log2(products(l,1))) + ceil(log2(products(l,2))) > ceil(log2(k)) % k=b*c is a candidate
                    seq_candidate = seq_candidate+1;
                end
            end
            if seq_candidate == size(products,1) % All possible products of k=l*m are candidates
                k_belongs=true;
            end
        end
    end

k_belongs
return
