%read data
[u,v,w] = textread('../data/graph.txt','%n%n%n',25572);
G = zeros(1005,1005);
for i = 2:25572
   G(u(i)+1,v(i)+1) = w(i);
end
fprintf("read done!\n");
%random
seeds_random = random(20);
random_out = fopen('../output/random.txt','wt');
for i = 1:20
    sum = 0;
    for j = 1:100
        sum = icm(G,seeds_random(1:i)) + sum;
    end
    fprintf(random_out, '%d,', seeds_random(1:i));
    fprintf(";%d\n\r",sum/100);
end
fprintf("random done!\n");

%degree_centrality
seeds_degree = degree_centrality(G,20);
degree_out = fopen('../output/random.txt','wt');
for i = 1:20
    sum = 0;
    for j = 1:100
        sum = icm(G,seeds_degree(1:i)) + sum;
    end
    fprintf(degree_out, '%d,', seeds_degree(1:i));
    fprintf(";%d\n\r",sum/100);
end
fprintf("degree_centrality done!\n");

%closeness_centrality
seeds_closeness = closeness_centrality(G,20);
closeness_out = fopen('../output/closeness_centrality.txt','wt');
for i = 1:20
    sum = 0;
    for j = 1:100
        sum = icm(G,seeds_closeness(1:i)) + sum;
    end
    fprintf(closeness_out, '%d,', seeds_closeness(1:i));
    fprintf(";%d\n\r",sum/100);
end
fprintf("closeness_centrality done!\n");

%greedy
seeds_greedy = greedy(G,20);
greedy_out = fopen('../output/greedy.txt','wt');
for i = 1:20
    sum = 0;
    for j = 1:100
        sum = icm(G,seeds_greedy(1:i)) + sum;
    end
    fprintf(greedy_out, '%d,', seeds_greedy(1:i));
    fprintf(";%d\n\r",sum/100);
end
fprintf("greedy done!\n");
