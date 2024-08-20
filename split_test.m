function v=split_test(b,mindim,fun,std)
    k=size(b,3);
    v(1:k)=false;
    for i=1:k
        quadregion=b(:,:,i);
        if size(quadregion,1)<=mindim
                v(i)=false;
        continue
        end
            flag=fun(quadregion, std);
        if flag
                v(i)=true;
        end
    end
end