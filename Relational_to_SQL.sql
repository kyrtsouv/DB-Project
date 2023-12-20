CREATE TABLE ΜΑΘΗΤΗΣ (
  ID INTEGER   NOT NULL ,
  ΟΝΟΜΑ VARCHAR    ,
  ΕΠΙΘΕΤΟ VARCHAR    ,
  ΟΝΟΜΑ_ΜΗΤΕΡΑΣ VARCHAR    ,
  ΟΝΟΜΑ_ΠΑΤΕΡΑ VARCHAR    ,
  ΗΜΕΡΟΜΗΝΙΑ_ΓΕΝΝΗΣΗΣ DATE    ,
  ΣΤΑΘΕΡΟ_ΤΗΛΕΦΩΝΟ VARCHAR    ,
  ΚΙΝΗΤΟ_ΤΗΛΕΦΩΝΟ VARCHAR    ,
  ΑΡΙΘΜΟΣ_ΑΠΟΥΣΙΩΝ INTEGER    ,
  ΠΟΛΗ VARCHAR    ,
  ΟΔΟΣ VARCHAR    ,
  ΑΡΙΘΜΟΣ INTEGER    ,
  ZIPCODE INTEGER    ,
  ΤΚ INTEGER      ,
PRIMARY KEY(ID));




CREATE TABLE ΜΑΘΗΜΑ (
  ID INTEGER   NOT NULL ,
  ΤΙΤΛΟΣ VARCHAR    ,
  ΠΕΡΙΓΡΑΦΗ VARCHAR      ,
PRIMARY KEY(ID));




CREATE TABLE ΤΜΗΜΑ (
  ID INTEGER   NOT NULL ,
  ΤΙΤΛΟΣ VARCHAR    ,
  ΑΡΙΘΜΟΣ INTEGER    ,
  ΠΛΗΘΟΣ_ΜΑΘΗΤΩΝ INTEGER      ,
PRIMARY KEY(ID));




CREATE TABLE ΣΧΟΛΗ (
  ID INTEGER   NOT NULL ,
  ΠΟΛΗ VARCHAR    ,
  ΟΔΟΣ VARCHAR    ,
  ΑΡΙΘΜΟΣ INTEGER    ,
  ΤΚ INTEGER    ,
  ΤΙΤΛΟΣ VARCHAR      ,
PRIMARY KEY(ID));




CREATE TABLE ΚΑΘΗΓΗΤΗΣ (
  ID INTEGER   NOT NULL ,
  ΟΝΟΜΑ VARCHAR    ,
  ΕΠΙΘΕΤΟ VARCHAR    ,
  ΕΙΔΙΚΟΤΗΤΑ VARCHAR    ,
  ΤΗΛΕΦΩΝΟ VARCHAR    ,
  ΠΟΛΗ VARCHAR    ,
  ΟΔΟΣ VARCHAR    ,
  ΑΡΙΘΜΟΣ INTEGER    ,
  ΤΚ INTEGER      ,
PRIMARY KEY(ID));




CREATE TABLE ΤΗΛΕΦΩΝΑ (
  ΤΗΛΕΦΩΝΟ VARCHAR   NOT NULL ,
  ΣΧΟΛΗ_ID INTEGER   NOT NULL   ,
PRIMARY KEY(ΤΗΛΕΦΩΝΟ, ΣΧΟΛΗ_ID)  ,
  FOREIGN KEY(ΣΧΟΛΗ_ID)
    REFERENCES ΣΧΟΛΗ(ID));


CREATE INDEX SCHOOL_PHONES_FKIndex1 ON ΤΗΛΕΦΩΝΑ (ΣΧΟΛΗ_ID);


CREATE INDEX IFK_Rel_01 ON ΤΗΛΕΦΩΝΑ (ΣΧΟΛΗ_ID);


