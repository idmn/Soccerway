Soccerway
=========

Soccerway.com scrapping with R. May be some data exploraion will be added.
Files:
* soccerwayTeam.R - contains function soccerwayTeam(url). Takes url for the team squad info (for example, 
"http://int.soccerway.com/teams/england/chelsea-football-club/661/squad/") and reads the table.
* teamIDs.R - contains teamIDs(url). Takes the page such as this: 
"http://int.soccerway.com/national/england/premier-league/20132014/regular-season/r21322/" and reads team IDs.
* URLpattern.txt - contains a pattern, which describes how to construct a url for the squad info of the certain team 
in the certain season for the further usage by the soccerwayTeam(url) function.
* loadPremier2013.R - this script loads a squad infos for all the teams, which participated in Premier League 2013-2014.
All the information is written in the data variable.
* Premier2013 folder - contains squad infos for the Premier League 2013-2014 season.
* exploration.R - some data exploration.
