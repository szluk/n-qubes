function count = nnz_with_tolerance(x, tol)
    % Count non-zero elements in array x, treating values <= tol as zero
    % Input: x (array), tol (tolerance)
    % Output: count (number of elements with absolute value > tol)
    if nargin < 2
        tol = 1e-18; % Default tolerance
    end
    count = sum(abs(x(:)) > tol);
end