CREATE TABLE ������� (
  ID INTEGER   NOT NULL ,
  ����� VARCHAR    ,
  ������� VARCHAR    ,
  �����_������� VARCHAR    ,
  �����_������ VARCHAR    ,
  ����������_�������� DATE    ,
  �������_�������� VARCHAR    ,
  ������_�������� VARCHAR    ,
  �������_�������� INTEGER    ,
  ���� VARCHAR    ,
  ���� VARCHAR    ,
  ������� INTEGER    ,
  ZIPCODE INTEGER    ,
  �� INTEGER      ,
PRIMARY KEY(ID));




CREATE TABLE ������ (
  ID INTEGER   NOT NULL ,
  ������ VARCHAR    ,
  ��������� VARCHAR      ,
PRIMARY KEY(ID));




CREATE TABLE ����� (
  ID INTEGER   NOT NULL ,
  ������ VARCHAR    ,
  ������� INTEGER    ,
  ������_������� INTEGER      ,
PRIMARY KEY(ID));




CREATE TABLE ����� (
  ID INTEGER   NOT NULL ,
  ���� VARCHAR    ,
  ���� VARCHAR    ,
  ������� INTEGER    ,
  �� INTEGER    ,
  ������ VARCHAR      ,
PRIMARY KEY(ID));




CREATE TABLE ��������� (
  ID INTEGER   NOT NULL ,
  ����� VARCHAR    ,
  ������� VARCHAR    ,
  ���������� VARCHAR    ,
  �������� VARCHAR    ,
  ���� VARCHAR    ,
  ���� VARCHAR    ,
  ������� INTEGER    ,
  �� INTEGER      ,
PRIMARY KEY(ID));




CREATE TABLE �������� (
  �������� VARCHAR   NOT NULL ,
  �����_ID INTEGER   NOT NULL   ,
PRIMARY KEY(��������, �����_ID)  ,
  FOREIGN KEY(�����_ID)
    REFERENCES �����(ID));


CREATE INDEX SCHOOL_PHONES_FKIndex1 ON �������� (�����_ID);


CREATE INDEX IFK_Rel_01 ON �������� (�����_ID);


CREATE TABLE ��������� (
  ID INTEGER   NOT NULL ,
  �����_ID INTEGER   NOT NULL ,
  ����� VARCHAR    ,
  ������� VARCHAR    ,
  ����_�������� VARCHAR    ,
  ��� VARCHAR    ,
  �� VARCHAR    ,
  ����������_��������� DATE    ,
  ���� VARCHAR    ,
  ���� VARCHAR    ,
  ������� INTEGER    ,
  �� INTEGER    ,
  �������� VARCHAR      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(�����_ID)
    REFERENCES �����(ID));


CREATE INDEX ���������_FKIndex1 ON ��������� (�����_ID);


CREATE INDEX IFK_���������_��������� ON ��������� (�����_ID);


CREATE TABLE ���������� (
  ������_ID INTEGER   NOT NULL ,
  �������_ID INTEGER   NOT NULL ,
  ������ INTEGER      ,
PRIMARY KEY(������_ID, �������_ID)    ,
  FOREIGN KEY(������_ID)
    REFERENCES ������(ID),
  FOREIGN KEY(�������_ID)
    REFERENCES �������(ID));


CREATE INDEX LESSON_has_STUDENT_FKIndex1 ON ���������� (������_ID);
CREATE INDEX LESSON_has_STUDENT_FKIndex2 ON ���������� (�������_ID);


CREATE INDEX IFK_Rel_10 ON ���������� (������_ID);
CREATE INDEX IFK_Rel_11 ON ���������� (�������_ID);


CREATE TABLE ���������_��������� (
  ���������_ID INTEGER   NOT NULL ,
  �����_ID INTEGER   NOT NULL ,
  ���� VARCHAR      ,
PRIMARY KEY(���������_ID, �����_ID)    ,
  FOREIGN KEY(���������_ID)
    REFERENCES ���������(ID),
  FOREIGN KEY(�����_ID)
    REFERENCES �����(ID));


CREATE INDEX PROFESSOR_has_SCHOOL_FKIndex1 ON ���������_��������� (���������_ID);
CREATE INDEX PROFESSOR_has_SCHOOL_FKIndex2 ON ���������_��������� (�����_ID);


CREATE INDEX IFK_Rel_02 ON ���������_��������� (���������_ID);
CREATE INDEX IFK_Rel_03 ON ���������_��������� (�����_ID);


CREATE TABLE ������ (
  �������_ID INTEGER   NOT NULL ,
  �����_ID INTEGER   NOT NULL ,
  �����_ID INTEGER   NOT NULL   ,
PRIMARY KEY(�������_ID)      ,
  FOREIGN KEY(�����_ID)
    REFERENCES �����(ID),
  FOREIGN KEY(�������_ID)
    REFERENCES �������(ID),
  FOREIGN KEY(�����_ID)
    REFERENCES �����(ID));


CREATE INDEX SCHOOL_has_STUDENT_FKIndex1 ON ������ (�����_ID);
CREATE INDEX SCHOOL_has_STUDENT_FKIndex2 ON ������ (�������_ID);
CREATE INDEX BELONGS_FKIndex3 ON ������ (�����_ID);


CREATE INDEX IFK_Rel_13 ON ������ (�����_ID);
CREATE INDEX IFK_Rel_14 ON ������ (�������_ID);
CREATE INDEX IFK_Rel_15 ON ������ (�����_ID);


CREATE TABLE �������� (
  �����_ID INTEGER   NOT NULL ,
  ������_ID INTEGER   NOT NULL ,
  ���������_ID INTEGER   NOT NULL   ,
PRIMARY KEY(�����_ID, ������_ID)      ,
  FOREIGN KEY(�����_ID)
    REFERENCES �����(ID),
  FOREIGN KEY(������_ID)
    REFERENCES ������(ID),
  FOREIGN KEY(���������_ID)
    REFERENCES ���������(ID));


CREATE INDEX TMHMA_has_LESSON_FKIndex1 ON �������� (�����_ID);
CREATE INDEX TMHMA_has_LESSON_FKIndex2 ON �������� (������_ID);
CREATE INDEX TMHMA_has_LESSON_FKIndex3 ON �������� (���������_ID);


CREATE INDEX IFK_Rel_07 ON �������� (�����_ID);
CREATE INDEX IFK_Rel_08 ON �������� (������_ID);
CREATE INDEX IFK_Rel_09 ON �������� (���������_ID);



