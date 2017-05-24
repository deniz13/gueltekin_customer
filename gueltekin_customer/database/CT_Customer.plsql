  CREATE OR REPLACE
  PROCEDURE ct_customer is
  v_tabcnt Number;
  Begin
      Select count(*) into v_tabcnt
      FROM ALL_TABLES
      WHERE TABLE_NAME = 'CUSTOMER' AND
            OWNER = USER;
            
    if v_tabcnt = 0 then
        EXECUTE IMMEDIATE 'CREATE TABLE CUSTOMER
                            (
                               CUSTOMER_ID    INTEGER,
                               FIRSTNAME      VARCHAR2(20),
                               CREDIT         DECIMAL(10,2),
                               CONSTRAINT     CUSTOMER_PK PRIMARY KEY (CUSTOMER_ID)
                             )';
                             
        COMMIT;
        END IF;
        END CT_CUSTOMER;