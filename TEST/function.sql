--burada products cedvelinden product_id e gore total costu hesablayr
CREATE OR REPLACE FUNCTION id_prd(prod_id IN NUMBER) RETURN NUMBER
IS
  v_product products%ROWTYPE;
  total_cost NUMBER;
BEGIN
  SELECT * INTO v_product FROM products WHERE product_id = prod_id;
  total_cost := v_product.list_price * v_product.standard_cost;
  DBMS_OUTPUT.PUT_LINE(total_cost);
  RETURN total_cost;
END;

SELECT id_prd(1) FROM dual;
------------------------------------------------------------------------------------
--DEPARTRMENTE GOREORTALAMA MAASI HESABLAYIR

CREATE OR REPLACE FUNCTION avg_sal_func(dept IN NUMBER)RETURN NUMBER IS
  avg_sal number;

BEGIN
  SELECT ROUND(AVG(SAL),2) INTO AVG_SAL FROM EMP  WHERE DEPTNO= DEPT ;
  RETURN AVG_SAL;
end;

SELECT AVG_SAL_FUNC(20) FROM EMP WHERE ROWNUM = 1;

-----------------------------------------------------------------------------------

SELECT EXTRACT(YEAR FROM ORDER_DATE) YEAR,STATUS,COUNT(STATUS) SAY FROM ORDERS WHERE EXTRACT(YEAR FROM ORDER_DATE) = 2017 GROUP BY  EXTRACT(YEAR FROM ORDER_DATE), STATUS ORDER BY STATUS ASC;


CREATE OR REPLACE FUNCTIONYEAR_STATSU_FUNC(YEA IN NUMBER) RETURN NUMBER IS
  V_ORD ORDERS%ROWTYPE;
  EX_DATE DATE;
BEGIN
  SELECT EXTRACT(YEAR FROM ORDER_DATE) YEAR,STATUS,COUNT(STATUS) SAY FROM ORDERS WHERE EXTRACT(YEAR FROM ORDER_DATE) = 2017 GROUP BY  EXTRACT(YEAR FROM ORDER_DATE), STATUS ORDER BY STATUS ASC;
  RETURN 
END;








CREATE OR REPLACE FUNCTION get_order_counts(p_year IN NUMBER) RETURN SYS_REFCURSOR IS
  v_result SYS_REFCURSOR;
BEGIN
  OPEN v_result FOR
    SELECT EXTRACT(YEAR FROM ORDER_DATE)  YEAR, STATUS, COUNT(STATUS)  SAY
    FROM ORDERS
    WHERE EXTRACT(YEAR FROM ORDER_DATE) = p_year
    GROUP BY EXTRACT(YEAR FROM ORDER_DATE), STATUS
    ORDER BY STATUS ASC;

  RETURN v_result;
END;
/


SELECT get_order_counts(2017) FROM ORDERS WHERE ROWNUM = 1;

---------------------------------------------------------------------------

select first_name ,last_name from employees where EMPLOYEE_ID in (select distinct salesman_id from orders where status='Canceled');

SELECT * FROM ORDERS;
 --------------------------------------------------------------------------------------
 
 CREATE OR REPLACE PACKAGE my_package IS
  -- Ba?l?k bölümü
  PROCEDURE procedure1;
  FUNCTION function1 RETURN NUMBER;
  CONSTANT constant1 CONSTANT NUMBER := 100;
END my_package;

CREATE OR REPLACE PACKAGE BODY my_package IS
  -- Vücut bölümü
  PROCEDURE procedure1 IS
  BEGIN
    -- Prosedürün kodu buraya yaz?l?r
    NULL;
  END;

  FUNCTION function1 RETURN NUMBER IS
  BEGIN
    -- Fonksiyonun kodu buraya yaz?l?r
    RETURN 42;
  END;
END my_package;

 
-----------------------------------------------------------------------------------


















PERFORMANCE
PACKAGE




















DECLARE
  TYPE emp_tab_type IS TABLE OF employees%ROWTYPE;
  emp_tab emp_tab_type;
BEGIN
  SELECT * BULK COLLECT INTO emp_tab FROM employees;

  -- emp_tab koleksiyonunu kullanarak verileri i?leyebilirsiniz
  FORALL i IN 1..emp_tab.COUNT
    UPDATE employees SET salary = salary * 1.1 WHERE employee_id = emp_tab(i).employee_id;
    
  COMMIT;
END;

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;

SELECT EXTRACT(YEAR FROM ORDER_DATE) YEAR,STATUS,COUNT(STATUS) SAY FROM ORDERS WHERE EXTRACT(YEAR FROM ORDER_DATE) = 2017 GROUP BY  EXTRACT(YEAR FROM ORDER_DATE), STATUS ORDER BY STATUS ASC;