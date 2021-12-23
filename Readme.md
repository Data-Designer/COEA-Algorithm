This is the public repo for [CoEA: A Cooperative-Competitive Evolutionary Algorithm for Bidirectional Recommendations](https://scholar.google.com.hk/citations?view_op=view_citation&hl=zh-CN&user=YYMcwZAAAAAJ&alert_preview_top_rm=2&citation_for_view=YYMcwZAAAAAJ:u-x6o8ySG0sC)

GT is our Algorithm(GTEA(-GM);GTEA(-GC);GTEA) ! Note that dataset is too large, we don't include it in this repo, please leave your email if you want.

**Algorithm Step**

- **PlatEMO-RUN Benchmarks（NSGA-Ⅱ、SPEA2、MOEA-D and ARMOEA etc.）**

  Run main.m, parameter settings as follows:

  ![img](https://s2.loli.net/2021/12/23/8BNE9esRcAnopSY.jpg)

  Results will be saved in data directory, then run Results.m to get correct format (PS/PSV.mat).

  Next, evalute the results

  - First, run Repair_MOEAs.m, get PS_Repair.mat;

  - Second, run Evaluate_MOEAs.m, get PSV_Repair.mat;

  - Third, run Non_dominate.m, get PS_Nondo.mat and PSV_Nondo.mat 

- **P2P_Lending problem**

  - First, Run UCF and ICF to get the corr result.( run CFCommendation.m, get UCF.mat; then run ICF Commendation.m, get ICF.)

    ICF should be run twice（modify the corr UCF or ICF）

    *Note: ps ＝cell（1，1）ps｛1｝＝ PS (ICF)*  

  - Second,  run WholeFramework.m

  - Third, run draw.m, get Pareto Frontier（https://jingyan.baidu.com/article/6fb756ec6dc922241858fb19.html）（http://www.pudn.com/Download/item/id/2148827.html）。

  - Finally, run Matric.m, get the evalution metrics. 

![img](https://s2.loli.net/2021/12/23/GEAdrscNatgF17b.png)

- Group_Purchase Problem

  - The same as P2Plending.
- **Note:** Matlab Storage format must be modified in V7.3mat



If you follow our work, please cite it：

[1] H Zhao, X Wu, C Zhao, L Zhang, H Ma, F Cheng - IEEE Transactions on Evolutionary Computation, 2021

 