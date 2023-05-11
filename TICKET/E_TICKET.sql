
CREATE TABLE TICKET(
  PL_ID  NUMBER GENERATED ALWAYS AS IDENTITY,
  PL_NAME VARCHAR2(30),
  DEP_DATE DATE,
  PRICE NUMBER,
  PASS_NUM NUMBER,
  CONSTRAINT PK_TICKET PRIMARY KEY (PL_ID)
);
CREATE TABLE USER_TICKET(
  USER_ID NUMBER GENERATED ALWAYS AS IDENTITY,
  NAME  VARCHAR2(30),
  SURNAME VARCHAR2(30),
  MONEY NUMBER,
  CONSTRAINT PK_USER_TICKET PRIMARY KEY (USER_ID)
);



UPDATE TICKET
SET PRICE = ROUND(DBMS_RANDOM.VALUE(7, 15), 1)
WHERE PL_NAME IN (
  'A?dam', 'A?da?', 'A?cab?di', 'A?stafa', 'A?su', 'Astara', 'Bab?k', 'Balak?n', 'B?rd?', 'Beyl?qan',
  'Bil?suvar', 'C?bray?l', 'C?lilabad', 'Culfa', 'Da?k?s?n', 'Füzuli', 'G?d?b?y', 'Goranboy', 'Göyçay',
  'Göygöl', 'Hac?qabul', 'Xaçmaz', 'X?z?', 'Xocal?', 'Xocav?nd', '?mi?li', '?smay?ll?', 'K?lb?c?r',
  'K?ng?rli', 'Kürd?mir', 'Q?b?l?', 'Qax', 'Qazax', 'Qobustan', 'Quba', 'Qubadl?', 'Qusar', 'Laç?n',
  'L?nk?ran', 'Lerik', 'Masall?', 'Neftçala', 'O?uz', 'Ordubad', 'Saatl?', 'Sabirabad', 'S?d?r?k',
  'Salyan', 'Samux', '?abran', '?ahbuz', '??ki', '?amax?', '??mkir', '??rur', '?u?a', 'Siy?z?n',
  'T?rt?r', 'Tovuz', 'Ucar', 'Yard?ml?', 'Yevlax', 'Z?ngilan', 'Zaqatala', 'Z?rdab'
);

SELECT * FROM TICKET;
SELECT * FROM USER_TICKET