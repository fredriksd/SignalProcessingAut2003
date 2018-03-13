function matrix = invertMatrix(matrix_in)
    [imgRows, imgCols] = size(matrix_in);
    matrix = zeros(imgRows, imgCols);
    for i=1:imgRows
        for j=1:imgCols
            if matrix_in(i,j) == 1
               matrix(i,j) = 0;
            elseif matrix_in(i,j) == 0
                matrix(i,j) = 1;
            end
        end
    end

end