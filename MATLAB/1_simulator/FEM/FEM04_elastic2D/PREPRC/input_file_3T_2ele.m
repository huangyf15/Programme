% Input Data for Example 9.3 (3T_2 element) 
include_flags;

%% material properties 
E  = 30e6;     % Young's modulus  
ne = 0.3;      % Poisson ratio   
D  = E/(1-ne^2) * [1    ne     0           
                   ne    1     0   
                   0     0     (1-ne)/2]; 

%% mesh specifications 
nsd  = 2;         % number of space dimensions 
nnp  = 4;         % number of nodal nodes 
nel  = 2;         % number of elements 
nen  = 3;         % number of element nodes
nee  = 3;         % number of element edges
ndof = 2;         % degrees of freedom per node 
neq  = nnp*ndof;  % number of equations 

f = zeros(neq,1);      % initialize nodal force vector 
d = zeros(neq,1);      % initialize nodal displacement matrix 
K = zeros(neq);        % initialize stiffness matrix 

counter    = zeros(nnp,1);  % counter of nodes for stress plots 
nodestress = zeros(nnp,3);  % stresses at nodes for the stress plots [sxx syy sxy] 

P     = zeros(neq,1);          % point forces applied at nodes 
b     = zeros(nen*ndof,nel);   % body forces defined at nodes 

%% boundary conditions and force array
% array to set B.C flags 
% dof:    1x    1y    2x     2y    3x    3y    4x     4y  
flags   = [2     2     2     2     0     0      0      0]';
nd    = 4;             % number of essential boundary conditions (x and y)
ngp   = 2;
% essential B.C array
e_bc  = zeros(neq,1);
% natural B.C. array
n_bc  = [ 2              %  node 1  
          4              %  node 2    
          0              %  traction at node 1 in x  
         -20             %  traction at node 1 in y  
          0              %  traction at node 2 in x  
         -20 ];          %  traction at node 2 in y   
nbe   = 1;               %  number of edges on the boundary

%% plot flag
plot_mesh      = 'yes'; 
plot_nod       = 'yes'; 
plot_disp      = 'yes'; 
compute_stress = 'yes'; 
plot_stress_xx = 'yes'; 
plot_mises     = 'yes'; 
fact           = 9.221e3;      % factor for scaled displacements plot  

%% mesh generation 
% node:  1    2    3    4 
x   =  [0.0  0.0  2.0  2.0];     % X coordinate 
y   =  [0.0  1.0  0.5  1.0];     % Y coordinate 
% the order is required to be clockwise
IEN =  [2    1    3;
        2    3    4]';     % connectivity array 
 
% function to plot the mesh 
plotmesh; 