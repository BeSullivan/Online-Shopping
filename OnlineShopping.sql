CREATE TABLE Goods (
	id VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL,
	companyName VARCHAR(20) NOT NULL,
	price INT NOT NULL,
	discount DOUBLE DEFAULT 0,
	stock INT DEFAULT 0,
	typeGoods VARCHAR(30) NOT NULL,
	avgPoint DOUBLE DEFAULT 0,
	PRIMARY KEY (id)
); 

CREATE TABLE goodsHistory (
	id VARCHAR(20) NOT NULL,
	name VARCHAR(20) NOT NULL,
	companyName VARCHAR(20) NOT NULL,
	price INT NOT NULL,
	discount DOUBLE DEFAULT 0,
	stock INT DEFAULT 0,
	typeGoods VARCHAR(30),
	avgPoint DOUBLE DEFAULT 0,
	actionType VARCHAR(20),
	actionDate TIMESTAMP,
	PRIMARY KEY (id,actionDate,actionType)
);

CREATE TABLE Sport (
	id VARCHAR(20) NOT NULL,
	color VARCHAR(20) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (id) REFERENCES Goods (id) ON DELETE CASCADE
);

CREATE TABLE HomeAppliances (
	id VARCHAR(20) NOT NULL,
	dateProduct time NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (id) REFERENCES Goods (id) ON DELETE CASCADE
);

CREATE TABLE Backup (
	firstname VARCHAR(20) NOT NULL,
	lastName  VARCHAR(20) NOT NULL,
	userName  VARCHAR(30) NOT NULL,
	password  VARCHAR(30) NOT NULL,
	status	  BOOLEAN NOT NULL,
	PRIMARY KEY(userName)
);

CREATE TABLE allCostumer(
	email VARCHAR(70) NOT NULL UNIQUE,
	PRIMARY KEY (email)
);


CREATE TABLE Costumer (
	timeOfReg TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	userName VARCHAR(50) NOT NULL UNIQUE,
	firstName VARCHAR(20),
	lastName VARCHAR(20),
	email VARCHAR(70) NOT NULL UNIQUE REFERENCES allCostumer(email),
	password VARCHAR(50),
	credit DOUBLE DEFAULT 0,
	numberOrder INT DEFAULT 0,
	PRIMARY KEY (email)
);


CREATE TABLE costumerHistory (
	timeOfReg TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	userName VARCHAR(50) NOT NULL UNIQUE,
	firstName VARCHAR(20),
	lastName VARCHAR(20),
	email VARCHAR(70) NOT NULL,
	password VARCHAR(50),
	credit DOUBLE DEFAULT 0,
	numberOrder INT DEFAULT 0,
	actionType VARCHAR(20),
	actionDate TIMESTAMP,
	PRIMARY KEY (userName,actionType,actionDate)
);


CREATE TABLE costumerPhone (
	phoneNum VARCHAR(20) ,
	refCost VARCHAR(70) NOT NULL REFERENCES Costumer(email) ON DELETE CASCADE , 
	PRIMARY KEY (refCost ,phoneNum)
);


CREATE TABLE costumerAddress (
	addressText VARCHAR(400) NOT NULL,
	refCost VARCHAR(70) NOT NULL REFERENCES Costumer(email) ON DELETE CASCADE, 
	PRIMARY KEY (refCost ,addressText)
);


CREATE TABLE BasketSetNum (
	refCost VARCHAR(70) NOT NULL REFERENCES allCostumer(email) ON DELETE CASCADE,
	basketNum INT DEFAULT 0,
	PRIMARY KEY (refCost ,basketNum)
);


CREATE TABLE BasketGoods (
	refGoods VARCHAR(20) NOT NULL REFERENCES Goods(id) ON DELETE CASCADE, 
	numberGoods INT,
	refCost VARCHAR(70) NOT NULL REFERENCES allCostumer(email) ON DELETE CASCADE,
	basketNum INT NOT NULL,
	FOREIGN Key (refCost,basketNum) REFERENCES BasketSetNum(refCost ,basketNum),
	PRIMARY KEY (refCost ,basketNum, refGoods)
);


CREATE TABLE Driver (
	firstName VARCHAR(20),
	lastName VARCHAR(20),
	carType VARCHAR(20),
	carTag VARCHAR(20),
	personalID INT NOT NULL UNIQUE,
	status BOOLEAN DEFAULT FALSE,
	PRIMARY KEY (personalID)
);

