# Datatolkare #

Den här uppgiften går ut på att skriva ett program som läser in en fil med väderdata för en månad
och returnerar data för dagen med störst skillnad mellan lägsta och högsta uppmätta temperatur.

## Bedömningsmatris ##

### Planering ###

| Förmågor                         | E 																																   | C | A |
|----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|---|---|
| Aktivitetsdiagram och pseudokod  | Du använder pseudokod och/eller aktivitetsdiagram för att planera dina uppgifter utifrån exempel, eller i samråd med utbildaren.  | Som för E, men utan exempel eller handledning |   |
| Anpassning					   | Du anpassar med viss säkerhet planeringen till uppgiften 																		   |   | Som för E, men med säkerhet
| Utformning                       | Du väljer med viss säkerhet lämpliga kontrollstrukturer, metoder, variabler, datastrukturer och algoritmer | | Som för E, men du väljer med säkerhet, och motiverar utförligt dina val.|
| Utvärdering | Med viss säkerhet utvärderar du, med enkla omdömen, programmets prestanda, använder datalogiska begrepp, och bedömer din egen förmåga | som för E, men med nyanserade omdömen | Som för C, men med säkerhet, och med förbättringsförslag

### Syntax och Teori ###
| Förmågor                                       | E 																			| C | A |
|------------------------------------------------|------------------------------------------------------------------------------|---|---|
| Datatyper					                     | Du kan redogöra för och använda de vanligaste datatyperna                    |   |   |
| Grundläggande syntax		                     | Du kan redogöra för och använda programmeringsspråkets grundläggande syntax  |   |   |
| Villkor och IF-satser		                     | Du kan redogöra för och använda villkor och IF-satser                        |   |   |
| Loopar & iteration                             | Du kan redogöra för och använda loopar och iterera över listor               |   |   |

### Kodning och kodningsstil ###

| Förmågor                                      | E                                                                         | C                                               | A                                              |
|-----------------------------------------------|---------------------------------------------------------------------------|-------------------------------------------------|------------------------------------------------|
| Komplexitet									| Du kan skriva enkla program                                               | Du kan skriva lite mer avancerade program       | Du kan skriva komplexa program
| Sekventiell- & funktionsbaserad programmering | Du använder dig av sekventiell programmering och fördefinerade funktioner | Du skapar och använder enkla funktioner         | Du skapar mer komplexa funktioner              |
| Objektorienterad programmering                | Du använder dig av av fördefinerade klasser och objekt                    | Du skapar och använder enkla klasser och objekt | Du skapar och använder mer komplicerade klasser och objekt  |
| Struktur		 				                | Du skriver kod som är delvis strukturerad, har en konsekvent kodningsstil och tydlig namngivning | Som för E, men du skriver kod som är helt strukturerad |   			   |
| Felsökning                                    | Du felsöker på egen hand enkla syntaxfel | Som för E, men systematiskt, och dessutom även körtidsfel och programmeringslogiska fel | Som för C, men med effektivitet   	   |
| Undantagshantering                            |     																		| Du validerar användardata						  | Som för C, men du skriver även kod som använder undantagshantering |
| Dokumentering 								| Du skriver kod som är delvis kommenterad									|  												  | Du skriver kod som är utförligt kommenterad    |

### Datastrukturer ###

| Förmågor        | E 														   | C 																     | A 									 |
|-----------------|------------------------------------------------------------|---------------------------------------------------------------------|---------------------------------------|
| Listor          | Du kan redogöra för och använda dig av listor (Array)      |   																     |   									 |
| Hashtabeller    | Du kan redogöra för vad hashtabeller (Hash) är             | Du kan använda dig av hashtabeller 							     |   									 |

## Beskrivning ##

### Dataformat ###

* Datafilen består av en rad text per datum.
* Varje rad består av flera kolumner, som är separerade med ett eller flera blanksteg.
* Den första raden innehåller rubriker för kolumnerna,
* Den andra raden är blank
* En rad per datum följer.
* Sista raden innehåller medelvärden för hela månaden.


* Första kolumnen innehåller datum
* Andra kolumnen innehåller högsta uppmätta temperatur det aktuella datumet
* Tredje kolumnen innehåller lägsta uppmätta temperatur det aktuella datumet


De första raderna i filen:

     Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP

     1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
     2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5
     3  77    55    66          39.6       0.00         350  5.0 350   9  2.8  59 24 1016.8
     4  77    59    68          51.1       0.00         110  9.1 130  12  8.6  62 40 1021.1
     5  90    66    78          68.3       0.00 TFH     220  8.3 260  12  6.9  84 55 1014.4
     6  81    61    71          63.7       0.00 RFH     030  6.2 030  13  9.7  93 60 1012.7
     7  73    57    65          53.0       0.00 RF      050  9.5 050  17  5.3  90 48 1021.8
     8  75    54    65          50.0       0.00 FH      160  4.2 150  10  2.6  93 41 1026.3
     9  86    32*   59       6  61.5       0.00         240  7.6 220  12  6.0  78 46 1018.6
    10  84    64    74          57.5       0.00 F       210  6.6 050   9  3.4  84 40 1019.0

### Funktioner ###

I den här uppgiften kommer du bygga flera funktioner som arbetar tillsammans:

#### split_line ####

Tar emot en rad från filen, och returnerar en array där varje fält motsvarar en av kolumnerna i filen

#### encode_line ####

Tar emot en array som motsvarar en rad i filen (dvs det som split_line returnerar), och returnerar en hash
som innehåller datum, max- och mintemperatur

#### find_biggest_variation ####

Tar emot en array av datumhashar (dvs det som encode_line returnerar), och returnerar den hash
där skillnaden mellan max- och mintemperatur är som störst

#### load_weather_file ####

Tar emot en sökväg till en fil, läser in den, och returnerar en array med varje relevant rad i filen

#### main ####

Tar emot en sökväg till en fil, och använder de andra funktionerna för att hitta och skriva ut dagen med största temperaturskillnad

## Genomförande ##

Programmet skall utvecklas testdrivet.

Jag föreslår att du utvecklar funktionerna i den ordning de står i listan ovan.
På så sätt behöver du, när det är dags att skriva main, bara lägga in anrop till dina redan skrivna funktioner i rätt ordning.

Skapa funktionerna i lib/main.rb

Testerna finns i /spec/parsing_spec.rb.

Kör rspec köra testerna.

## Utvärdering ##

Efter programmet är avslutat skall du utvärdera hur projektet gick.





