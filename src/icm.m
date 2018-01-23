function total_infected = icm(G,seeds)
%G-Graph Data Structure
%active rounds-number of active rounds to run the diffusion process for
%initial_nodes-seeds for activation
%activation probability
T = 100;
active_nodes = seeds;
G1 = G;
%prev_length = 0;
edges = 0;
round = 1 ;
 %while((length(active_nodes)~=prev_length) && length(active_nodes)~=size(G.Nodes,1) )
 for i=1:T
    if i == 1
        active_nodes_last_round = active_nodes;
    else
        active_nodes_last_round = active_nodes_current_round;
    end
    active_nodes_current_round = [];
    %prev_length=length(active_nodes);
    prob = rand(1);
    for k = 1:length(active_nodes_last_round)
        %potential_infected = neighbors(G,active_nodes_last_round(k)); 
        u = active_nodes_last_round(k);
        potential_infected = find(G(u,:) > 0); %所有相邻节点
        Acommon = intersect(potential_infected,active_nodes); %并集
        %fprintf("%d %d %d\n",u,length(potential_infected),length(Acommon));
        potential_infected = setdiff(potential_infected,Acommon);%相邻点除去已激活的节点
        %fprintf("%d\n",length(potential_infected));
        for t = 1:length(potential_infected)
            v =potential_infected(t);
            %prob = rand(1);
            if(G(u,v) >= prob)
                %fprintf("%d %d\n",G(u,v),prob);
                active_nodes_current_round = [active_nodes_current_round v];
                edges = edges+1;
                %G=G.rmedge(u,v);
            else
                edges=edges+1;
                %G=G.rmedge(u,v);
            end      
        end
    end
    %fprintf("---%d %d\n",length(active_nodes),length( unique(active_nodes_current_round)));
    active_nodes = [active_nodes unique(active_nodes_current_round)];
    %round=round+1;
 end
 total_infected = length(active_nodes);
end
