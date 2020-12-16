-- Meglévõ adatszerkezetek törlése.
DROP TABLE "DB_ADMIN"."product";
DROP SEQUENCE USERSEQ;

-- Szekvencia létrehozása a termék ID-jához.
CREATE SEQUENCE USERSEQ INCREMENT BY 1 START WITH 2;

-- Tábla létrehozása
CREATE TABLE "product" (
  "id" int NOT NULL,
  "name" varchar(45) NOT NULL,
  "brand" varchar(45) NOT NULL,
  "price" int NOT NULL,
  "madein" varchar(45) NOT NULL,
  CONSTRAINT product_primary_key PRIMARY KEY ("id"),
  CONSTRAINT check_brand_name CHECK ("brand" IN ('IBM', 'Microsoft', 'NVIDIA'))
);

--SELECT * FROM "DB_ADMIN"."product";

--DESCRIBE "DB_ADMIN"."product";

-- Példa adat beszúrása.
INSERT INTO "DB_ADMIN"."product" ("id", "name", "brand", "price", "madein") VALUES ('1', 'Example', 'NVIDIA', '333', '1000');

-- Ellenõrzõ trigger létrehozása



COMMIT;