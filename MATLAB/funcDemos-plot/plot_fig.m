% 随意构造数据
X0 = .15:.05:.35;
Y0 = logspace(-5,-1,5);
Y1 = Y0.*[.1,2,3,40,1];
Y2 = Y0.*[10,20,9,1000,2];
Y3 = Y0.*[25,105,35,1,60];
Y4 = Y0.*[200,200,70,90,5];
Y5 = Y0.*[1,50,1,10,.1];

figure('Position',[550,420,580,450])
% 坐标区域修饰
ax=gca;
hold on;
ax.Box = 'on';
ax.YScale = 'log';
ax.LineWidth = .9;
ax.TickLength = [.01,.025];
ax.TickDir = 'out';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridLineStyle = '-';
ax.MinorGridLineStyle = '-';
ax.MinorGridAlpha = .08;
ax.GridAlpha = .08;
ax.FontName = 'Times New Roman';
ax.FontSize = 12;

% 绘图
plot(X0,Y1,'LineWidth',2,'Color',[31,119,179]./255,'Marker','s','MarkerSize',8,'MarkerFaceColor',[31,119,179]./255,'LineStyle',':')
plot(X0,Y2,'LineWidth',2,'Color',[44,159,44]./255,'Marker','o','MarkerSize',8,'MarkerFaceColor',[44,159,44]./255,'LineStyle','-.')
plot(X0,Y3,'LineWidth',2,'Color',[160,123,194]./255,'Marker','x','MarkerSize',13,'MarkerFaceColor',[160,123,194]./255,'LineStyle',':')
plot(X0,Y4,'LineWidth',2,'Color',[255,127,14]./255,'Marker','v','MarkerSize',8,'MarkerFaceColor',[255,127,14]./255,'LineStyle','--')
plot(X0,Y5,'LineWidth',2,'Color',[213,39,40]./255,'Marker','pentagram','MarkerSize',8,'MarkerFaceColor',[213,39,40]./255,'LineStyle','-')

% 绘制图例
lgdHdl=legend(ax,{'VD (SCI 0.0%)','VD (SCI2 5.0%)','RNN (No SCI)','VD (SCI2 2.5%)','SBRNN (No SCI)'});
lgdHdl.Location = 'northoutside';
lgdHdl.NumColumns = 3;
lgdHdl.EdgeColor = [.7,.7,.7];

% 坐标轴标签
xlabel(ax,'Channel Parameter \beta','FontSize',14,'FontWeight','bold','Color',[.3,.3,.3])
ylabel(ax,'Bit Error Rate (BER)','FontSize',14,'FontWeight','bold','Color',[.3,.3,.3])