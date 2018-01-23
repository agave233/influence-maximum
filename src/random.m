function seeds = random(k)
    a = cell(k,1);
    b = zeros(1005,1);
    i = 1;
    while i <= k
        temp = unidrnd(1005);
        if b(temp,1) == 0
            a{i,1} = temp;
            b(temp,1) = 1;
            i = i + 1;
        end
        %fprintf("%d %d\n",i,temp);
    end
    seeds = cell2mat(a)';
end