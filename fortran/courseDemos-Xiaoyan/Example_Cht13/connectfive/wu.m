function I = wu (J)

I = zeros(1,length(J));

%%
for i=1:length(J)-4
        It = J(i:i+4);
        if It == [1 1 1 1 1]
            I(i:i+4)=5;
        end
        if It == [-1 -1 -1 -1 -1]
            I(i:i+4)=-5;
        end
    end

end