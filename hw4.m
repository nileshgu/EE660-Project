% HW4 Problem 2

%% Data generation
clear all;
rx = -10:0.5:10;
ry = -10:0.5:10;

[w1, w2] = meshgrid(rx,ry);
[m, n] = size(w1);
w = [reshape(w1,1,m*n); reshape(w2,1,m*n)];

x1 = [0.5;0.3]; y1 = 0.2;
x2 = [1.5;2]; y2 = 0.3;

for i = 1:1:m*n
    g(i) = (x1' * w(:,i) - y1)^2 + (x2' * w(:,i) - y2)^2;
end

%TODO: visualize g(w) with a mesh plot. 
%      You'll need to reshape g into a m by n grid
g_bar = reshape(g, m, n);
mesh(w1,w2,g_bar);
xlabel('w1');
ylabel('w2');
zlabel('g');

%% function minimization
current = [-5 ; -8]; % current position, set to starting position
path = []; % a stack that keep a history of current position
stepsize = 0.0015; 

found = 0; 
i = 0;
while found ~= 1 && i <500
    i = i+1;
    %TODO: push current position to path
    path(:,end+1) = current;
    %TODO: calculate gradient
    dg_dw = 2*x1*(x1'*current-y1) + 2*x2*(x2'*current-y2);
    %TODO: update current position
    current = current - dg_dw * stepsize;
    %TODO: check termination criterion
    if (norm(dg_dw) < 0.2)
        break;
    end
end

%% visualize the path
% TODO: plot the path as a line, along with the mesh
figure;
g_bar = reshape(g, m, n);
mesh(w1,w2,g_bar);
xlabel('w1');
ylabel('w2');
zlabel('g');
hold on;
g1=zeros(1,length(path));
for i = 1:1:length(path)
    g1(i) = (x1' * path(:,i) - y1)^2 + (x2' * path(:,i) - y2)^2;
end
plot3(path(1,:),path(2,:),g1,'r');

%% test the effect of stepsize
stepsizes = [0.001 0.002 0.005 0.01 0.02 0.05 0.1 0.15 0.153];
n = length(stepsizes);
runs = zeros(1,n);
paths=cell(1,n);
figure; hold on;
for jj = 1:n
    current = [-5 ; -8]; % current position, set to starting position
    path = []; % a stack that keep a history of current position
    stepsize = stepsizes(jj); 

    found = 0; 
    i = 0;
    while found ~= 1 && i <500
        i = i+1;
        %TODO: push current position to path
        path(:,end+1) = current;
        %TODO: calculate gradient
        dg_dw = 2*x1*(x1'*current-y1) + 2*x2*(x2'*current-y2);
        %TODO: update current position
        current = current - dg_dw * stepsize;
        %TODO: check termination criterion
        if ((norm(dg_dw) < 0.2) || (norm(current)>1000))
            break;
        end
    end
    subplot(3,3,jj);
    mesh(w1,w2,g_bar);
%     xlabel('w1');
%     ylabel('w2');
%     zlabel('g');
    title(['step size: ' num2str(stepsize)]);
    hold on;
    g1=zeros(1,length(path));
    for i = 1:1:length(path)
        g1(i) = (x1' * path(:,i) - y1)^2 + (x2' * path(:,i) - y2)^2;
    end
    plot3(path(1,:),path(2,:),g1,'r');
    runs(jj) = length(path);
end

figure;
plot(stepsizes,runs,'r-o');
xlabel('step size');
ylabel('number of iterations');