CREATE TABLE ΥΠΑΛΛΗΛΟΣ (
  ID INTEGER   NOT NULL ,
  ΣΧΟΛΗ_ID INTEGER   NOT NULL ,
  ΟΝΟΜΑ VARCHAR    ,
  ΕΠΙΘΕΤΟ VARCHAR    ,
  ΘΕΣΗ_ΕΡΓΑΣΙΑΣ VARCHAR    ,
  ΑΦΜ VARCHAR    ,
  ΑΤ VARCHAR    ,
  ΗΜΕΡΟΜΗΝΙΑ_ΠΡΟΣΛΗΨΗΣ DATE    ,
  ΠΟΛΗ VARCHAR    ,
  ΟΔΟΣ VARCHAR    ,
  ΑΡΙΘΜΟΣ INTEGER    ,
  ΤΚ INTEGER    ,
  ΤΗΛΕΦΩΝΟ VARCHAR      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(ΣΧΟΛΗ_ID)
    REFERENCES ΣΧΟΛΗ(ID));


CREATE INDEX ΥΠΑΛΛΗΛΟΣ_FKIndex1 ON ΥΠΑΛΛΗΛΟΣ (ΣΧΟΛΗ_ID);


CREATE INDEX IFK_ΕΡΓΑΖΕΤΑΙ_ΥΠΑΛΛΗΛΟΣ ON ΥΠΑΛΛΗΛΟΣ (ΣΧΟΛΗ_ID);


CREATE TABLE ΒΑΘΜΟΛΟΓΙΑ (
  ΜΑΘΗΜΑ_ID INTEGER   NOT NULL ,
  ΜΑΘΗΤΗΣ_ID INTEGER   NOT NULL ,
  ΒΑΘΜΟΣ INTEGER      ,
PRIMARY KEY(ΜΑΘΗΜΑ_ID, ΜΑΘΗΤΗΣ_ID)    ,
  FOREIGN KEY(ΜΑΘΗΜΑ_ID)
    REFERENCES ΜΑΘΗΜΑ(ID),
  FOREIGN KEY(ΜΑΘΗΤΗΣ_ID)
    REFERENCES ΜΑΘΗΤΗΣ(ID));


CREATE INDEX LESSON_has_STUDENT_FKIndex1 ON ΒΑΘΜΟΛΟΓΙΑ (ΜΑΘΗΜΑ_ID);
CREATE INDEX LESSON_has_STUDENT_FKIndex2 ON ΒΑΘΜΟΛΟΓΙΑ (ΜΑΘΗΤΗΣ_ID);


CREATE INDEX IFK_Rel_10 ON ΒΑΘΜΟΛΟΓΙΑ (ΜΑΘΗΜΑ_ID);
CREATE INDEX IFK_Rel_11 ON ΒΑΘΜΟΛΟΓΙΑ (ΜΑΘΗΤΗΣ_ID);


CREATE TABLE ΕΡΓΑΖΕΤΑΙ_ΚΑΘΗΓΗΤΗΣ (
  ΚΑΘΗΓΗΤΗΣ_ID INTEGER   NOT NULL ,
  ΣΧΟΛΗ_ID INTEGER   NOT NULL ,
  ΩΡΕΣ VARCHAR      ,
PRIMARY KEY(ΚΑΘΗΓΗΤΗΣ_ID, ΣΧΟΛΗ_ID)    ,
  FOREIGN KEY(ΚΑΘΗΓΗΤΗΣ_ID)
    REFERENCES ΚΑΘΗΓΗΤΗΣ(ID),
  FOREIGN KEY(ΣΧΟΛΗ_ID)
    REFERENCES ΣΧΟΛΗ(ID));


CREATE INDEX PROFESSOR_has_SCHOOL_FKIndex1 ON ΕΡΓΑΖΕΤΑΙ_ΚΑΘΗΓΗΤΗΣ (ΚΑΘΗΓΗΤΗΣ_ID);
CREATE INDEX PROFESSOR_has_SCHOOL_FKIndex2 ON ΕΡΓΑΖΕΤΑΙ_ΚΑΘΗΓΗΤΗΣ (ΣΧΟΛΗ_ID);


