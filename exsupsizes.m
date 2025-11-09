function exc = exsupsizes(k_max)
% Numbers k factorable as products k = l * m with the property that ceil(log2(k)) < ceil(log2(l))+ceil(log2(m)) for all l, m.
% These numbers cannot represent the support sizes of bipartite separable quantum registers containing ceil(log2(k)) qubits.
% 15, 25, 27, 51, 55, 57, 63, 85, 95, 99, 111, 115, 117, 119, 121, 123, 125, 185, 187, 201, 205, 207, 209, 213, 215, 219, 221, 231
% Input: 
% k_max - maximum k
%
% (c) Szymon Lukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 09.11.2025

idx=1;
for k=1:k_max
    if mod(k, 2) %odd k
        % Prime factors
        f = factor(k);
        n = numel(f);

        % Generate all possible subsets (except empty) Using binary masks
        products = [];
        for i = 1:2^n - 1
            subset = f(logical(bitget(i, 1:n)));
            a = prod(subset);
            b = k / a;
            if mod(k, a) == 0 & a>1 & b>1
                products = [products; sort([a b])];
            end
        end

        % Remove duplicate products
        products = unique(products, 'rows');

        if length(products) % This k is not a prime
            gotexc = 0;
            for l=1:size(products,1)
                if ceil(log2(products(l,1))) + ceil(log2(products(l,2))) > ceil(log2(k)) % This product of k=l*m is a canditate
                    gotexc = gotexc+1;            
                end
            end                
            if gotexc == size(products,1) % All possible products of k=l*m are canditates
                exc(idx) = k;
                idx = idx+1;
            end
         end
    end
end

exc