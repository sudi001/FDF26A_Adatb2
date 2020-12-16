SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER check_price_trigger
  BEFORE INSERT ON "product"
  FOR EACH ROW
declare
result NUMBER;
newprice varchar2(45);
BEGIN
  newprice := to_char(:new."price");
  result := check_price_function(newprice);
  
  IF result = 0
  THEN
    DBMS_OUTPUT.PUT_LINE ('Az alábbi érték helyes: ' || newprice);
  ELSE 
    RAISE_APPLICATION_ERROR (-20000, 'Az alábbi érték helytelen: ' || newprice);
  END IF;
END;