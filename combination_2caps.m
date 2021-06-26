function [best_match, best_caps, con_type] = combination_2caps(capacitance_array, cap_req)

best_match = 0;
best_caps = [];
con_type = '';

caps_combs = combvec(capacitance_array,capacitance_array)';
cap1 = caps_combs(:,1);
cap2 = caps_combs(:,2);


% [m,n] = ndgrid(capacitance_array,capacitance_array);
% cap1 = m(:)
% cap2 = n(:)



caps_parallel = cap1 + cap2;
[best_match_p, p] = min(abs(caps_parallel - cap_req));
best_match = best_match_p;
best_caps = [cap1(p) cap2(p)];
con_type = 'p';

caps_series = cap1.*cap2./(cap1 + cap2); 
[best_match_s, s] = min(abs(caps_series - cap_req));
% best_match_s
% caps_series(s)

if best_match > best_match_s
    best_match = best_match_s;
    best_caps = [cap1(s) cap2(s)];
    con_type = 's';
end
