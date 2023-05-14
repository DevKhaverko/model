function [ distance ] = distanceFormula( price, customerLocation, storeLocation )

    dis1 = sqrt(dot( storeLocation - customerLocation , storeLocation - customerLocation ));
    dis2 = price;
    
    distance = dis1 + dis2;
    
end