CREATE INDEX IFK_Rel_02 ON ΕΡΓΑΖΕΤΑΙ_ΚΑΘΗΓΗΤΗΣ (ΚΑΘΗΓΗΤΗΣ_ID);
CREATE INDEX IFK_Rel_03 ON ΕΡΓΑΖΕΤΑΙ_ΚΑΘΗΓΗΤΗΣ (ΣΧΟΛΗ_ID);


CREATE TABLE ΑΝΗΚΕΙ (
  ΜΑΘΗΤΗΣ_ID INTEGER   NOT NULL ,
  ΣΧΟΛΗ_ID INTEGER   NOT NULL ,
  ΤΜΗΜΑ_ID INTEGER   NOT NULL   ,
PRIMARY KEY(ΜΑΘΗΤΗΣ_ID)      ,
  FOREIGN KEY(ΣΧΟΛΗ_ID)
    REFERENCES ΣΧΟΛΗ(ID),
  FOREIGN KEY(ΜΑΘΗΤΗΣ_ID)
    REFERENCES ΜΑΘΗΤΗΣ(ID),
  FOREIGN KEY(ΤΜΗΜΑ_ID)
    REFERENCES ΤΜΗΜΑ(ID));


CREATE INDEX SCHOOL_has_STUDENT_FKIndex1 ON ΑΝΗΚΕΙ (ΣΧΟΛΗ_ID);
CREATE INDEX SCHOOL_has_STUDENT_FKIndex2 ON ΑΝΗΚΕΙ (ΜΑΘΗΤΗΣ_ID);
CREATE INDEX BELONGS_FKIndex3 ON ΑΝΗΚΕΙ (ΤΜΗΜΑ_ID);


CREATE INDEX IFK_Rel_13 ON ΑΝΗΚΕΙ (ΣΧΟΛΗ_ID);
CREATE INDEX IFK_Rel_14 ON ΑΝΗΚΕΙ (ΜΑΘΗΤΗΣ_ID);
CREATE INDEX IFK_Rel_15 ON ΑΝΗΚΕΙ (ΤΜΗΜΑ_ID);


CREATE TABLE ΔΙΔΑΣΚΕΙ (
  ΤΜΗΜΑ_ID INTEGER   NOT NULL ,
  ΜΑΘΗΜΑ_ID INTEGER   NOT NULL ,
  ΚΑΘΗΓΗΤΗΣ_ID INTEGER   NOT NULL   ,
PRIMARY KEY(ΤΜΗΜΑ_ID, ΜΑΘΗΜΑ_ID)      ,
  FOREIGN KEY(ΤΜΗΜΑ_ID)
    REFERENCES ΤΜΗΜΑ(ID),
  FOREIGN KEY(ΜΑΘΗΜΑ_ID)
    REFERENCES ΜΑΘΗΜΑ(ID),
  FOREIGN KEY(ΚΑΘΗΓΗΤΗΣ_ID)
    REFERENCES ΚΑΘΗΓΗΤΗΣ(ID));


CREATE INDEX TMHMA_has_LESSON_FKIndex1 ON ΔΙΔΑΣΚΕΙ (ΤΜΗΜΑ_ID);
CREATE INDEX TMHMA_has_LESSON_FKIndex2 ON ΔΙΔΑΣΚΕΙ (ΜΑΘΗΜΑ_ID);
CREATE INDEX TMHMA_has_LESSON_FKIndex3 ON ΔΙΔΑΣΚΕΙ (ΚΑΘΗΓΗΤΗΣ_ID);


CREATE INDEX IFK_Rel_07 ON ΔΙΔΑΣΚΕΙ (ΤΜΗΜΑ_ID);
CREATE INDEX IFK_Rel_08 ON ΔΙΔΑΣΚΕΙ (ΜΑΘΗΜΑ_ID);
CREATE INDEX IFK_Rel_09 ON ΔΙΔΑΣΚΕΙ (ΚΑΘΗΓΗΤΗΣ_ID);