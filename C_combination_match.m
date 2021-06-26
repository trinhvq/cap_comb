close all 
clear all

% this program is used to compute the combination of the existing
% capacitors to be closest to the required capacitor
% This program is limited until the combination of three capacitors only,
% which can achieve the difference less than 0.1 for most of the requirements
% INPUTS incldues:
% capacitance_array: existing capacitors
% cap_req: the requirement 
% OUTPUTS are:
% best_match: the smallest difference between the combination and the requirement
% best_cap: the combination of capacitors corresponding to the best_match
% con_type: show how the capacitors in the combination are connected
% following are schemes of connecting the capacitors in the combination
% 'p': all capacitors connected in parallel
% 's': all capacitors connected in series
% 'p12s3': in the combination shown above, the capacitors 1 & 2 connected
% in parallel then all of them connected in series with capacitor 3
% 's12p3': in the combination shown above, the capacitors 1 & 2 connected
% in series then all of them connected in parallel with capacitor 3

% capacitance_array = [3.3 4.7 6.8];
capacitance_array = [3.3 3.9 4.7 6.8 8.2 10 15 18 22 27 33 47 68 100 180];
% combos = combntns(capacitance_array,2) % old version
cap_req = 17.4

%% looking for single capacitor matching the requirement
[best_match, c] = min(abs(capacitance_array - cap_req));
best_cap = [capacitance_array(c)];
con_type = 'single';

%% looking for two-capacitor combination matching the requirement
[best_match_2caps, best_caps_2caps, con_type_2caps] = combination_2caps(capacitance_array, cap_req);
if best_match > best_match_2caps
    best_match = best_match_2caps;
    best_cap = best_caps_2caps;
    con_type = con_type_2caps;
end

best_match_2caps
best_caps_2caps
con_type_2caps

%% looking for three-capacitor combination matching the requirement
[best_match_3caps, best_caps_3caps, con_type_3caps] = combination_3caps(capacitance_array, cap_req);
if best_match > best_match_3caps
    best_match = best_match_3caps;
    best_cap = best_caps_3caps;
    con_type = con_type_3caps;
end

%% printing the best result
best_match
best_cap
con_type
