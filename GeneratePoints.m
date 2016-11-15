function X = GeneratePoints(N,d,mode)

% Inputs:
% N - number of points
% d - dimension
% mode - either 0 or 1.  mode = 0 gives equally-space points, mode = 1
% gives randomly-chosen points.

% Output:
% X - a d x N array, where the nth column is the point x^(n)

if mode == 0
    
    M = floor(N^(1/d));
    
    if M>1
        
        X = 1;
        for i = 1:d
            X = [kron(X,ones(M,1)) kron(ones(size(X,1),1),(1:M)')];
        end
        X = X(:,2:end);
        X = X';
        
        X = 2*(X-ones(size(X)))/(M-1) - ones(size(X));
        
    else
        X = zeros(d,1);
    end
    
    if M^d < N
        
        X = [X ones(d,N-M^d)];
        
    end
    
    
elseif mode == 1
    
    X = 2*rand(d,N)-ones(d,N);
    
else
    disp('ERROR: mode must be either 0 or 1');
    
end

end

