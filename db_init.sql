-- Megl�v� adatszerkezetek t�rl�se.
DROP TABLE "DB_ADMIN"."product";
DROP SEQUENCE USERSEQ;

-- Szekvencia l�trehoz�sa a term�k ID-j�hoz.
CREATE SEQUENCE USERSEQ INCREMENT BY 1 START WITH 2;

-- T�bla l�trehoz�sa
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

-- P�lda adat besz�r�sa.
INSERT INTO "DB_ADMIN"."product" ("id", "name", "brand", "price", "madein") VALUES ('1', 'Example', 'NVIDIA', '333', '1000');

-- Ellen�rz� trigger l�trehoz�sa



COMMIT;