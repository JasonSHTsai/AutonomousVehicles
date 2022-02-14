function index = classify(data)
index = [];
count = 1;
position_1 = 1;
for i = 2:length(data)
   if data(i,:)==data(i-1,:)
       count = count+1;
   else
       value = data(i-1,:);
       position_2 = i-1;
       index = [index;[value count position_1 position_2]];
       position_1 = i;
       count = 1;
   end
end
index = [index;[data(end,:) (length(data)-position_1+1) position_1 length(data)]];
end