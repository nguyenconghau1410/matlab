function flag=predicate(region,std)
    sd=std2(region);
    m=mean2(region);
    flag=(sd>std) & (m>0) & (m<125);
end