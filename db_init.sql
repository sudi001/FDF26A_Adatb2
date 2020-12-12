DROP TABLE "DB_ADMIN"."product";

DROP SEQUENCE USERSEQ;
CREATE SEQUENCE USERSEQ INCREMENT BY 1 START WITH 2;

CREATE TABLE "product" (
  "id" int NOT NULL,
  "name" varchar(45) NOT NULL,
  "brand" varchar(45) NOT NULL,
  "price" int NOT NULL,
  "madein" varchar(45) NOT NULL,
  CONSTRAINT product_primary_key PRIMARY KEY ("id")
);

SELECT * FROM "DB_ADMIN"."product";

DESCRIBE "DB_ADMIN"."product";

INSERT INTO "DB_ADMIN"."product" ("id", "name", "brand", "price", "madein") VALUES ('1', 'Example', 'Example2', '333', '1000');

COMMIT;