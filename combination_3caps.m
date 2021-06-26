function [best_match, best_caps, con_type] = combination_3caps(capacitance_array, cap_req)


% this function cpmpute the combination of three capacitors
% all the cases are computed, based on the requirement to find out the
% minimum difference, called the best match

% [l,m,n] = ndgrid(capacitance_array, capacitance_array ,capacitance_array);

% C = {capacitance_array, capacitance_array ,capacitance_array};
% n = length(C);
% [C{:}] = ndgrid(C{:});
% C = reshape(cat(n+1,C{:}),[],n)


caps_combs = combvec(capacitance_array,capacitance_array,capacitance_array)';
cap1 = caps_combs(:,1);
cap2 = caps_combs(:,2);
cap3 = caps_combs(:,3);

caps_parallel = cap1 + cap2 + cap3;
[best_match_p, p] = min(abs(caps_parallel - cap_req));
best_match = best_match_p;
best_caps = caps_combs(p,:);
con_type = 'p';

caps_series = 1./(1./cap1 + 1./cap2 + 1./cap3);
[best_match_s, s] = min(abs(caps_series - cap_req));

if best_match > best_match_s
    best_match = best_match_s;
    best_caps = caps_combs(s,:);
    con_type = 's';
end

caps_p12s3 = 1./(1./(cap1 + cap2) + 1./cap3);
[best_match_p12s3, p12s3] = min(abs(caps_p12s3 - cap_req));

if best_match > best_match_p12s3
    best_match = best_match_p12s3;
    best_caps = caps_combs(p12s3,:);
    con_type = 'p12s3';
end

% caps_p13s2 = 1./(1./(cap1 + cap3) + 1./cap2);
% [best_match_p13s2, p13s2] = min(abs(caps_p13s2 - cap_req));
% 
% if best_match > best_match_p13s2
%     best_match = best_match_p13s2;
%     best_caps = caps_combs(p13s2,:);
%     con_type = 'p13s2';
% end
% 
% caps_p23s1 = 1./(1./(cap2 + cap3) + 1./cap1);
% [best_match_p23s1, p23s1] = min(abs(caps_p23s1 - cap_req));
% 
% if best_match > best_match_p23s1
%     best_match = best_match_p23s1;
%     best_caps = caps_combs(p23s1,:);
%     con_type = 'p23s1';
% end

caps_s12p3 = 1./(1./cap1 + 1./cap2) + cap3;
[best_match_s12p3, s12p3] = min(abs(caps_s12p3 - cap_req));

if best_match > best_match_s12p3
    best_match = best_match_s12p3;
    best_caps = caps_combs(s12p3,:);
    con_type = 's12p3';
end


% caps_s13p2 = 1./(1./cap1 + 1./cap3) + cap2;
% [best_match_s13p2, s13p2] = min(abs(caps_s13p2 - cap_req));
% 
% if best_match > best_match_s13p2
%     best_match = best_match_s13p2;
%     best_caps = caps_combs(s13p2,:);
%     con_type = 's13p2';
% end
% 
% caps_s23p1 = 1./(1./cap1 + 1./cap3) + cap2;
% [best_match_s23p1, s23p1] = min(abs(caps_s23p1 - cap_req));
% 
% if best_match > best_match_s23p1
%     best_match = best_match_s23p1;
%     best_caps = caps_combs(s23p1,:);
%     con_type = 's23p1';
% end



























