function display_QDA( data,test,Sigma1,Sigma2,Mu,Pi,i)
% This function plot the cloud of data classified by QDA, and the conic
% represnting the decision boundary, also it enables to see clearly the
% disposition of the points correspondant to each clasees in 2D
Nx1=100;
Nx2=100;
data_train_1 = data(data(:,3)==0,1:2);
data_train_2 = data(data(:,3)==1,1:2);
data_test_1=test(test(:,3)==0,1:2);
data_test_2=test(test(:,3)==1,1:2);
figure(i)
set(gcf,'color','w')
set(gcf,'position',[10 200 750 450])
subplot(1,2,1)
%Boundary of QDA
syms x y
r=ezplot(QDA(transpose([x y]),Sigma1,transpose(Mu(1,:)),Pi(1)) == QDA(transpose([x y]),Sigma2,transpose(Mu(2,:)),Pi(2)),[-10,10,-8,8]);
set(r,'LineWidth',3,'color','r');
hold on
scatter(data_train_1(:,1),data_train_1(:,2),'*');
hold on
scatter(data_train_2(:,1),data_train_2(:,2),'o');
legend('Boundary QDA','Training class 0','train class 1')
title('QDA on training set');
x1=linspace(-10,10,Nx1);  % sampling of the x1 axis 
x2=linspace(-8,8,Nx2);  % sampling of the x2 axis
[X1,X2] = meshgrid(x1,x2);
x = [X1(:) X2(:)]; % list of the coordinates of points on the grid
N = length(x);
class_L =index_QDA(x,Sigma1,Sigma2,Mu(1,:),Mu(2,:),Pi(1),Pi(2));
imagesc(x1,x2,reshape(class_L,Nx1,Nx2))
alpha 0.2
axis xy
subplot(1,2,2)
set(gcf,'color','w')
%Boundary of QDA
syms x y
r=ezplot(QDA(transpose([x y]),Sigma1,transpose(Mu(1,:)),Pi(1)) == QDA(transpose([x y]),Sigma2,transpose(Mu(2,:)),Pi(2)),[-10,10,-8,8]);
set(r,'LineWidth',3,'color','r');
hold on
scatter(data_test_1(:,1),data_test_1(:,2),'*');
axis([-10,10,-8,8]);
hold on
scatter(data_test_2(:,1),data_test_2(:,2),'o');
legend('Boundary QDA','test class 0','test class 1')
title('QDA on tesing data');
[X1,X2] = meshgrid(x1,x2);
x = [X1(:) X2(:)]; % list of the coordinates of points on the grid
N = length(x);
Nx1=100; % number of samples for display
Nx2=100;
class_L =index_QDA(x,Sigma1,Sigma2,Mu(1,:),Mu(2,:),Pi(1),Pi(2));
imagesc(x1,x2,reshape(class_L,Nx1,Nx2))
alpha 0.2
end

