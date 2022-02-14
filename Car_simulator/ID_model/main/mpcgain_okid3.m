function [BarPhi,BarF] = mpcgain_okid(G_d,H_d,C_d,D_d,L_d,Nc,Np)


[n,m] = size(H_d);
[p,n] = size(C_d);

%%%===prediction Y of parameters F
  F = [];
  for i = 1:Np
      F = [F;C_d*G_d^i];
  end

%%%===prediction Y of parameters Phi
%   Phi_part1 = [D_d,zeros(p,m*(Nc-1))];
  Phi_part2 = [];
  Phi_part3_col = [];
  Phi_part3 = [];


  for i = 0:Np-1
      Phi_part2 = [Phi_part2;C_d*G_d^i*H_d];
    
      if i == 0
         for j = 0:Np-2
             Phi_part3_col = [Phi_part3_col;C_d*G_d^j*H_d];
         end
       
         Phi_part3_col = [zeros(p,m);Phi_part3_col];
         Phi_part3 = [Phi_part3,Phi_part3_col];
       
      else
         if(i == Np-1)
             break;
         else
             Phi_part3_col = [zeros(p,m);Phi_part3_col(1:(Np-1)*p,:)];
             Phi_part3 = [Phi_part3,Phi_part3_col];
         end
      end
  end
  Phi = [Phi_part2,Phi_part3];
%   Phi = [Phi_part1;Phi];

%%%===prediction Y of parameters Gamma
  Gamma = [];
  Gamma_col = [];
  for i = 0:Np-1
      if i == 0
         for j =0:Np-1
         Gamma_col = [Gamma_col;C_d*G_d^j*L_d];
         end
         Gamma = [Gamma,Gamma_col];
      else
         Gamma_col = [zeros(p);Gamma_col(1:(Np-1)*p,:)];
         Gamma = [Gamma,Gamma_col];
      end
  end
%   Gamma = [zeros((Np-1)*p,p),Gamma];
%   Gamma = [zeros(p,Np*p);Gamma];

  %%%===BarPhi & BarF
  BarPhi = inv( eye(Np*p,Np*p) - Gamma )*Phi;
  BarF   = inv( eye(Np*p,Np*p) - Gamma )*F;
end
    
    
