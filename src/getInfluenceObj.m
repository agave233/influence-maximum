function inf_mean = getInfluenceObj(G, seedset)

%T = 100; % number of runs
inf_value = zeros(1,5);

for t=1:2
    node_state = zeros(1,1005);
    node_state(seedset) = ones(1,length(seedset));
    rand_matrix = rand(1005);
    edge_state = G > rand_matrix; 
    new_member = seedset;
    while (~isempty(new_member))
        novice = [];
        temp_node_state = node_state;
        for i=1:length(new_member)
            temp_node_state = ((temp_node_state + edge_state(new_member(i),:)) > 0); 
            novice = union(novice,find((edge_state(new_member(i),:)-node_state)>0));
        end  
        new_member = novice;
        node_state = temp_node_state;
    end
    inf_value(t) = sum(node_state);
end
inf_mean = mean(inf_value);
end