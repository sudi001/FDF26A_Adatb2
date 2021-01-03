# Termék Nyilvántartó
## Áttekintés
Az alkalmazás célja egy termék nyilvántartó készítése. A felhasználó termékek listáját és azok adatait képes megtekinteni egy táblázatban a főoldalon, ahonnan a szerkesztés, törlés, új hozzáadás műveletek érhetőek el számára. Az adott funkciókhoz nincs szükség bejelentkezésre.

## Követelményanalízis

A beadandó célja egy kis webes alkalmazás elkészítése szerveroldali technológiák segítségével. A feladat kritériumai:

- A beadandó dolgozat témája szabadon választható. 
- CRUD műveletek legyenek megvalósítva (Create Read Update Delete)  
- Check, callcheck, insert legyenek kidolgozva  
- Legyenek ellenőrzések az adatbázisban is, ne csak a programban. A hibákat az adatbázis is legyen képes megjeleníteni, ne csak a program.  
- A program legyen átlátható, mappákban rendezett, minden kódrész legyen rendezett mappákban tárolva  
- Kivételek kezelése és saját kivétel osztályok létrehozása  
- Mappákban való almappák kezelése (model -> Managers, Records)  
- Dokumentálás a folyamatokról  
- Az adatbázis képes legyen teljes körűen kommunikálni a programmal.

### Riportok
Kivitelező: Kérem jellemezze, mire lenne szüksége!  
Megrendelő: Elgondolkodtam azon, hogy szükségem lenne egy olyan weboldalra, ahol a termékeinket listázni tudnám.
Kivitelező: Miért szeretné ezt?  
Megrendelő: Egy olyan alkalmazásra vágyom, ahol a termékeket nyilván tudnám tartani.  
Kivitelező: Szeretné, hogy különböző szerepkörök legyenek, mint például admin és felhasználó?  
Megrendelő: Nem, a raktárosok számára szeretném ezt az alkalmazást, bejelentkezés nélkül lehessen használni, hogy gördülékenyebben menjen a munka egy átlátható táblázatban.  
Kivitelező: Mindezt egy weboldalon lenne a legcélszerűbb megvalósítani, ahol minél inkább letisztult, átlátható főoldalon szereplő táblázatban tudná vezetni a nyilvántartást.  
Megrendelő: Az egyik legfőbb igényem lenne az, hogy a szerkesztés, törlés, új hozzáadás műveletek elérhetőek legyenek az ergonomikus működés mellett.A leggyorsabban használható táblázatot szeretném a raktárosaimnak.  
Megrendelő: Hálás lennék, ha minden eddigi tapaszatalai szerint készítené el számomra az alkalmazást.  
Kivitelező: Rendben, a legjobb tudásunk szerint fogunk cselekedni.  

### Funkcionális követelmények

- Főoldalon táblázatban az összes termék listázható legyen
- Új termék hozzáadására lehetőség
- Termék törlésére lehetőség
- Termék szerkesztésére lehetőség
- Csak a megadott paraméterek szerint lehessen, termékeket hozzáadni, illetve szerkeszteni
- Hibaüzenet kiíratása kliens oldalon
- Hibaüzenet kiíratása szerver oldalon
- Főoldalra ugrásra gomb, hiba kiíratás után

### Nem funkcionális követelmények

-   Felhasználóbarát, ergonomikus elrendezés és kinézet.
-   Gyors működés.
-   Biztonságos működés: funkciókhoz való korlátozott hozzáférés.

## Használati eset-modell

