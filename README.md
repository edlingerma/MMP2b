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
