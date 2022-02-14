function [P_new, theta_new, error_es, y_hat, R_w, R_e] = RELS_win_3(y, phi, theta_now, P_now, fault_flag, R_e, Lamda)

y_hat = phi'*theta_now;
error_es = y - y_hat;

tempP_num = phi*phi'*P_now;

if nargin < 5
    tempP_den = 1;
else
    if isempty(R_e)
        R_e = Lamda*error_es*error_es'/6;
    end
    tempP_den = R_e;
end
tempP_den = tempP_den+phi'*P_now*phi;
tempP = tempP_num/tempP_den;

M = P_now*phi;
M = M/tempP_den; %(28)
R_w = M*error_es; %(33)

P_new = 0;
if nargin > 5 && (fault_flag)
    P_new = diag(diag(R_w*R_w')); %(33) 
end
    
P_new = P_now*(eye(size(tempP)) - tempP) + P_new; %(29)

if nargin < 5
    theta_new = theta_now + P_new*phi*error_es;
else
    theta_new = theta_now + M*error_es;
end

