clc;
clear;
invest = importdata('DATA\1800.mat');
k = max(invest(:,1));
U_I = cell(k,1);
for i=1:k
       ki=find(invest(:,1)==i);
       U_I{i}=invest(ki,2)';
end

