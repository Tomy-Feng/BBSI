function [T1, H, T2, s] = sparse_to_block(A, x)
        [ix, iy, ~] = find(A);
        N = size(A, 1);
        fs = x;
        nfs = numel(x);
        l_n = 1;
        s(l_n) = nfs;
        T1 = {};
        H = {};
        T2 = {};
        while nfs < N
            [x1, fs, nfs] = next_block(ix, iy, x, fs, nfs);
            if isempty(x1)
                break;
            end
            Nb1 = numel(x1);
            H{l_n} = A(x, x);
            T1{l_n} = A(x, x1);
            T2{l_n} = A(x1, x);
            l_n = l_n + 1;
            x = x1;
            s(l_n) = Nb1;
        end
        H{l_n} = A(x,x);
    end