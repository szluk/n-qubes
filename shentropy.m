function H = shentropy(prob_dist)
% Input: prob_dist is a vector of probabilities (must sum to 1)

    % Remove zero probabilities to avoid log(0)
    prob_dist = prob_dist(prob_dist > 0);
    H = -sum(prob_dist .* log2(prob_dist));
end
