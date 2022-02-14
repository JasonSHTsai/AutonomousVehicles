% ������ Tutorial 2.1 : Hildreth's Quadratic Programming ������ %

% �ץ�����

% The cost/objective function : J = 1/2*x'*E*x + x'*F
% The inequality constraints  : M*x <= G

function [x,lambda] = HQP(E,F,M,G)

[m,n] = size(M); % m : Number of equations
                 % n : Number of variables

x = -inv(E)*F;  % The global optimal solution without constraints
lambda = zeros(m,1);
k = 0;
for i = 1 : m 
    
   if (M(i,:)*x > G(i,:)) 
     k = k + 1;
   else
     k = k + 0;
   end
 
end

 if (k == 0) % �w���������A��^�W�h�C
   return; 
 end

H = M*inv(E)*M';
K = M*inv(E)*F + G;
 
lambda = zeros(m,1); % Initial condition of lambda

N_ite = 4e1; % The number of iterations could be larger if the Lagranger multiplier has a slow convergence rate.

  for j = 1 : N_ite

    lambda_p = lambda; % the previous values of lambda
      
    for i = 1 : m
        
      w  =  -( K(i,1) + H(i,:)*lambda - H(i,i)*lambda(i,:) ) / H(i,i);
      lambda(i,:) = max(0,w);
        
    end
      
    e = (lambda-lambda_p)'*(lambda-lambda_p); % �ثe�P�e�@�Ӥ��~�t����M
    
    if (e < 1e-10) % ��O�O�_�w����
      break; 
    end

  end

x = x - inv(E)*M'*lambda; % The constrained optimal solution 

end
