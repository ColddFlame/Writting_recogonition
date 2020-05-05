function [HH,score] = adaboost(q1,q2,x)
% Adaboost
%mod q1,q2
%q1 = q1';
%q2 = q2';
%x = x';
if size(q2,1) >= size(q1,1)
multiple = floor(size(q2,1)/size(q1,1));
q1 = repmat(q1,multiple,1);
else
multiple = floor(size(q1,1)/size(q2,1));
q2 = repmat(q2,multiple,1);
end
%pre for loop
T = 30;
J = size(q1,2);
n1 = size(q1,1);
n2 = size(q2,1);
miu1 = sum(q1,1)/n1;
miu2 = sum(q2,1)/n2;%%
y1 = ones(n1,1);
y2 = ones(n2,1)*(-1);
y = [y1;y2];
Q1 = [q1,y1];
Q2 = [q2,y2];
Q = [Q1;Q2];
%parameter
D = ones(size(Q,1),1)*1/(size(Q,1));
count = 0;
e = 0;
Y = zeros(size(Q,1),1);
alpha = 0;
%M1 = zeros(T,J);
%M2 = zeros(T,J); 
H = 0;
%loop
for t = 1:T*J
    j = mod(t-1,J)+1;
    %test data
    if abs(x(j)-miu1(j)) <= abs(x(j) - miu2(j))
        X = 1;
    else
        X = -1;
    end
    %training data
    for k = 1:size(Q,1)
    if abs(Q(k,j) - miu1(j)) <= abs(Q(k,j) - miu2(j))
        Y(k) = 1;
    else
        Y(k) = -1;
    end
    end
    count = 0;
    e = 0;
    for l = 1:size(Q,1)
        if Y(l) ~= Q(l,J+1)
            count = count +1;
            e = e + D(l);
        end
    end
    alpha = 1/2*log((1-e)/e);
    Z = 0;
    for i = 1:size(Q,1)
    Z = Z + D(i) * exp(-alpha*y(i)*Y(i));
    end
    for i = 1:size(Q,1)
    D(i) = D(i) * exp(-alpha*y(i)*Y(i))/Z;
    end
    
    temp1 = 0;
    temp2 = 0;
    for i = 1:n1
    temp1 =  temp1 + D(i)*q1(i,j);
    end
    miu1(j) = temp1/sum(D(1:n1));
    %M1(floor(t/J),j) = miu1(j);
    for i = 1:n2
    temp2 = temp2 + D(n1+i)*q2(i,j);
    end
    miu2(j) = temp2/sum(D(n1+1:n1+n2));
    %M2(floor(t/J),j) = miu2(j);
    
    
    H  = H + alpha*X;%%Strong Learner
end
HH = sign(H);
score = H;
end

