# Termék Nyilvántartó
Az alkalmazás célja egy termék nyilvántartó készítése. A felhasználó termékek listáját és azok adatait képes megtekinteni egy táblázatban a főoladalon, ahonnan a szerkesztés, törlés, új hozzáadás műveletek érhetőek el számára. Az adott funkciókhoz nincs szükség bejelentkezésre.

## Áttekintés

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

## Implementáció
**Fejlesztői környezet: IntelliJ IDEA Ultimate, Apache NetBeans (Spring Boot Framework)**

**Használat:** Az alkalmazásszerver indításához a *pom.xml* könyvtárában, consoleban a következő parancs futtatása szükséges: ***mvn org.springframework.boot:spring-boot-maven-plugin:run***  
Miután elindult az alkalmazásszerver, tetszőleges böngészőben (Chrome, Firefox, stb...) ***localhost:8080***-on elérhető a kezdőoldal.  
A megfelelő működéshez és adatbázishoz SQL Developerben a ***db_init.sql, check_year_function.sql, check_price_function.sql, check_year.sql, check_price.sql*** futtatása szükséges.  
Az alkalmazásszerver leállítása consoleban ***CTRL+C*** paranccsal történik.  
