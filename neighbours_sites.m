function x=neighbours_sites(ix,iy,m)
    yp=find(ix==m);
    for j=1:size(yp)
        x(j)=iy(yp(j));
    end
end