 dist = pdist(Xtrain); % calculate distance between every pair of points
 dist = squareform(dist); % convert to square matrix
 K = exp(-mu * dist.^2); % mu: kernel parameter (specified by user)
 alpha = inv(K + lambda*eye(N)) * y;
 dist = pdist([Xtrain; Xtest]);
 dist = squareform(dist);
 K2 = exp(-mu * dist.^2);
 K2 = K2(1:N, end-M+1:end); % similarity btw training and test points
 predictions = alpha’ * K2;
  K = exp(-(1e-7) * dist.^2);
  