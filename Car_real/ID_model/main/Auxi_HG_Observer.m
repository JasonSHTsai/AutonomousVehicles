% Ver. ：
% Desc.：
% Info.：
function [Gd,Hd,Ld] = Auxi_HG_Observer(G,H,C,D,Ts,Qo)
% ▃▃ 相關參數預設值設定 ▃▃
[n,m] = size(H);
[p,n] = size(C);

[A,B] = d2c(G,H,Ts);
Qo = Qo*eye(n);
Ro = eye(p);
[Lc_temp,Po] = lqr(A',C',Qo,Ro);
Lc = Lc_temp';
Ld = (G-eye(n))*inv(A)*Lc*inv(eye(p)+C*(G-eye(n))*inv(A)*Lc);   

Gd = (G-Ld*C*G);
Hd = (H-Ld*C*H);
end