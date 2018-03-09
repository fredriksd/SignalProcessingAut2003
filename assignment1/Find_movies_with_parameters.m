%Function that lists up the movies that match to the 
%criterias given.

%Genres to choose from:
%Action
%Comedy
%Sci-Fi
%Adventure
%Drama
%Fantasy
%Western

function [] = Find_movies_with_parameters(year_search, average_rating_search, genre_search)
    %Including the variables from assignment1_3.m
    assignment1_3;
    %Counter variable
    movies = 0;
    fprintf("Year_search: %d or later, average_rating: %.2f or above, genre_search: %s \n",...
        year_search, average_rating_search, genre_search);
    %Loop through the structure array
    for i = 1:length(movieStruct)
        %Checking criterias...
        if movieStruct(i).Year >= year_search...
                && movieStruct(i).Rating >= average_rating_search...
                && contains(movieStruct(i).Genre,genre_search)
            %If movie found, increment movies and print out the name
            %Of that movie
            movies = movies + 1;
            fprintf('Matching demands: %s \n', movieStruct(i).Movie);
        end
    end
    %If nothing could be found, then display that..
    if movies == 0
       disp('Nothing could be found!')
    end
end