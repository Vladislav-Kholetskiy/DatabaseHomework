CREATE TABLE Classes (
	class VARCHAR(100) NOT NULL,
	type VARCHAR(20) NOT NULL CHECK (type IN ('Racing', 'Street')), 
	country VARCHAR(100) NOT NULL,
	numDoors INT NOT NULL,
	engineSize DECIMAL(3, 1) NOT NULL, 
	weight INT NOT NULL,            
	PRIMARY KEY (class)
);

CREATE TABLE Cars (
	name VARCHAR(100) NOT NULL,
	class VARCHAR(100) NOT NULL,
	year INT NOT NULL,
	PRIMARY KEY (name),
	FOREIGN KEY (class) REFERENCES Classes(class)
);

CREATE TABLE Races (
	name VARCHAR(100) NOT NULL,
	date DATE NOT NULL,
	PRIMARY KEY (name)
);

CREATE TABLE Results (
	car VARCHAR(100) NOT NULL,
	race VARCHAR(100) NOT NULL,
	position INT NOT NULL,
	PRIMARY KEY (car, race),
	FOREIGN KEY (car) REFERENCES Cars(name),
	FOREIGN KEY (race) REFERENCES Races(name)
);