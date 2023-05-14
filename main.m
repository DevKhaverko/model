clc
clear all
close all

global customerGrid n storeLocation storePrice noOfStores storeCustomers storeGrid;


n = 50;
noOfStores = 2;
timeSteps = 400;

for i=1:noOfStores
    legendInfo{i} = ['Store ', num2str(i)];  
end

storeCustomersHistory = zeros(timeSteps, noOfStores);
storePriceHistory = zeros(timeSteps, noOfStores);

map = [135,206,250; 255,182,193; 0,0,256; 256,0,0];
map = map/256;

initiateGrids();

storeGrid = makeStoreGrid(n, storeLocation);

updateCustomerGrid();
calculateCustomers();

storeCustomersHistory(1,:) = storeCustomers;
storePriceHistory(1,:) = storePrice;
%%
h = figure(1);
axis tight manual
filename = 'g.gif';

subplot(2,2,[1 3]);
image(customerGrid, 'CDataMapping', 'scaled');
colorbar('Ticks',[1.5 2.17 2.83 3.5],'TickLabels',{'Customers of Store 1','Customers of Store 2','Store 1','Store 2'});
colormap(map)
caxis([1 4]);
title('Customer prefered store');

subplot(2,2,2);
for j=1:noOfStores
    plot(1, storeCustomersHistory(1, j));
    hold on;
end
title('StoreWise number of customers');
legend(legendInfo);
xlabel('Time steps');
ylabel('Number of customers');
hold off

subplot(2,2,4);
for j=1:noOfStores
    plot(1, storePriceHistory(1, j));
    hold on;
end
title('StoreWise Prices');
legend(legendInfo);
xlabel('Time steps');
ylabel('Price (in AU)');
hold off

pause();


for i=1:timeSteps
    if rem(i,2) == 0
        storeMove();
    else
        priceMove();
    end
    
    storeCustomersHistory(i,:) = storeCustomers;
    storePriceHistory(i,:) = storePrice;
    
    subplot(2,2,[1 3]);
    image(customerGrid, 'CDataMapping', 'scaled');
    colorbar('Ticks',[1.5 2.17 2.83 3.5],'TickLabels',{'Customers of Store 1','Customers of Store 2','Store 1','Store 2'});
    colormap(map);
    caxis([1 4]);
    title('Customer prefered store');
    
    subplot(2,2,2);
    for j=1:noOfStores
        plot(1:i, storeCustomersHistory(1:i, j));
        hold on;
    end
    title('StoreWise number of customers');
    legend(legendInfo);
    xlabel('Time steps');
    ylabel('Number of customers');
    hold off
  
    subplot(2,2,4);
    for j=1:noOfStores
        plot(1:i, storePriceHistory(1:i, j));
        hold on;
    end
    title('StoreWise Prices');
    legend(legendInfo);
    xlabel('Time steps');
    ylabel('Price (in AU)');
    hold off
  
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 

      if i == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 
    
    pause(0.001);
end


    