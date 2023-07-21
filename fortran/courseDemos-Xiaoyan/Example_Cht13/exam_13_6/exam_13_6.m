clear all;
close all;
clc;

% 参数设定
nelx    = 200;  % 梁x方向划分的单元数目
nely    = 100;   % 梁y方向划分的单元数目
volfrac = 0.5;  % 材料的空间比
penal   = 3;    % 罚因子的幂次
rmin    = 1.5;  % 过滤器的半径
ft      = 2;    % ft = 1: 根据灵敏度过滤；ft = 2：根据密度过滤

% 拓扑优化，并显示结果
top88(nelx,nely,volfrac,penal,rmin,ft);
