function data = smooth(data,index,range)
for i = size(index,1):-1:2
    if index(i,2) < range
       for j = i:-1:1%%���e��̪񪺤j������
           if index(j,2) >= range
              data(index(i,3):index(i,4)) = index(j,1);
              break;
           else
               data(index(i,3):index(i,4)) = index(1,1);%%���e�䤣��j�����Ȯɥt���_�l��
           end
       end
    end
end
 if index(1,2) < range
     for i = 2:size(index,1)
         if index(i,2) >= range
             data(index(1,3):index(1,4)) = index(i,1);
             break;    
         end
     end
 end
end