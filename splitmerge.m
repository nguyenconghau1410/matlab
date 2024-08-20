function g = splitmerge(f,mindim,fun, std)
    q=2^nextpow2(max(size(f)));
    [row,col]=size(f);
    f=padarray(f,[q-row,q-col],'post');
    z=qtdecomp(f,@split_test,mindim,fun,std);
    Lmax=full(max(z(:)));
    g=zeros(size(f));
    marker=zeros(size(f));
    for k=1:Lmax
        [vals,r,c]=qtgetblk(f,z,k);
        if ~isempty(vals)
            disp(vals);
            for i=1:length(r)
                xlow=r(i);
                ylow=c(i);
                xhigh=xlow+k-1;
                yhigh=ylow+k-1;
                region = f(xlow:xhigh,ylow:yhigh);
                flag=fun(region, std);
                if flag
                    g(xlow:xhigh,ylow:yhigh)=1;
                    marker(xlow,ylow)=1;
                end
            end
        end
    end
    g=bwlabel(imreconstruct(marker,g));
    g=g(1:row,1:col);
end

% function flag=predicate(region)
%     sd=std2(region);
%     m=mean2(region);
%     flag=(sd>10) & (m>0) & (m<125);
% end

% function v=split_test(b,mindim,fun)
%     k=size(b,3);
%     v(1:k)=false;
%     for i=1:k
%         quadregion=b(:,:,i);
%         if size(quadregion,1)<=mindim
%                 v(i)=false;
%         continue
%         end
%             flag=fun(quadregion);
%         if flag
%                 v(i)=true;
%         end
%     end
% end