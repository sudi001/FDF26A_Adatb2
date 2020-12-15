CREATE OR REPLACE TRIGGER check_price
  BEFORE INSERT ON "product"
  FOR EACH ROW
BEGIN
  IF :new."price" < '0' THEN
    RAISE_APPLICATION_ERROR (-20000, 'Nem lehet negat�v egy term�k �ra.');
  END IF;
END;

