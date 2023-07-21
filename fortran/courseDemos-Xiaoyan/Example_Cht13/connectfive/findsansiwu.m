function M = findsansiwu (G)

M = 0*G;
ind = [1:size(G,1)*size(G,2)];
ind = reshape(ind,size(G,1),size(G,2));

for i=1:size(G,1)
    temp = G(i,:);
    temp = sansiwu(temp);
    M(i,:)=temp;
end

for i=1:size(G,2)
    temp = G(:,i);
    temp = sansiwu(temp');
    ptemp = (temp'>0).*temp';
    ntemp = (temp'<0).*temp';
    pM = (M(:,i)>0).*M(:,i);
    nM = (M(:,i)<0).*M(:,i);
    M(:,i)=max(ptemp,pM)+min(ntemp,nM);
end

for i=-size(G,1)+5:size(G,2)-5
    temp = diag(G,i);
    temp = sansiwu(temp');
    coord = (diag(ind,i))';
    ptemp = (temp>0).*temp;
    ntemp = (temp<0).*temp;
    pM = (M(coord)>0).*M(coord);
    nM = (M(coord)<0).*M(coord);
    M(coord)=max(ptemp,pM)+min(ntemp,nM);
end
    
for i=-size(G,1)+5:size(G,2)-5
    temp = diag(fliplr(G),i);
    temp = sansiwu(temp');
    coord = (diag(fliplr(ind),i))';
    ptemp = (temp>0).*temp;
    ntemp = (temp<0).*temp;
    pM = (M(coord)>0).*M(coord);
    nM = (M(coord)<0).*M(coord);
    M(coord)=max(ptemp,pM)+min(ntemp,nM);
end