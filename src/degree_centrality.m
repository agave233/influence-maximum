function seeds = degree_centrality(G,k)
%sum of in_degree and out_degree
A = zeros(1005,2);
A(1:1005,1) = 1:1005;
for i = 1:1005
    for j = 1:1005
        if G(i,j) > 0
            A(i,2) = A(i,2) + 1;
            A(j,2) = A(j,2) + 1;
        end
    end
end
A = sortrows(A,2,'descend');
seeds = A(1:k,1)';
end