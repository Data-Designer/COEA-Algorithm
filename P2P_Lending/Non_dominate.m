CT=1800;


filename1=['Results\',num2str(CT),'\NSGA2\PSV_Repair.mat'];
filename2=['Results\',num2str(CT),'\SPEA2\PSV_Repair.mat'];
filename3=['Results\',num2str(CT),'\MOEAD\PSV_Repair.mat'];
filename4=['Results\',num2str(CT),'\ARMOEA\PSV_Repair.mat'];

filename5=['Results\',num2str(CT),'\NSGA2\PS_Repair.mat'];
filename6=['Results\',num2str(CT),'\SPEA2\PS_Repair.mat'];
filename7=['Results\',num2str(CT),'\MOEAD\PS_Repair.mat'];
filename8=['Results\',num2str(CT),'\ARMOEA\PS_Repair.mat'];


PSV1=importdata(filename1);
PSV2=importdata(filename2);
PSV3=importdata(filename3);
PSV4=importdata(filename4);

PS1=importdata(filename5);
PS2=importdata(filename6);
PS3=importdata(filename7);
PS4=importdata(filename8);

PSV = cell(4,1);
PSV{1} = PSV1;
PSV{2} = PSV2;
PSV{3} = PSV3;
PSV{4} = PSV4;

PS = cell(4,1);
PS{1} = PS1;
PS{2} = PS2;
PS{3} = PS3;
PS{4} = PS4;


for i = 1 : 4
    P_ObjectValue = PSV{i};
    [FrontValue,MaxFront]=N_sort(P_ObjectValue,'half');
    ParetoProduct=find(FrontValue==1);
    PSV{i}=P_ObjectValue(ParetoProduct,:);
    PS{i} = PS{i}(ParetoProduct);
end

filename1=['Results\',num2str(CT),'\NSGA2\PSV_Nondo.mat'];
filename2=['Results\',num2str(CT),'\SPEA2\PSV_Nondo.mat'];
filename3=['Results\',num2str(CT),'\MOEAD\PSV_Nondo.mat'];
filename4=['Results\',num2str(CT),'\ARMOEA\PSV_Nondo.mat'];

filename5=['Results\',num2str(CT),'\NSGA2\PS_Nondo.mat'];
filename6=['Results\',num2str(CT),'\SPEA2\PS_Nondo.mat'];
filename7=['Results\',num2str(CT),'\MOEAD\PS_Nondo.mat'];
filename8=['Results\',num2str(CT),'\ARMOEA\PS_Nondo.mat'];
PSV1 = PSV{1};
PSV2 = PSV{2};
PSV3 = PSV{3};
PSV4 = PSV{4};

PS1 = PS{1};
PS2 = PS{2};
PS3 = PS{3};
PS4 = PS{4};

save(filename1,'PSV1');
save(filename2,'PSV2');
save(filename3,'PSV3');
save(filename4,'PSV4');

save(filename5,'PS1');
save(filename6,'PS2');
save(filename7,'PS3');
save(filename8,'PS4');



