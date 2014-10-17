Soccerway
=========

Soccerway.com scrapping with R. May be some data exploration will be added.

### R files in "code" folder:
* ***soccerwayTeam.R*** - contains a function *soccerwayTeam(url)*. Takes url for the team squad info (for example, 
 see *data/URLpattern.txt* file) and reads the table.
* ***teamIDs.R*** - contains *teamIDs(url)*. Takes the page such as this: 
"http://int.soccerway.com/national/england/premier-league/20132014/regular-season/r21322/" and reads team IDs.
* ***loadSquadInfos.R*** - contains a function *loadSquadInfos(url,seasID,folder)*, which loads squad info for all the teams in the specified league at in specified season and loads it to the choosen folder. For the details about url and seasID parameters, see *data/League URLs.txt*  
* ***exploration.R*** - unfinished data exploration.
* ***exploration2.R*** - another unfinished data exploration.

### "data" folder

* ***URLpattern.txt*** - contains a pattern, which describes how to construct a url for the squad info of the certain team 
in the certain season for the further usage by the *soccerwayTeam(url)* function.
* ***Leagues 2013*** folder - contain squad info for top 5 euro leagues in the 2013-2014 season.
* ***League URLs.txt*** - a table with variables to use in *loadSquadInfos* function.
 
### "findings" folder
Contains some findings derived from datasets available.

* ***AvMatch.csv*** - avarage goals and cards quantity per match for top 5 european leagues.
* ***AvMatch-1.png*** and ***AvMatch-2.png*** - histograms for *AvMatch.csv*
* ***pos_age.csv*** - average age per postion.
* ***pos_gpm.csv*** - average goals per position.

