ALTER TABLE Professor
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Professor;

/* ?? */
DROP TABLE Professor 
	CASCADE CONSTRAINTS;

/* ?? */
CREATE TABLE Professor (
	pNum NUMBER(8) NOT NULL, /* ?? */
	pClass NUMBER(8) NOT NULL, /* ??? */
	pName VARCHAR2(30) NOT NULL, /* ?? */
	pMajor VARCHAR2(30) NOT NULL, /* ?? */
	pPhone VARCHAR2(30) NOT NULL, /* ??? */
	pAddr VARCHAR2(30) NOT NULL, /* ?? */
	pEmail VARCHAR2(50), /* ??? */
	pPwd VARCHAR2(30) NOT NULL /* ???? */
);


CREATE UNIQUE INDEX PK_Professor
	ON Professor (
		pNum ASC
	);

ALTER TABLE Professor
	ADD
		CONSTRAINT PK_Professor
		PRIMARY KEY (
			pNum
		);
    
    ALTER TABLE ClassList
	DROP
		CONSTRAINT FK_Subject_TO_ClassList
		CASCADE;

ALTER TABLE ClassList
	DROP
		CONSTRAINT FK_Professor_TO_ClassList
		CASCADE;

ALTER TABLE ClassList
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_ClassList;

/* ?? ??? */
DROP TABLE ClassList 
	CASCADE CONSTRAINTS;

/* ?? ??? */
CREATE TABLE ClassList (
	lNum NUMBER(8) NOT NULL, /* ?? ?? */
	SubjectCode NUMBER(8) NOT NULL, /* ???? */
	pNum NUMBER(8) NOT NULL, /* ?? */
	lName VARCHAR2(30) NOT NULL, /* ??? */
	credit NUMBER(8) NOT NULL /* ?? */
);



CREATE UNIQUE INDEX PK_ClassList
	ON ClassList (
		lNum ASC
	);

ALTER TABLE ClassList
	ADD
		CONSTRAINT PK_ClassList
		PRIMARY KEY (
			lNum
		);

ALTER TABLE ClassList
	ADD
		CONSTRAINT FK_Subject_TO_ClassList
		FOREIGN KEY (
			SubjectCode
		)
		REFERENCES Subject (
			SubjectCode
		);

ALTER TABLE ClassList
	ADD
		CONSTRAINT FK_Professor_TO_ClassList
		FOREIGN KEY (
			pNum
		)
		REFERENCES Professor (
			pNum
		);
    
    ALTER TABLE TimeTable
	DROP
		CONSTRAINT FK_ClassRoom_TO_TimeTable
		CASCADE;

ALTER TABLE TimeTable
	DROP
		CONSTRAINT FK_ClassList_TO_TimeTable
		CASCADE;

ALTER TABLE TimeTable
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_TimeTable;

/* ?????? */
DROP TABLE TimeTable 
	CASCADE CONSTRAINTS;

/* ?????? */
CREATE TABLE TimeTable (
	tCode NUMBER(10) NOT NULL, /* ????? */
	ClassNum NUMBER(8) NOT NULL, /* ??? ?? */
	lNum NUMBER(8) NOT NULL, /* ?? ?? */
	tDay VARCHAR(10) NOT NULL, /* ?? */
	tTime DATE NOT NULL /* ?? */
);

CREATE UNIQUE INDEX PK_TimeTable
	ON TimeTable (
		tCode ASC
	);

ALTER TABLE TimeTable
	ADD
		CONSTRAINT PK_TimeTable
		PRIMARY KEY (
			tCode
		);

ALTER TABLE TimeTable
	ADD
		CONSTRAINT FK_ClassRoom_TO_TimeTable
		FOREIGN KEY (
			ClassNum
		)
		REFERENCES ClassRoom (
			ClassNum
		);

ALTER TABLE TimeTable
	ADD
		CONSTRAINT FK_ClassList_TO_TimeTable
		FOREIGN KEY (
			lNum
		)
		REFERENCES ClassList (
			lNum
		);

ALTER TABLE ClassRoom
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_ClassRoom;

/* ?????? */
DROP TABLE ClassRoom 
	CASCADE CONSTRAINTS;

/* ?????? */
CREATE TABLE ClassRoom (
	ClassNum NUMBER(8) NOT NULL, /* ??? ?? */
	ClassCount NUMBER(10) NOT NULL /* ????? */
);


CREATE UNIQUE INDEX PK_ClassRoom
	ON ClassRoom (
		ClassNum ASC
	);

ALTER TABLE ClassRoom
	ADD
		CONSTRAINT PK_ClassRoom
		PRIMARY KEY (
			ClassNum
		);
  
ALTER TABLE University
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_University;

/* ??(???) */
DROP TABLE University 
	CASCADE CONSTRAINTS;

/* ??(???) */
CREATE TABLE University (
	UniCode NUMBER(8) NOT NULL, /* ?? ?? */
	UniName VARCHAR(30) NOT NULL /* ??? */
);


CREATE UNIQUE INDEX PK_University
	ON University (
		UniCode ASC
	);

ALTER TABLE University
	ADD
		CONSTRAINT PK_University
		PRIMARY KEY (
			UniCode
		);

ALTER TABLE Major
	DROP
		CONSTRAINT FK_University_TO_Major
		CASCADE;

ALTER TABLE Major
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Major;

/* ??(??) */
DROP TABLE Major 
	CASCADE CONSTRAINTS;

/* ??(??) */
CREATE TABLE Major (
	MajorCoe NUMBER(8) NOT NULL, /* ?? ?? */
	UniCode NUMBER(8) NOT NULL, /* ?? ?? */
	MajorName VARCHAR(30) NOT NULL /* ??? */
);


CREATE UNIQUE INDEX PK_Major
	ON Major (
		MajorCoe ASC
	);

ALTER TABLE Major
	ADD
		CONSTRAINT PK_Major
		PRIMARY KEY (
			MajorCoe
		);

ALTER TABLE Major
	ADD
		CONSTRAINT FK_University_TO_Major
		FOREIGN KEY (
			UniCode
		)
		REFERENCES University (
			UniCode
		);
    
ALTER TABLE Subject
	DROP
		CONSTRAINT FK_Major_TO_Subject
		CASCADE;

ALTER TABLE Subject
	DROP
		CONSTRAINT FK_SemesterTable_TO_Subject
		CASCADE;

ALTER TABLE Subject
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX PK_Subject;

/* ??(??) */
DROP TABLE Subject 
	CASCADE CONSTRAINTS;

/* ??(??) */
CREATE TABLE Subject (
	SubjectCode NUMBER(8) NOT NULL, /* ???? */
	SubjectName VARCHAR(40) NOT NULL, /* ?? ?? */
	MajorCoe NUMBER(8) NOT NULL, /* ?? ?? */
	Semester NUMBER(1) NOT NULL, /* ?? */
	grade NUMBER(1) NOT NULL /* ?? */
);


CREATE UNIQUE INDEX PK_Subject
	ON Subject (
		SubjectCode ASC
	);

ALTER TABLE Subject
	ADD
		CONSTRAINT PK_Subject
		PRIMARY KEY (
			SubjectCode
		);

ALTER TABLE Subject
	ADD
		CONSTRAINT FK_Major_TO_Subject
		FOREIGN KEY (
			MajorCoe
		)
		REFERENCES Major (
			MajorCoe
		);

ALTER TABLE Subject
	ADD
		CONSTRAINT FK_SemesterTable_TO_Subject
		FOREIGN KEY (
			Semester,
			grade
		)
		REFERENCES SemesterTable (
			Semester,
			grade
		);
    