CREATE TABLE driverPhone (
	phoneNum VARCHAR(20),
	refDrive INT NOT NULL UNIQUE REFERENCES Driver(personalID) ON DELETE CASCADE
);

CREATE TABLE driverAddress (
	addressText VARCHAR(40) NOT NULL,
	refDrive INT NOT NULL UNIQUE REFERENCES Driver(personalID) ON DELETE CASCADE
);


CREATE TABLE Company (
	cName VARCHAR(30) NOT NULL,
	regCode VARCHAR(20) NOT NULL UNIQUE PRIMARY KEY,
	address VARCHAR(400)
);


CREATE TABLE companyPhone (
	refComp VARCHAR(20) NOT NULL REFERENCES Company(regCode) ON DELETE CASCADE,
	phoneNum VARCHAR(20),
	PRIMARY KEY (refComp ,phoneNum)
);


CREATE TABLE OrderGoods (
	trackingCode INT NOT NULL,
	basketNum INT,
	email VARCHAR(70) NOT NULL,
	typeCost BOOLEAN NOT NULL,
	paymentStatus BOOLEAN NOT NULL DEFAULT FALSE,
	paymentType VARCHAR(20) DEFAULT 'online',
	shippingStatus VARCHAR(20) NOT NULL DEFAULT 'Not shipped',
	finalPrice DOUBLE,
	dateOfSubmit TIMESTAMP,
	address VARCHAR(400),
	PRIMARY KEY (email,basketNum),
	FOREIGN KEY (email,basketNum) REFERENCES BasketSetNum(refCost,basketNum) ON DELETE CASCADE,
	FOREIGN KEY (email) REFERENCES allCostumer (email) ON DELETE CASCADE
);

CREATE TABLE Employee(
	refComp VARCHAR(30) NOT NULL REFERENCES Company(regCode) ON DELETE CASCADE,
	refCost VARCHAR(70) NOT NULL REFERENCES Costumer(email) ON DELETE CASCADE,
	personnelCode VARCHAR(20) NOT NULL,
	isValid BOOLEAN DEFAULT FALSE,
	PRIMARY KEY (refCost)
);

CREATE TABLE shipping (
	refCost VARCHAR(70) NOT NULL REFERENCES allCostumer(email) ON DELETE CASCADE,
	refDriver INT NOT NULL UNIQUE REFERENCES Driver(personalID) ON DELETE CASCADE,
	refBasketNum INT NOT NULL,
	dateOfShipping TIMESTAMP,
	FOREIGN KEY (refCost ,refBasketNum) REFERENCES OrderGoods(email, basketNum) ON DELETE CASCADE,
	PRIMARY KEY (refDriver ,refCost ,refBasketNum)
);


CREATE TABLE Comments (
	commentDate TIMESTAMP,
	refCost VARCHAR(70) NOT NULL REFERENCES allCostumer(email) ON DELETE CASCADE,
	refGoods VARCHAR(20) NOT NULL REFERENCES Goods(id) ON DELETE CASCADE,
	commentText VARCHAR(600),
	PRIMARY KEY (commentDate ,refCost ,refGoods)
);

CREATE TABLE Suggestion (
	suggestText VARCHAR(600),
	refCost VARCHAR(70) NOT NULL REFERENCES allCostumer(email) ON DELETE CASCADE,
	refBackUp VARCHAR(30) NOT NULL REFERENCES Backup(userName) ON DELETE CASCADE,
	suggestDate TIMESTAMP,
	title VARCHAR(30),
	PRIMARY KEY (refCost , refBackUp ,suggestDate)
);

CREATE TABLE Agent (
  refComp VARCHAR(20) REFERENCES Company(regCode) ON DELETE CASCADE,
  personalNum INT NOT NULL,
  firstName VARCHAR(20),
  lastName VARCHAR(20),
  durationOfActivation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (refComp ,personalNum)
);

CREATE TABLE agentPhone (
  refComp VARCHAR(20) REFERENCES Company(regCode) ON DELETE CASCADE,
  refAgent INT NOT NULL,
  phoneNumber VARCHAR(20),
  FOREIGN KEY(refComp ,refAgent) REFERENCES Agent(refComp ,personalNum),
  PRIMARY KEY (refComp ,refAgent ,phoneNumber)
);

