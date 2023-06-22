CREATE OR REPLACE PACKAGE food_pkg IS
    FUNCTION get_host RETURN VARCHAR2;
    FUNCTION get_ip_address RETURN VARCHAR2;
END;


CREATE OR REPLACE PACKAGE BODY food_pkg IS
    FUNCTION get_host RETURN VARCHAR2 IS
    BEGIN
        RETURN SYS_CONTEXT('userenv', 'host');
    END;

    FUNCTION get_ip_address RETURN VARCHAR2 IS
    BEGIN
        RETURN SYS_CONTEXT('userenv', 'ip_address');
    END;
END;
