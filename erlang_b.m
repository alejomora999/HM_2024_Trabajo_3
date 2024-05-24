% function pk = erlang_b(a,k)
%     if (k==1)
%         pk = 1+1/a;
%     else
%         pk = 1+1/a;
%         for i=2:1:k
%             tmp = pk;
%             pk = 1 + ((tmp*i)/a);
%         end
%     end
%     pk = 1/pk;
% end
function pk = erlang_b(a, k)
    if k == 1
        pk = a/(1 + a);
    else
        pk_1=a*(erlang_b(a, k - 1));
        pk = (pk_1/(k+pk_1));
    end
end