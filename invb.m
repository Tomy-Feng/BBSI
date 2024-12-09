function [invB,B1] = invb(T1, H, T2)
    Nz = size(H, 2); 
    B1 = cell(1, Nz); 
    B1{Nz} = inv(H{Nz});

    for k = (Nz-1):-1:1
        B1{k} = inv(H{k} - T1{k} * B1{k+1} * T2{k}); % your method to compute the inverse
    end
    invB = B1{1};
end
