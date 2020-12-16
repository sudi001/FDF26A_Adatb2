CREATE OR REPLACE FUNCTION check_price_function
(
    price varchar
)
RETURN INT
deterministic
as
    v_price_str VARCHAR2(45);
    v_price_char char(1);
    v_i int;
BEGIN 
    v_price_str := to_char(price);
    while v_i <= LENGTH(v_price_str) loop
            v_price_char := substr(v_price_str, v_i, 1);
            if ascii(v_price_char) < ascii('0') OR ascii(v_price_char) > ascii('9') then
            --if not (ascii('0') <= ascii(v_price_char) and ascii(v_price_char) <= ascii('9')) then
                return 1;            
            end if;
            v_i := v_i + 1;
        end loop;
    RETURN 0;
END check_price_function; 