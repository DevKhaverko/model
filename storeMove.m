function [  ] = storeMove(  )

    global customerGrid n storeLocation noOfStores storeCustomers storeGrid;
    
    storeLocationOld = storeLocation;
    customerGridOld = customerGrid;
    storeCustomersOld = storeCustomers;
    
    storeLocationNew = storeLocation;
    
    
    for i=1:noOfStores
        x = storeLocation(i,1);
        y = storeLocation(i,2);
        
       
        temp=1;
        
        while temp == 1
                dir = randi(4,1,1);

                temp=0;               
                
                if x==1 && dir==1
                    while dir==1
                        dir = randi(4,1,1);
                    end
                end
                if y==1 && dir==4
                    while dir==4
                        dir = randi(4,1,1);
                    end
                end
                if x==n && dir==3
                    while dir==3
                        dir = randi(4,1,1);
                    end
                end
                if y==n && dir==2
                    while dir==2
                        dir = randi(4,1,1);
                    end
                end

                if dir==1
                    storeLocation(i,1) = x-1;
                end
                if dir==2
                    storeLocation(i,2) = y+1;
                end
                if dir==3
                    storeLocation(i,1) = x+1;
                end
                if dir==4
                    storeLocation(i,2) = y-1;
                end
                
                if (x==1 && y==1) || (x==1 && y==n) || (x==n && y==1) || (x==n && y==n)
                    limit=2;
                elseif x==1 || x==n || y==1 || y==n
                    limit=3;
                else
                    limit=4;
                end

                count=0;
                for j=1:noOfStores
                    if (j~=i) && (storeLocation(i,1) == storeLocationNew(j,1)) && (storeLocation(i,2) == storeLocationNew(j,2))
                        temp = 1;
                        count = count + 1;
                    end
                end
                
                if count == limit
                    storeLocation(i,1) = storeLocationOld(i,1);
                    storeLocation(i,2) = storeLocationOld(i,2);
                end
        end
                
        updateCustomerGrid();
        calculateCustomers();
        
        if storeCustomers(1,i) > storeCustomersOld(1,i) 
            storeLocationNew(i,1) = storeLocation(i,1);
            storeLocationNew(i,2) = storeLocation(i,2);
        else
            storeLocationNew(i,1) = storeLocationOld(i,1);
            storeLocationNew(i,2) = storeLocationOld(i,2);
        end
        
        storeLocation = storeLocationOld;
        customerGrid = customerGridOld;
        storeCustomers = storeCustomersOld;
        
    end
    
    storeLocation = storeLocationNew;
    updateCustomerGrid();
    calculateCustomers();
    storeGrid = makeStoreGrid(n, storeLocation);
end

