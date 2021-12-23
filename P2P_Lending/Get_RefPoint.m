function [Global_RefPoint,Global_Flag]=Get_RefPoint(Global_RefPoint,Global_Flag,P1,P2)

Global_Flag=Global_Flag+1;
P=P1+P2;
Global_RefPoint(P==2)=1;
Global_Flag(P==2)=0;
Global_RefPoint(find(Global_Flag>20))=0;
