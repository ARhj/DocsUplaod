CREATE SCHEMA AppUser AUTHORIZATION DBO;

Create table AppUser.CourseDetails
(
	ID bigint IDENTITY(1,1),
	Name varchar(200) NOT NULL
);

ALTER TABLE AppUser.CourseDetails
	ADD CONSTRAINT PK_CourseDetails_ID PRIMARY KEY(ID);

CREATE TABLE AppUser.CourseLevel
(
	levelID bigint NOT NULL,
	ID bigint,
	name varchar(100) NOT NULL
);

ALTER TABLE AppUser.CourseLevel
	ADD CONSTRAINT PK_CourseLevel_LevelID PRIMARY KEY(levelId); 

ALTER TABLE AppUser.CourseLevel
	ADD CONSTRAINT FK_CourseLevel_ID FOREIGN KEY(ID) 
	REFERENCES AppUser.CourseDetails(ID);;

ALTER TABLE AppUser.CourseLevel
	ADD CONSTRAINT UC_CourseLevel_ID_Name UNIQUE(ID,NAME);

CREATE TABLE AppUser.CourseLevelQASet
(
	levelID bigint,
	QASetID bigint identity(1,1),
	QASetName varchar(100) NOT NULL
)

ALTER TABLE AppUser.CourseLevelQASet
	ADD CONSTRAINT FK_CourseLevelQASet FOREIGN KEY (LEVELID)
		REFERENCES AppUser.CourseLevel(levelid);

ALTER TABLE AppUser.CourseLevelQASet
	ADD CONSTRAINT PK_CourseLevelQASet PRIMARY KEY (QASETID)