function X = kohonen_network3 (C, P, F)

X = [F];
weights = learn (C, P);
Nweights = reshape(weights,2,650,[]);
x = mean(X(:,:));             % Computing row mean vector of first training cluster
for N = 1:size(x,1)           % Its distance from both weight vector
    for k = 1:size(Nweights,1)
        D(k) = sum((x(N,:) - Nweights(k,:)).^2); % Euclidian Distance
    end
    if D(1)>D(2)              % Finding the closest weight vector
        cluster1 = 'Patient'; % Comparing that mean vector with cluster output
        cluster2 = 'Control'; % If there will be changes in weight vector the
    else
        cluster1 = 'Control'; % Values assigned to output clusters will reversed
        cluster2 = 'Patient';
    end
end

disp('Result ');


for N = 1:size(F,1)     % Its distance from every weight vector
    for k = 1:size(Nweights,1)
        D(k) = sum((F(N,:) - Nweights(k,:)).^2); % Euclidian Distance
    end
    if D(1)>D(2)      
        disp(['The subject ',num2str(N),' Belongs to ',cluster2]);
    else
        disp(['The subject ',num2str(N),' Belongs to ',cluster1]);
    end
 end