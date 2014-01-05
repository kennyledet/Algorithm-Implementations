function [distance] = LevenshteinDistance(string1,string2)
%{
    Check for simple cases. First case would be if the string are already
    equal. Then if either are zero, then the distance would be the length 
    of the non-zero string.
%}
if(strcmpi(string1,string2) == 1)
    distance = 0;
    return;
end
string1_length = numel(string1);
string2_length = numel(string2);
if(string1_length == 0)
    distance = string2_length;
    return;
end
if(string2_length == 0)
    distance = string1_length;
    return;
end

%{
    Declare the smaller and larger strings. This is necessary so MATLAB
    does not throw an out of bounds error.
%}

if(string1_length > string2_length)
    largeString_length = string1_length;
    smallString_length = string2_length;
    largeString = string1;
    smallString = string2;
else
    largeString_length = string2_length;
    smallString_length = string1_length;
    largeString = string2;
    smallString = string1;
end

prevRow = (0:largeString_length);
workRow = prevRow;
%{
    Start by iterating through each letter of the smaller string.
    For each index, loop through every character of the larger string.
    If the character at the larger string does not equal the current
    character at the smaller string, add to the distance cost.
%}
for i=1:smallString_length
    for j=1:largeString_length
        if(smallString(i) == largeString(j))
            cost = 0;
        else
            cost = 1;
        end
        % Find the minimum cost for the next character.
        workRow(j+1) = min([workRow(j) + 1,prevRow(j) + 1,prevRow(j) + cost]);
    end
    prevRow = workRow(1:length(prevRow));
end
distance = workRow(end);
end