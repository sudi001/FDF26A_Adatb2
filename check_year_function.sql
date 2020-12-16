CREATE OR REPLACE FUNCTION check_year_function
(
    year_           IN  "product"."madein"%TYPE
)
RETURN INT
deterministic
as
year_num NUMBER;
BEGIN 
  year_number := to_number(year_);
  IF year_ > 2020 THEN
    RETURN 1;
  END IF;
  RETURN 0;
END check_year_function; 