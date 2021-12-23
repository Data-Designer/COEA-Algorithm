first = importdata('DATA\1700.mat');
A = importdata('DATA\1700_2.mat');
B = importdata('DATA\1800_2.mat');

C = [first(1:4000000,:);A];
D = [first(1:4000000,:);B];