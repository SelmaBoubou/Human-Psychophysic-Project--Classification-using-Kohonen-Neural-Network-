function X = kohonen_network (Tr,Te)

%% 1) Construct a Kohonen network in order to carry out the classification of the vectors 

Input_Vectors = size(Tr,1);   
Output_Vectors = 2;          
Learn_Rate = 0.8 * 0.9; % to reduce the learning rate   
weights = mod(randn(Output_Vectors,Input_Vectors), 1);
Iterations = 50;           % Number of Iterations


disp('Train Data for Question 1:');
Tr                   
disp('Results: ');


    for N = 1:size(Tr,1)     % Its distance from every weight vector
        for k = 1:size(weights,1)
            D(k) = sum((Tr(N,:) - weights(k,:)).^2); % Euclidian Distance
        end
        if D(1)>D(2) % Finding the closest weight vector
            weights(2,:) = (weights(2,:) + (Learn_Rate*(Tr(N,:) - weights(2,:))));
             disp(['[',num2str(Tr(N,:)),' ] This Vector Belongs to ','Class 1']);
            
        else
            weights(1,:) = (weights(1,:) + (Learn_Rate*(Tr(N,:) - weights(1,:))));
             disp(['[',num2str(Tr(N,:)),' ] This Vector Belongs to ','Class 2']);
            
        end
        
    end



a = [Tr(1,:)
    Tr(3,:)];

X = mean(a(1:2,:));        % Taking mean of first learning cluster

weights = round((weights*100))./100  % Learned Weights
if weights(1,:) == X       % Comparing that mean value with cluster output
    cluster1 = 'Class 2';  % If there will be changes in weight vector the
    cluster2 = 'Class 1';  % Values assigned to output clusters will reversed
end
if weights(2,:) == X
    cluster1 = 'Class 1';
    cluster2 = 'Class 2';
end

%% 2) Once the training is completed carry out a test with the vectors

disp('Test Data for Question 2:');
Te                   
disp('Results: ');

% Its distance from every weight vectors
for N = 1:size(Te,1)     
    for k = 1:size(weights,1)
        % Getting euclidian Distance
        D(k) = sum((Te(N,:) - weights(k,:)).^2); 
    end
    if D(1)>D(2)        % Finding the closest weight vector
        disp(['[',num2str(Te(N,:)),' ] This Vector Belongs to ','Class 1']);
    else
        disp(['[',num2str(Te(N,:)),' ] This Vector Belongs to ','Class 2']);
    end
end            
end