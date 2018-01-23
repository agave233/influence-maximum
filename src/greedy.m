function seeds = greedy(G,k)
seeds = []; %seeds = {}
for i = 1:k
    obj = -1e+10;
    fprintf("**%d**\n",i);
    for j = 1:1005
        if ~ismember(j,seeds)
            temp_seeds = [seeds,j];
            obj_temp = getInfluenceObj(G, temp_seeds);
            if (obj < obj_temp)
                obj = obj_temp;
                next_seeds = temp_seeds;
            end
        end
        fprintf("%d,%d,%d\n",i,j,next_seeds);
    end
    fprintf("**x%dx**\n",i);
    seeds = next_seeds;
end
end