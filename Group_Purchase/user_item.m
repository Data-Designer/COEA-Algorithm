clc;
clear;
invest = importdata('DATASET\userbuy.mat');
k = max(invest(:,2));
U_I = cell(k,1);
for i=1:k
       ki=find(invest(:,2)==i);
       U_I{i}=invest(ki,1)';
end

