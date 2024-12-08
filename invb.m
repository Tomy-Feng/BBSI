function [invB,B1] = invb(T1, H, T2, s)
    Nz = size(H, 2); 
    %if isempty(s)
     %   s = cellfun(@(x) size(x, 1), H); 
    %end
    B1 = cell(1, Nz); 
    B1{Nz} = inv(H{Nz});

    for k = (Nz-1):-1:1
        %i = 1:s(k);
        %j = 1:s(k+1);
        B1{k} = inv(H{k} - T1{k} * B1{k+1} * T2{k});
    end
    invB = B1{1};
end
