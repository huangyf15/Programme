function I = sansiwu (J)

I = zeros(1,length(J));

for i=1:length(J)-4
    It = J(i:i+4);
%%
    if It == [0 1 1 1 0]
        I(i+1:i+3)=3;
    end
    if It == [0 -1 -1 -1 0]
        I(i+1:i+3)=-3;
    end

    if (It == [0 1 1 1 1])
        I(i+1:i+4)=3;
    end
    if (It == [0 -1 -1 -1 -1])
        I(i+1:i+4)=-3;
    end

    if (It == [1 1 1 1 0])
        I(i:i+3)=3;
    end

    if (It == [-1 -1 -1 -1 0])
        I(i:i+3)=-3;
    end
   
    if (It == [1 1 0 1 1])
        I([i:i+1,i+3:i+4])=3;
    end

    if (It == [-1 -1 0 -1 -1])
        I([i:i+1,i+3:i+4])=-3;
    end
    
    if (It == [1 0 1 1 1])
        I([i,i+2:i+4])=3;
    end

    if (It == [-1 0 -1 -1 -1])
        I([i,i+2:i+4])=-3;
    end
    
    if (It == [1 1 1 0 1])
        I([i:i+2,i+4])=3;
    end

    if (It == [-1 -1 -1 0 -1])
        I([i:i+2,i+4])=-3;
    end

end

%%
for i =1:length(J)-5
    It = J(i:i+5);
    if (It == [0 1 1 1 1 -1])
        I(i+1:i+4)=3;
    end
    if (It == [0 -1 -1 -1 -1 1])
        I(i+1:i+4)=-3;
    end

    if (It == [-1 1 1 1 1 0])
        I(i+1:i+4)=3;
    end

    if (It == [1 -1 -1 -1 -1 0])
        I(i+1:i+4)=-3;
    end
    
    if (It == [0 1 1 0 1 0])
        I([i+1:i+2,i+4])=3;
    end

    if (It == [0 -1 -1 0 -1 0])
        I([i+1:i+2,i+4])=-3;
    end
    
    if (It == [0 1 0 1 1 0])
        I([i+1,i+3:i+4])=3;
    end

    if (It == [0 -1 0 -1 -1 0])
        I([i+1,i+3,i+4])=-3;
    end

    if (It == [0 1 1 1 1 0])
        I(i+1:i+4)=4;
    end

    if (It == [0 -1 -1 -1 -1 0])
        I(i+1:i+4)=-4;
    end

end

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