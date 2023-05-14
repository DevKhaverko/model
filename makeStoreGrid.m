function [ storeGrid ] = makeStoreGrid( n, storeLocation )

    storeGrid = zeros(n);
    rows = size(storeLocation);
    rows = rows(1,1);
    
    for i=1:rows
        storeGrid(storeLocation(i,1), storeLocation(i,2)) = i;
    end
    
end

