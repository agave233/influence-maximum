function seeds = closeness_centrality(G,k)
W = ones(25571,1);
S = zeros(25571,1);
E = zeros(25571,1);
t = 1;
for i = 1:1005
    for j = 1:1005
        if G(i,j) > 0
            S(t) = i;
            E(t) = j;
            t = t + 1;
        end
    end
end
G1 = sparse(S,E,W);%关联矩阵的稀疏矩阵表
G1(1005,1005)=0;
fprintf("G1 generate done!\n");
A = cell(1005,1005);
record = zeros(1,1005);
for i = 1:1005
    for j = 1:1005
        [Dist,~] = graphshortestpath(G1,i,j,'Method','Dijkstra');
        A{i,j} = Dist;
        if Dist == Inf
            record(1,i) = record(1,i) + 1;
        end
    end
    fprintf("closeness %d\n",i);
end
for i = 1:1005
    for j = 1:1005
        if record(1,j) > 100
            A{i,j} = 0;
        end
    end
end
M = cell2mat(A);
Add = cumsum(M,2);
V(1:1005,1) = 1:1005; 
V(1:1005,2) = Add(:,1005);
V = sortrows(V,2);
seeds = V(1:k,1)';
%[Dist,Path] = graphshortestpath(G,6,9,'Method','Dijkstra');
%set(H.Nodes(Path),'Color',[1 0.4 0.4]);%以下三条语句用红色修饰最短路径
%edges=getedgesbynodeid(H,get(H.Nodes(Path),'ID'));
%fprintf("%d\n",V(1));
end