mpc = loadcase('case_ACTIVSg70k'); % your test system
mpc = ext2int(mpc);
[baseMVA, bus, gen, branch] = deal(mpc.baseMVA, mpc.bus, mpc.gen, mpc.branch);
[Ybus, Yf, Yt] = makeYbus(baseMVA, bus, branch);
Ybus=Ybus-100*1i*sparse(mpc.gen(:,1), mpc.gen(:,1), ones(1,length(mpc.gen(:,1))),length(Ybus), length(Ybus));
n = length(Ybus); 

[row,column,value] = find(Ybus);
A = sparse(row,column,real(value),n,n);
B = sparse(row,column,imag(value),n,n);

x = [4 85 196]; % your selected elements
[T1, H, T2, s] = sparse_to_block(B, x);
invB = invb(T1, H, T2); 
