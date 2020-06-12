# README

This is our MMP2b from Maria Edlinger, Jonathan Lex and Markus Wallner

## Up and running

``rails s`` Starts rails server

``npm run lint`` Starts standard linting

``npm run server`` Starts webpack-Server for development

## Tests

``rails spec`` Runs all tests

``rails spec:system`` Runs the system tests

## Caching
 
vorher:  
![vorher](vorher.png "Vorher")  

### 1. Fragment Caching
danach haben wir Fragment Caching angewandt  
![nachher](nachher1.png "Nachher1")  

### 2. Russian Doll Caching
Wir hatten das Problem, dass wenn eine Activity bearbeitet wurde, der alte Cache geladen wurde, weil eine Abhängigkeit von den Challenges zu den Activities fehlte. Deshalb diese Verbesserung im Code:  
![nachher](nachher2.png "Nachher2")  

### 3. n+1 queries
 
vorher:  
![vorher](vorher3.png "Vorher")  

wir haben users und requests included:  
![nachher](nachher3.png "Nachher")  


### 4. zusätzliches Fragment Caching  

bei Punkt 1 & 2 wo wir die Show-Seite gecacht haben, hatten wir das Problem, dass die Seite unterschiedlich aussieht abhängig davon ob ein User eingeloggt ist oder nicht. Deshalb mussten wir das Fragment Caching entfernen und haben es auf jede Challenge der Index-Seite angewandt.  

vorher:  
![vorher-home](vorher-4.png "Vorher")  
nachher:  
![nachher-home](nachher-4.png "Nachher")  


## Forschungsfragen
Was bring Caching bei dieser App?  
**Performanceverbesserung**  
Bei dieser App zahlt sich besonders das Fragment Caching aus. Die Challenges auf der Index-Seite sieht jeder User gleich. 
In Bezug auf 3. n+1 queries: Hier zahlt es sich aus einmal alle User der Challenges abzufragen, da es sein kann, dass eine Challenge sehr viele Mitglieder haben kann und für jedes einzelne Mitglied eine eigene SQL-Abfrage getätigt werden müsste. Durch die Umsetzung der Verbesserung konnten wir eine Verringerung der Ladezeit feststellen.  
* Bei der Index-Seite (4) um mehr als die Hälfte (560 Millisekunden) 
* Bei der Show-Seite (3) um genau 257.2 Millisekunden, indem statt 20 SQL-Abfragen nur 15 durchgeführt werden mussten.

  
Ist die Messung in development gleich wie in production? Hätte die Messung in development ausgereicht?  
Dadurch, dass wir Caching auch für Development enabled haben, liefert die Messung ähnliche Ergebnisse wie in Production.  
Ein Unterschied könnte entstehen, weil in Development die Caching-Fragments auf der Festplatte gespeichert werden (tmp/file_store) während sie in Production im Arbeitsspeicher gespeichert werden (memorystore).