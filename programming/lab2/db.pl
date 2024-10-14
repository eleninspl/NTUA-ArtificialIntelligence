/* GENRE 1-3 */
commonGenre(Movie1, Movie2, Genre) :-
    genre(Movie1, Genre),
    genre(Movie2, Genre),
    Movie1 \= Movie2.

atLeastOneCommonGenre(Movie1, Movie2) :-
    commonGenre(Movie1, Movie2, Genre).
    
atLeastTwoCommonGenres(Movie1, Movie2) :-
    commonGenre(Movie1, Movie2, Genre1),
    commonGenre(Movie1, Movie2, Genre2),
    Genre1 \= Genre2.
    
atLeastThreeCommonGenres(Movie1, Movie2) :-
    commonGenre(Movie1, Movie2, Genre1),
    commonGenre(Movie1, Movie2, Genre2),
    commonGenre(Movie1, Movie2, Genre3),
    Genre1 \= Genre2,
    Genre2 \= Genre3,
    Genre3 \= Genre1.
    
atLeastFourCommonGenres(Movie1, Movie2) :-
    commonGenre(Movie1, Movie2, Genre1),
    commonGenre(Movie1, Movie2, Genre2),
    commonGenre(Movie1, Movie2, Genre3),
    commonGenre(Movie1, Movie2, Genre4),
    Genre1 \= Genre2,
    Genre1 \= Genre3,
    Genre1 \= Genre4,
    Genre2 \= Genre3,
    Genre2 \= Genre4,
    Genre3 \= Genre4.

/* DIRECTOR 4 */    
sameDirector(Movie1, Movie2) :-
    director(Movie1, Director),
    director(Movie2, Director),
    Movie1 \= Movie2.

/* PLOT 5-6 */  
commonKeyword(Movie1, Movie2, Keyword) :- 
    plot_keyword(Movie1, Keyword), 
    plot_keyword(Movie2, Keyword), 
    Movie1 \= Movie2.
    
atLeastOneCommonKeyword(Movie1, Movie2) :- 
    commonKeyword(Movie1, Movie2, Keyword).
    
atLeastTwoCommonKeywords(Movie1, Movie2) :- 
    commonKeyword(Movie1, Movie2, Keyword1), 
    commonKeyword(Movie1, Movie2, Keyword2), 
    Keyword1 \= Keyword2.
    
atLeastThreeCommonKeywords(Movie1, Movie2) :- 
    commonKeyword(Movie1, Movie2, Keyword1), 
    commonKeyword(Movie1, Movie2, Keyword2), 
    commonKeyword(Movie1, Movie2, Keyword3), 
    Keyword1 \= Keyword2, 
    Keyword2 \= Keyword3, 
    Keyword2 \= Keyword1.

atLeastFourCommonKeywords(Movie1, Movie2) :- 
    commonKeyword(Movie1, Movie2, Keyword1), 
    commonKeyword(Movie1, Movie2, Keyword2), 
    commonKeyword(Movie1, Movie2, Keyword3), 
    commonKeyword(Movie1, Movie2, Keyword4), 
    Keyword1 \= Keyword2, 
    Keyword1 \= Keyword3, 
    Keyword1 \= Keyword4, 
    Keyword2 \= Keyword3, 
    Keyword2 \= Keyword4, 
    Keyword3 \= Keyword4.

/* ACTORS 7-9 */
commonActor(Movie1, Movie2, Actor) :- 
    actor_name(Movie1, Actor), 
    actor_name(Movie2, Actor), 
    Movie1 \= Movie2.
    
atLeastOneCommonActor(Movie1, Movie2) :- 
    commonActor(Movie1, Movie2, Actor).

atLeastTwoCommonActors(Movie1, Movie2) :- 
    commonActor(Movie1, Movie2, Actor1), 
    commonActor(Movie1, Movie2, Actor2), 
    Actor1 \= Actor2.

ThreeCommonActors(Movie1, Movie2) :- 
    commonActor(Movie1, Movie2, Actor1), 
    commonActor(Movie1, Movie2, Actor2), 
    commonActor(Movie1, Movie2, Actor3), 
    Actor1 \= Actor2, 
    Actor1 \= Actor3, 
    Actor2 \= Actor3.
 
/* LANGUAGE 10 */  
sameLanguage(Movie1, Movie2) :- 
    language(Movie1, Language), 
    language(Movie2, Language), 
    Movie1 \= Movie2.

/* COLOR 11 */
blacknWhite(Movie1) :- plot_keywords(Movie1, "black and white").

/* PRODUCTION COMPANY 12 */
sameProductionCompany(Movie1, Movie2) :- 
    production_company(Movie1, Company), 
    production_company(Movie2, Company), 
    Movie1 \= Movie2.
    
/* PRODUCTION COUNTRY 13 */
sameProductionCountry(Movie1, Movie2) :-
    production_country(Movie1, Country),
    production_country(Movie2, Country),
    Movie1 \= Movie2.

/* DECADE 14 */
sameDecade(Movie1, Movie2) :-
    decade(Movie1, Decade),
    decade(Movie2, Decade),
    Movie1 \= Movie2.
	
/* FIND SIMILAR */
find_sim_1(Movie1, Movie2) :- 
	atLeastOneCommonGenre(Movie1, Movie2),
	atLeastOneCommonKeyword(Movie1, Movie2).

find_sim_2(Movie1, Movie2) :- 
	atLeastTwoCommonGenres(Movie1, Movie2),
	atLeastOneCommonKeyword(Movie1, Movie2),
	sameLanguage(Movie1, Movie2).
	
find_sim_3(Movie1, Movie2) :- 
	atLeastTwoCommonGenres(Movie1, Movie2),
	atLeastOneCommonKeyword(Movie1, Movie2),
	atLeastOneCommonActor(Movie1, Movie2),
	sameLanguage(Movie1, Movie2).

find_sim_4(Movie1, Movie2) :- 
	atLeastTwoCommonGenres(Movie1, Movie2),
	atLeastTwoCommonKeywords(Movie1, Movie2),
	atLeastOneCommonActor(Movie1, Movie2),
	sameDirector(Movie1, Movie2),
	sameLanguage(Movie1, Movie2).
	
find_sim_5(Movie1, Movie2) :- 
	atLeastTwoCommonGenres(Movie1, Movie2),
	atLeastTwoCommonKeywords(Movie1, Movie2),
	atLeastTwoCommonActors(Movie1, Movie2),
	sameDirector(Movie1, Movie2),
	sameLanguage(Movie1, Movie2).