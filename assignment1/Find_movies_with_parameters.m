function [] = Find_movies_with_parameters(year_search, average_rating_search, genre_search)
    assignment1_3;
    movies = 0;
    fprintf("Year_search: %d, average_rating: %.2f, genre_search: %s \n",...
        year_search, average_rating_search, genre_search);
    
    for i = 1:length(movieStruct)
        if movieStruct(i).Year >= year_search...
                && movieStruct(i).Rating >= average_rating_search...
                && contains(movieStruct(i).Genre,genre_search)
            movies = movies + 1;
            fprintf('Matching demands: %s \n', movieStruct(i).Movie);
        end
    end
    if movies == 0
       disp('Nothing could be found!')
    end
end