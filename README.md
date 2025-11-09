# n-qubes
On the quantum separability of n-qubit registers

List of files:
------------------------------------------------
calculateReducedDensityMatrix.m
Function to calculate the reduced density matrix of an n-qubit state

cbcstate.m
Function to calculate the distribution of common bit (CB) states that is n-qubit states that in the computational basis
have 0 <= c <= n-1 bit(s) in common in the same position(s) of the support size k

cbcstates.m
Calls cbcstate.m and returns a vector of values for k=2:2^(n-c)

generateSetPartitions.m
Function to generate all 2^(n−1)−1 unique partitions among n elements. For example for n=4 they are

mynchoosek.m
Binomial coefficient or all combinations defined in term of the falling factorial

shentropy.m
Shannon entropy 

nnz_with_tolerance.m
Count non-zero elements in array x, treating values <= tol as zero

cbsprbl.m
Cross-validate the distributions of the common bit (CB) states numerically by calculating the eigenvalues
of the reduced density matrices for each of 2^(2^n)−1 quantum states corresponding to distinct supports, assuming equal or
random probability amplitudes, and for each of 2^(n−1)−1 partitions. The Schmidt decomposition certifies that a given state is
separable along a given partition if some eigenvalue is equal to one.

separability.zip
XLS file containing the results of the cross-validation for n=2,3,4 qubit states

exsupsizes.m
Function to generate numbers k factorable as products k = l * m with the property that ceil(log2(k)) < ceil(log2(l))+ceil(log2(m)) for all l, m.
These numbers cannot represent the support sizes of bipartite separable quantum registers containing ceil(log2(k)) qubits.
