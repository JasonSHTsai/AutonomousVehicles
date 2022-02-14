% Ver. ：
% Desc.：
% Info.：
function [A,Lc,C,error] = Auxi_HG_Observer_h(G,H,C,D,Ts,Qo)
% ▃▃ 相關參數預設值設定 ▃▃
[n,m] = size(H);
[p,n] = size(C);

[A,B] = d2c(G,H,Ts);
Qo = Qo*eye(n);
Ro = eye(p);
h=20;
% (A+h*eye(n))'
% C'
% rank(ctrb((A+h*eye(n))',C'))
% [Qo zeros(n,m);zeros(m,n) Ro]
% eig([Qo zeros(n,m);zeros(m,n) Ro])

[Lc_temp,Po,error]=lqr((A+h*eye(n))',C',Qo,Ro);



Lc = Lc_temp';
Ld = (G-eye(n))*inv(A)*Lc*inv(eye(p)+C*(G-eye(n))*inv(A)*Lc);   

Gd = (G-Ld*C*G);
Hd = (H-Ld*C*H);
end