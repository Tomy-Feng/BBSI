 function [x1, fs1, nfs1] = next_block(ix, iy, x, fs, nfs)
        Nb = size(x,2);
        fs1 = fs;
        nfs1 = nfs;
        Counter = 0;
        for j = 1:Nb
            nx = neighbours_sites(ix, iy, x(j));
            for k = 1:numel(nx)
                if ~ismember(nx(k), fs1)
                    Counter = Counter + 1;
                    nfs1 = nfs1 + 1;
                    fs1(nfs1) = nx(k);
                    x1(Counter) = nx(k);
                end
            end
        end
    end