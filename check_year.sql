SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER check_year_trigger
  BEFORE INSERT ON "product"
  FOR EACH ROW
declare
result NUMBER;
newyear VARCHAR2(45);
BEGIN
  newyear := :new."madein";
  result := check_year_function(newyear);
  
  IF result = 0
  THEN
    DBMS_OUTPUT.PUT_LINE ('Az al�bbi �rt�k helyes: ' || newyear);
  ELSE 
    RAISE_APPLICATION_ERROR (-20000, 'Az al�bbi �vsz�m helytelen: ' || newyear);
  END IF;
END;