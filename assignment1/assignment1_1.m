%Assignment 1 
%Create two matrices, a and b. a should be 3x4, and b 4x4.
clc, clear

a = [1,2,3,4;
    5,6,7,8;
    9,10,11,12];
b = [1,2,3,4;
    5,6,7,8;
    9,10,11,12;
    13,14,15,16];
disp('a = ')
disp(a)
disp('b = ')
disp(b)

out = matrixOperations(a,b);
disp('out = ')
disp(out)
diag_out = diag(out);

%Returning number of rows and columns
[rows, cols] = size(out);

%replacing the diagonal elements of out with 1
for i = 1:rows
   for j = 1:cols
       if i == j
            out(i,j) = 1;
       end
   end
end

disp('changed diagonal elements ')
disp('of out to 1: ')
disp(out)


outAdd = matrixAdd(a,b);
disp('outAdd = ')
disp(outAdd)

%Function that multiplies a with 10 and adds the 
%multiplication of a and b to that value.
%Results in a 3x4 matrix, which is saved to out.
function out = matrixOperations(a,b)
    out = 10 * a + (a*b);
end


%Advanced problem: Create a function that takes two matrices of different
%sizes and adds them assuming the missing elements or appended elements
%are zeros.
function out = matrixAdd(a,b)
    %Number of rows and columns
    [rowsa, colsa] = size(a);
    %Number of rows and columns
    [rowsb, colsb] = size(b);
    %New matrix has the maximum number of rows and 
    %columns based on a and b
    rowsOut = max(rowsa,rowsb);
    colsOut = max(colsa, colsb);
    out = zeros(rowsOut, colsOut);
    
    %Loop through the new array and 
    %append every element from a
    for i = 1:rowsa
       for j = 1:colsa 
           out(i,j) = a(i,j);
       end   
    end
    %Loop through the new array and
    %add the elements of b to those elements. 
    for i = 1:rowsb
        for j = 1:colsb
            out(i,j) = out(i,j) + b(i,j);
        end
    end
end







