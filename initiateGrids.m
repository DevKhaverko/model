function [  ] = initiateGrids(  )

    global customerGrid n storeLocation storePrice noOfStores
    customerGrid = zeros(n);
    storeLocation = zeros(noOfStores, 2);
        
    t1 = randperm(n*n, noOfStores); 
    for i=1:noOfStores
        rowNo = ceil(t1(1,i)/n);
        columnNo = rem(t1(1,i),n);
        
        if columnNo == 0
            columnNo = 5;
        end
        
        storeLocation(i,1) = rowNo;
        storeLocation(i,2) = columnNo;
    end

    storePrice = [1, 10];
    
end

