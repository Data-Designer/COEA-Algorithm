This is the public repo for [CoEA: A Cooperative-Competitive Evolutionary Algorithm for Bidirectional Recommendations](https://scholar.google.com.hk/citations?view_op=view_citation&hl=zh-CN&user=YYMcwZAAAAAJ&alert_preview_top_rm=2&citation_for_view=YYMcwZAAAAAJ:u-x6o8ySG0sC)

GT is our Algorithm !

**Algorithm Step**

- PlatEMO中包含NSGA-Ⅱ、SPEA2、MOEA-D和ARMOEA:

  运行main.m函数，选择算法和问题，参数设置如图所示：

  ![img](https://s2.loli.net/2021/12/23/8BNE9esRcAnopSY.jpg)

  运行后的结果存于Data文件夹中，通过Results.m文件对所得结果处理得到正确的解格式。然后将结果PS.mat和PSV.mat存入P2P_Lending和Group_Purchase对应结果文件夹中。

  然后在P2P_Lending或者Group_Purchase文件夹进行评价，评价步骤如下：

  - 第一步，运行Repair_MOEAs.m文件对存入的结果进行修复操作得到PS_Repair.mat;

  - 第二步，运行Evaluate_MOEAs.m文件对修复好的个体进行评价得到PSV_Repair.mat;

  - 第三步，运行Non_dominate.m文件对结果进行非支配排序得到前沿面解PS_Nondo.mat和PSV_Nondo.mat，即最终用于评价的解。

- P2P_Lending中包含有P2P_Lending问题的UCF,ICF,LP-Optimizer,BP-Optimizer,GTEA(-GM),GTEA(-GC)和GTEA。UCF和ICF所得的评分矩阵已存入对于结果下目录下，剩余对比算法可直接运行WholeFramework.m函数。

  draw.m函数用于绘制前沿面图，运行完draw.m函数在命令行窗口输入magnify即可在图中绘制局部放大图。Magnify函数具体用法可自行百度（https://jingyan.baidu.com/article/6fb756ec6dc922241858fb19.html）（http://www.pudn.com/Download/item/id/2148827.html）。

  Matric.m函数用于计算各个算法所得解集的指标值。

![img](https://s2.loli.net/2021/12/23/GEAdrscNatgF17b.png)

- Group_Purchase中包含有Group_Purchase问题的UCF,ICF,LP-Optimizer,BP-Optimizer,GTEA(-GM),GTEA(-GC)和GTEA。UCF和ICF所得的评分矩阵已存入对于结果下目录下，剩余对比算法可直接运行WholeFramework.m函数。

  draw.m函数用于绘制前沿面图，运行完draw.m函数在命令行窗口输入magnify即可在图中绘制局部放大图。Magnify函数具体用法可自行百度（https://jingyan.baidu.com/article/6fb756ec6dc922241858fb19.html）（http://www.pudn.com/Download/item/id/2148827.html）。

  Matric.m函数用于计算各个算法所得解集的指标值。
  
- 注意：matlab默认存储方式对文件大小有限制导致的，需要matlab默认保存格式改为V7.3mat应该就可以了



If you follow our work, please cite it：

[1] H Zhao, X Wu, C Zhao, L Zhang, H Ma, F Cheng - IEEE Transactions on Evolutionary Computation, 2021

 