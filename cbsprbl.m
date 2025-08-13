clear all

% use random or uniform probability amplitudes
random = true;
%random = false;

% number of qubits
n=3
% maximum support size
nn=2^n;
% support set (2^nn-1 is the nof distinct supports)
support=dec2bin(0:2^nn-1, nn);

% nof separable states for n qubits
sprbl = 0;
% nof total states checked for separability for n qubits
total = 0;

% array of separability
separ = zeros( size(support,1), 2^(n-1)-1 );

%Shannon entropies
shent = zeros( size(support,1), 2^(n-1)-1 );

for pr = 1:size(support,1)
    givsup = support(pr,:)-'0';  % a given support
    sumones = sum(givsup); %number of ones in a given support
    if sumones == 0 % drop null vestor 
        continue
    end
    if sumones > 16
        continue
    end

    % Generate random variables
    rpa =  randn(sumones, 1);    
    % Normalize to obtain a vector of random probability amplitudes 
    rpa = rpa / norm(rpa);

    rpacnt = 1;    
    for ss=1:length(givsup)
        if givsup(ss) % nonzero
            if random % random probability amplitudes
                givsup(ss) = givsup(ss)*rpa(rpacnt);
                rpacnt = rpacnt+1;
            else % uniform probability amplitudes
                givsup(ss) = givsup(ss)/sqrt(sumones);
            end
        end
    end

% n=2: [1]  x1
% n=3: [1], [2], [3] x3
% n=4: [1], [2], [3], [4], [1 2], [1 3], [1 4] x7
% n=5: [1], [2], [3], [4], [5],   [1 2], [1 3], [1 4], [1 5],  [2 3], [2 4], [2 5],  [3 4], [3 5],  [4 5] x15
% 2^(n-1)-1

    podzialy=generateSetPartitions(n);
    
    for k=1:length(podzialy)
        redrho = calculateReducedDensityMatrix(givsup', podzialy{k}{1});

        lbd = eig(redrho);
        %lbd'
        
        if nnz_with_tolerance(lbd, 1e-14) == 1  % the state givsup is separable
        %if nnz(lbd) == 1        
            sprbl = sprbl+1;
            separ(pr,k) = 1;        
        end
        shentrop = shentropy(lbd);
        if shentrop < 10e-14
            shentrop = 0;
        end
        
        shent(pr,k) = shentrop;
        total = total+1;    
    end
    

end

%xlswrite('separ.xls', support,  'support');  
%xlswrite('separ.xls', separ, 'separ');  

sprbl

total

return
