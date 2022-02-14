function [G, H, C, D,Qc,Rc,Qok] = initial( G, H, C, D, Q1, Q2, R1, R2, Qo)
    Qok = Qo*eye(size(G));
    Qc = Q1*eye(12);
    for i = 1:2:12
        Qc(i,i) = Q2;
    end
    Rc = R1*eye(12);
    for i = 1:2:12
        Rc(i,i) = R2;
    end
end