CREATE TABLE лахгтгс (
  ID INTEGER   NOT NULL ,
  омола VARCHAR    ,
  епихето VARCHAR    ,
  омола_лгтеяас VARCHAR    ,
  омола_патеяа VARCHAR    ,
  глеяолгмиа_цеммгсгс DATE    ,
  стахеяо_тгкежымо VARCHAR    ,
  йимгто_тгкежымо VARCHAR    ,
  аяихлос_апоусиым INTEGER    ,
  покг VARCHAR    ,
  одос VARCHAR    ,
  аяихлос INTEGER    ,
  ZIPCODE INTEGER    ,
  тй INTEGER      ,
PRIMARY KEY(ID));




CREATE TABLE лахгла (
  ID INTEGER   NOT NULL ,
  титкос VARCHAR    ,
  пеяицяажг VARCHAR      ,
PRIMARY KEY(ID));




CREATE TABLE тлгла (
  ID INTEGER   NOT NULL ,
  титкос VARCHAR    ,
  аяихлос INTEGER    ,
  пкгхос_лахгтым INTEGER      ,
PRIMARY KEY(ID));




CREATE TABLE свокг (
  ID INTEGER   NOT NULL ,
  покг VARCHAR    ,
  одос VARCHAR    ,
  аяихлос INTEGER    ,
  тй INTEGER    ,
  титкос VARCHAR      ,
PRIMARY KEY(ID));




CREATE TABLE йахгцгтгс (
  ID INTEGER   NOT NULL ,
  омола VARCHAR    ,
  епихето VARCHAR    ,
  еидийотгта VARCHAR    ,
  тгкежымо VARCHAR    ,
  покг VARCHAR    ,
  одос VARCHAR    ,
  аяихлос INTEGER    ,
  тй INTEGER      ,
PRIMARY KEY(ID));




CREATE TABLE тгкежыма (
  тгкежымо VARCHAR   NOT NULL ,
  свокг_ID INTEGER   NOT NULL   ,
PRIMARY KEY(тгкежымо, свокг_ID)  ,
  FOREIGN KEY(свокг_ID)
    REFERENCES свокг(ID));


CREATE INDEX SCHOOL_PHONES_FKIndex1 ON тгкежыма (свокг_ID);


CREATE INDEX IFK_Rel_01 ON тгкежыма (свокг_ID);


CREATE TABLE упаккгкос (
  ID INTEGER   NOT NULL ,
  свокг_ID INTEGER   NOT NULL ,
  омола VARCHAR    ,
  епихето VARCHAR    ,
  хесг_еяцасиас VARCHAR    ,
  ажл VARCHAR    ,
  ат VARCHAR    ,
  глеяолгмиа_пяоскгьгс DATE    ,
  покг VARCHAR    ,
  одос VARCHAR    ,
  аяихлос INTEGER    ,
  тй INTEGER    ,
  тгкежымо VARCHAR      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(свокг_ID)
    REFERENCES свокг(ID));


CREATE INDEX упаккгкос_FKIndex1 ON упаккгкос (свокг_ID);


CREATE INDEX IFK_еяцафетаи_упаккгкос ON упаккгкос (свокг_ID);


CREATE TABLE бахлокоциа (
  лахгла_ID INTEGER   NOT NULL ,
  лахгтгс_ID INTEGER   NOT NULL ,
  бахлос INTEGER      ,
PRIMARY KEY(лахгла_ID, лахгтгс_ID)    ,
  FOREIGN KEY(лахгла_ID)
    REFERENCES лахгла(ID),
  FOREIGN KEY(лахгтгс_ID)
    REFERENCES лахгтгс(ID));


CREATE INDEX LESSON_has_STUDENT_FKIndex1 ON бахлокоциа (лахгла_ID);
CREATE INDEX LESSON_has_STUDENT_FKIndex2 ON бахлокоциа (лахгтгс_ID);


CREATE INDEX IFK_Rel_10 ON бахлокоциа (лахгла_ID);
CREATE INDEX IFK_Rel_11 ON бахлокоциа (лахгтгс_ID);


CREATE TABLE еяцафетаи_йахгцгтгс (
  йахгцгтгс_ID INTEGER   NOT NULL ,
  свокг_ID INTEGER   NOT NULL ,
  ыяес VARCHAR      ,
PRIMARY KEY(йахгцгтгс_ID, свокг_ID)    ,
  FOREIGN KEY(йахгцгтгс_ID)
    REFERENCES йахгцгтгс(ID),
  FOREIGN KEY(свокг_ID)
    REFERENCES свокг(ID));


CREATE INDEX PROFESSOR_has_SCHOOL_FKIndex1 ON еяцафетаи_йахгцгтгс (йахгцгтгс_ID);
CREATE INDEX PROFESSOR_has_SCHOOL_FKIndex2 ON еяцафетаи_йахгцгтгс (свокг_ID);


CREATE INDEX IFK_Rel_02 ON еяцафетаи_йахгцгтгс (йахгцгтгс_ID);
CREATE INDEX IFK_Rel_03 ON еяцафетаи_йахгцгтгс (свокг_ID);


CREATE TABLE амгйеи (
  лахгтгс_ID INTEGER   NOT NULL ,
  свокг_ID INTEGER   NOT NULL ,
  тлгла_ID INTEGER   NOT NULL   ,
PRIMARY KEY(лахгтгс_ID)      ,
  FOREIGN KEY(свокг_ID)
    REFERENCES свокг(ID),
  FOREIGN KEY(лахгтгс_ID)
    REFERENCES лахгтгс(ID),
  FOREIGN KEY(тлгла_ID)
    REFERENCES тлгла(ID));


CREATE INDEX SCHOOL_has_STUDENT_FKIndex1 ON амгйеи (свокг_ID);
CREATE INDEX SCHOOL_has_STUDENT_FKIndex2 ON амгйеи (лахгтгс_ID);
CREATE INDEX BELONGS_FKIndex3 ON амгйеи (тлгла_ID);


CREATE INDEX IFK_Rel_13 ON амгйеи (свокг_ID);
CREATE INDEX IFK_Rel_14 ON амгйеи (лахгтгс_ID);
CREATE INDEX IFK_Rel_15 ON амгйеи (тлгла_ID);


CREATE TABLE дидасйеи (
  тлгла_ID INTEGER   NOT NULL ,
  лахгла_ID INTEGER   NOT NULL ,
  йахгцгтгс_ID INTEGER   NOT NULL   ,
PRIMARY KEY(тлгла_ID, лахгла_ID)      ,
  FOREIGN KEY(тлгла_ID)
    REFERENCES тлгла(ID),
  FOREIGN KEY(лахгла_ID)
    REFERENCES лахгла(ID),
  FOREIGN KEY(йахгцгтгс_ID)
    REFERENCES йахгцгтгс(ID));


CREATE INDEX TMHMA_has_LESSON_FKIndex1 ON дидасйеи (тлгла_ID);
CREATE INDEX TMHMA_has_LESSON_FKIndex2 ON дидасйеи (лахгла_ID);
CREATE INDEX TMHMA_has_LESSON_FKIndex3 ON дидасйеи (йахгцгтгс_ID);


CREATE INDEX IFK_Rel_07 ON дидасйеи (тлгла_ID);
CREATE INDEX IFK_Rel_08 ON дидасйеи (лахгла_ID);
CREATE INDEX IFK_Rel_09 ON дидасйеи (йахгцгтгс_ID);



