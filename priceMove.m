function [  ] = priceMove(  )
    
    global n storePrice noOfStores storeCustomers;
    
    for i=1:noOfStores

        customerShare = storeCustomers(1,i)/(n*n); 
        
        if customerShare >= 1/noOfStores  
            mov = 3;
        else                              
            mov = randi(2,1,1);
        end
        
        if mov == 1 && storePrice(1,i) == 1
            mov = 2;
        end
        
        if mov == 1
            storePrice(1,i) = storePrice(1,i) - 1;
        end
        if mov == 3
            storePrice(1,i) = storePrice(1,i) + 1;
        end
        
    end

    updateCustomerGrid();
    calculateCustomers();    
    
end