![alt text](https://github.com/sudi001/FDF26A_Adatb2/blob/main/szekvencia_RFT.png)

## Fejlesztői Dokumentáció

### Termék adatai
**Azonosítószám** (Long id): Megadja az adott termék egyedi azonosítószámát  
**Név** (String name): Termék neve  
**Gyártmány** (String brand): Vállalat, amely az adott terméket gyártotta  
**Gyártás éve** (String madein): Az év amikor készült a termék  
**Ár** (int price): Ára a terméknek  

**Megszorítások:** 
 - Az azonosítószám minden terméknél *egyedi*  
 - A gyártmány kizárólag '*IBM*', '*Microsoft*', '*NVIDIA*' lehet.  


### Funkciók

**Termékek listázása** (listAll()): Listázza az adatbázisban szereplő összes terméket egy táblázatban a felhasználó számára.  
**Új termék felvétele** (save(Product product)): A termék adatainak megadása után a termék mentésre kerül az adatbázisba.  
**Meglévő termék szerkesztése** (get(long id)): A termék megtalálása az adatbázisban, adatainak megjelenítése szerkesztéshez.  
**Meglévő termék törlése** (delete(long id)): A kiválasztott termék törlése az adatbázisból.  

### Weboldalak

**edit_product.html**: Az oldalon a kiválasztott termék adatai láthatóak, szerkeszthetőek és menthetőek.  
**errorpage.html**: Amennyiben rossz paraméter lett megadva, hibaüzenet kiírása, hiba részletes leírása az alkalmazásszerver logjában tekinthető meg, főoldal gomb elérhető. Amennyiben kivétel dobás történt, konkrét hibaüzenet kiírása az oldalon.  
**index.html**: Főoldal, listázás megjelenítése. Innen érhető el minden egyéb funkció.  
**new_product.html**: Új termék adatainak megadása és mentése érhető el az oldalon.  

## Adatbázis
#### **Oracle adatbázis, SQL Developerben**

**Tábla**: "product"

**Mezők:**
"id" int NOT NULL,  
"name" varchar(45) NOT NULL,  
"brand" varchar(45) NOT NULL,  
"price" int NOT NULL,  
"madein" varchar(45) NOT NULL,  

**Megszorítások:**
CONSTRAINT product_primary_key PRIMARY KEY ("id"),  
CONSTRAINT check_brand_name CHECK ("brand" IN ('IBM', 'Microsoft', 'NVIDIA'))  

**Triggerek:**
***check_price_trigger***: Meghívja a check_price_function-t és a visszakapott érték alapján kiíratja az alkalmazásszerver logjába, a bevitt hibás árat.  
***check_year_trigger:*** Meghívja a check_year_function-t és a visszakapott érték alapján kiíratja az alkalmazásszerver logjába, a bevitt hibás gyártási évet.  

**Függvények:**
***check_price_function:*** Ellenőrzi a bevitt árat, hogy 0-val kezdődik-e vagy negatív szám-e, ebben az esetben más visszatérési értéket ad.  
***check_year_function:*** Ellenőrzi a bevitt évet, hogy hogy 0-val kezdődik-e vagy negatív szám-e és hogy 2020-től nagyobb-e, ebben az esetben más visszatérési értéket ad.  

### Adatbázis modell

![alt text](https://github.com/sudi001/FDF26A_Adatb2/blob/main/adatbazis_rft.PNG)

## Implementáció
**Fejlesztői környezet: IntelliJ IDEA Ultimate, Apache NetBeans (Spring Boot Framework)**

### Telepítési terv
Webes alkalmazás  

A webalkalmazás használatához csupán egy internetkapcsolattal rendelkező számítógépre vagy mobiltelefonra vagy szükségünk, melyen
valamelyik böngésző, mint például: ***Google Chrome, Firefox, Safari*** megtalálható.

**Használat:** Az alkalmazásszerver indításához a *pom.xml* könyvtárában, consoleban a következő parancs futtatása szükséges: ***mvn org.springframework.boot:spring-boot-maven-plugin:run***  
Miután elindult az alkalmazásszerver, tetszőleges böngészőben (Chrome, Firefox, stb...) ***localhost:8080***-on elérhető a kezdőoldal.  
A megfelelő működéshez és adatbázishoz SQL Developerben a ***db_init.sql, check_year_function.sql, check_price_function.sql, check_year.sql, check_price.sql*** futtatása szükséges.  
Az alkalmazásszerver leállítása consoleban ***CTRL+C*** paranccsal történik.  

### Használt technólógiák:
- Trello - projekt szervezése, rendezése
- HTML - A weboldal struktúrális vázát adja meg
- CSS - A kinézethez manipulálására használatos
- GitHub - Alkalmazás verzióinak követése
- Git Extensions - Git UI
- MVC Keretrendszer - Az alkalmazás kódjának strukturális keretrendszere
- Java Spring Boot - Az alkalmazás keretrendszere
- Maven - Alkalmazásszerver
- Kódszerkesztők (VS, SubLime, Notepad++, stb.)

## Megjelenítés

#### Főoldal
![alt text](https://github.com/sudi001/FDF26A_Adatb2/blob/main/1.PNG)
#### Új termék felvétele
![alt text](https://github.com/sudi001/FDF26A_Adatb2/blob/main/2.PNG)
#### Új termék felvételre került a listában
![alt text](https://github.com/sudi001/FDF26A_Adatb2/blob/main/3.PNG)
#### Helytelen adatok megadása
![alt text](https://github.com/sudi001/FDF26A_Adatb2/blob/main/4.PNG)
#### Az adatbázis által dobott hibaüzenet megjelenítése a logban
![alt text](https://github.com/sudi001/FDF26A_Adatb2/blob/main/5.PNG)

## Teszt

#### Teszt jegyzőkönyv

| Tesztelő: Majoros Dávid | 2020.12.30 15.54 | Böngésző: Google Chrome |
|-------------------------|---------------------------|-------------------------|

| Időpont | Teszt                | Eredmény | Megjegyzés                                                           |
|:-------:|----------------------|----------|----------------------------------------------------------------------|
| 15:55   | Kezdőlap megjelenítése    | Sikeres  | A tervezettek szerint megjelenítődik                    |
| 15:58   | Új termék létrehozása          | Sikeres  | A tervezettek szerint működik                                        |
| 15:59   | Termékek listázása| Sikeres  | A tervezettek szerint listázódnak az adatbázis elemei                 |
| 16:01   | Szerkesztés gomb          | Sikeres  | A tervezettek szerint működik                                        |
| 16:02   | Textbox kitöltése új terméknél       | Sikeres  | A tervezettek szerint csak megfelelő paraméterek bevihetőek                |
| 16:04   | Mentés gomb          | Sikeres  | A tervezettek szerint működik                                        |
| 16:05   | Hiba kiíratás esetén főmenü gomb  | Sikeres  | A tervezettek szerint visszavisz a főmenübe                                    |
| 16:07   | Szerkesztés gomb          | Sikeres  | A tervezettek szerint működik                                        |
| 16:08   | Hibás adat bevitele esetén hiba kiíratás     | Sikeres  | Rossz gyártó megadása esetén a frontend és az alkalmazás szerver is helyes hibát ír ki                            |
| 16:09   | Hibás évszám bevitel esetén hiba kiíratás          | Sikeres  | A tervezettek szerint működik, az alkalmazás szerver kiíratja a hibásan bevitt értéket.                                      |
| 16:10   | Adatbázis frissitése, adatok mentése esetén          | Sikeres  | Valós eredményt ad vissza                                            |
| 16:12   | Hibás ár bevitele esetén hiba kiíratás        | Sikeres  | Front end hibaüzenetet dob. Az alkalmazás szerver visszaadja a hibásan bevitt értéket                                            |

## Fogalomtár
**Fogalmak:**
- **bug:** hiba a program futása során.
- **backend:** egy adott rendszer alsóbb, tényleges feldolgozást végző rétege.
- **frontend:** a front-end réteg feladata a rendszerből kijutó adatok prezentálása, illetve a bejövő adatok fogadása.
- **CRUD műveletek:** hozzáadás, olvasás, frissítés és törlés műveletek.  
- **kliens:** olyan számítógép vagy azon futó progam, amelyik hozzáfér egy (távoli) szolgálatáshoz
- **szerver:** az informatikában olyan számítógépet vagy szoftvert jelent, ami más számítógépek számára a rajta tárolt vagy előállított adatok felhasználását, a szerver hardver erőforrásainak kihasználását, illetve más szolgáltatások elérését teszi lehetővé.
- **framework:**  számítógép-programozásban az alkalmazásfejlesztési keretrendszer egy szoftverfejlesztési keretrendszert tartalmaz, amit szoftverfejlesztők használnak, hogy létrehozzák egy operációs rendszer, egy webalkalmazás vagy egy alkalmazás standard struktúráját.
