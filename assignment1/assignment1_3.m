%Assignment3
%Make a structure array with 20 movies, with its release year, rating and
%genre from IMDB. Make a function that based on given criterias can give
%out the movies who match the criterias. 

%Declaring 20 empty struct array elements
movieStruct(20).Movie = [];
movieStruct(20).Year = [];
movieStruct(20).Rating = [];
movieStruct(20).Genre = [];

%Elements for field "Movie"
movies = {'Hot Fuzz','The Expendables 2','The Expendables','Iron Man 2'...
    'Iron Man','Guardians of the Galaxy','Rogue One: A Star Wars Story',...
    'Star Wars V - The Empire Strikes Back','Star Wars VI - A New Hope',...
    'Star Wars VI - Return of the Jedi','Star Wars I - The Phantom Menace','Star Wars II - Attack of the Clones',...
    'Star Wars III - Revenge of the Sith','The Green Mile','The Lord of the Rings: The Fellowship of the Ring',...
    'The Lord of the Rings: The Two Towers','The Lord of the Rings: The Return of the King',...
    'The Dark Knight', 'The Big Lebowski','The Good, the Bad and the Ugly'};
%Elements for field "Year"
years = [2007, 2012, 2010, 2010, 2008, 2014, 2016, 1980, 1977, 1983, 1999,...
    2002, 2005, 1999, 2001, 2002, 2003, 2008, 1998, 1966];

%Elements for field "Rating"
ratings = [7.9, 6.6, 6.5, 7.0, 7.9, 8.1, 7.8, 8.8, 8.6, 8.3, 6.5, 6.6,...
    7.6, 8.5, 8.8, 8.7, 8.9, 9.0, 8.2, 8.9];

%Elements for field "Genre"
genres = {'Action/Comedy', 'Action/Adventure/Sci-Fi','Action/Adventure/Sci-Fi','Action/Adventure/Sci-Fi',...
    'Action/Adventure/Sci-Fi','Action/Adventure/Sci-Fi','Action/Adventure/Sci-Fi',...
    'Action/Adventure/Sci-Fi','Action/Adventure/Sci-Fi','Action/Adventure/Sci-Fi',...
    'Action/Adventure/Sci-Fi','Action/Adventure/Sci-Fi','Action/Adventure/Sci-Fi',...
    'Crime/Drama/Fantasy','Adventure/Drama/Fantasy','Adventure/Drama/Fantasy',...
    'Adventure/Drama/Fantasy','Action/Crime/Thriller','Comedy/Crime','Western'};

%Looping through the struct array and appending each
%element to its appropriate field
for i = 1:length(movieStruct)
    movieStruct(i).Movie = movies{i};
    movieStruct(i).Year = years(i);
    movieStruct(i).Rating = ratings(i);
    movieStruct(i).Genre = genres{i};
end



