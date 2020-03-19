CREATE TABLE Neighborhood (
    Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
    [Name] VARCHAR(55) NOT NULL
);

CREATE TABLE [Owner] (
    Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
    [Name] VARCHAR(55) NOT NULL,
    [Address] VARCHAR(55) NOT NULL,
    NeighborhoodId INTEGER NOT NULL,
    PHONE VARCHAR(55) NOT NULL,
    CONSTRAINT FK_Owner_Neighborhood FOREIGN KEY(NeighborhoodId) REFERENCES Neighborhood(Id)
);

CREATE TABLE Walker (
    Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
    [Name] VARCHAR(55) NOT NULL,
    NeighborhoodId INTEGER NOT NULL,
    CONSTRAINT FK_Walker_Neighborhood FOREIGN KEY(NeighborhoodId) REFERENCES Neighborhood(Id)
);

CREATE TABLE Dog (
    Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
    [Name] VARCHAR(55) NOT NULL,
    OwnerId INTEGER NOT NULL,
    Breed VARCHAR(55) NOT NULL,
    Notes VARCHAR(255) NOT NULL,
    CONSTRAINT FK_Dog_Owner FOREIGN KEY(OwnerId) REFERENCES [Owner](Id)
);

CREATE TABLE Walks (
    Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
    [Date] DATETIME NOT NULL,
    Duration INTEGER NOT NULL,
    WalkerId INTEGER NOT NULL,
    DogId INTEGER NOT NULL,
    CONSTRAINT FK_Walks_Dog FOREIGN KEY(DogId) REFERENCES Dog(Id),
    CONSTRAINT FK_Walks_Walker FOREIGN KEY(WalkerId) REFERENCES Walker(Id)
);

INSERT INTO Neighborhood ([Name]) VALUES ('Mr. Rogers');
INSERT INTO Neighborhood ([Name]) VALUES ('Old Town');
INSERT INTO Neighborhood ([Name]) VALUES ('Section 8');

INSERT INTO Walker ([Name], [NeighborhoodId]) VALUES ('Willy', 1);
INSERT INTO Walker ([Name], [NeighborhoodId]) VALUES ('James', 2);
INSERT INTO Walker ([Name], [NeighborhoodId]) VALUES ('Namita', 3);

INSERT INTO [Owner] ([Name], [Address], NeighborhoodId, Phone) VALUES ('Adam', '5600 Cool Street', 1, '918-728-1114');
INSERT INTO [Owner] ([Name], [Address], NeighborhoodId, Phone) VALUES ('Onterio', '123 Beard Street', 2, '918-728-1115');
INSERT INTO [Owner] ([Name], [Address], NeighborhoodId, Phone) VALUES ('Mac', '1234 Hipster Blvd.', 3, '918-728-1116');
INSERT INTO [Owner] ([Name], [Address], NeighborhoodId, Phone) VALUES ('Garrett', '123 Knoxville Way', 2, '918-728-1117');

INSERT INTO Dog ([Name], OwnerId, Breed, Notes) VALUES ('Lulu', 1, 'Golden Retriever', 'Sweet girl');
INSERT INTO Dog ([Name], OwnerId, Breed, Notes) VALUES ('Percy', 2, 'Pitbull', 'Brownish color');
INSERT INTO Dog ([Name], OwnerId, Breed, Notes) VALUES ('Reginald', 3, 'Snow Husky', 'Still a puppy');
INSERT INTO Dog ([Name], OwnerId, Breed, Notes) VALUES ('Biscuit', 3, 'Pug', 'Pees everywhere');
INSERT INTO Dog ([Name], OwnerId, Breed, Notes) VALUES ('Salmon', 4, 'Bulldog', 'Lifts weights');

INSERT INTO Walks ([Date], Duration, WalkerId, DogId) VALUES ('04/20/2020', 25, 3, 1);
INSERT INTO Walks ([Date], Duration, WalkerId, DogId) VALUES ('07/20/2020', 32, 1, 4);
INSERT INTO Walks ([Date], Duration, WalkerId, DogId) VALUES ('08/04/2020', 45, 2, 3);