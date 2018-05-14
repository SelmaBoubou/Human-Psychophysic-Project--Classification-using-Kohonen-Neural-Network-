function [weights] = learn(RealTrainData, RealTestData)

%Learning rate
learning_rate = 0.8;
data = [RealTrainData; RealTestData];


%Weights initialization
weights = zeros(size(data,2),2);

%Distance D initialized to 0
D = 0;

%for loop to iterate and learn weights
for i = 1:10000
  
    for j = 1:(size(data,1))
     
        x = data(j,:)';
    
        [D index] = min(sum ((weights - repmat(x,1,2).^2)));
           
           
        %Weight update equation
  
        weights(:,index) = weights(:,index) + learning_rate *(data(j,:)' - weights(:,index));
    
        end
        %learning rate reduced to 95% of the previous value through each iteration
        learning_rate = learning_rate*0.95;
    
    end
end