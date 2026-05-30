CREATE TABLE Staedte (
    Name VARCHAR(100),
    Bundesland VARCHAR(100),
    -- Zusammengesetzte Primärschlüssel:
    PRIMARY KEY (Name, Bundesland)
);

CREATE TABLE Bahnhoefe (
    BName VARCHAR(100) PRIMARY KEY,
    AnzahlGleise INT,
    SName VARCHAR(100) NOT NULL,
    Bundesland VARCHAR(100) NOT NULL,
    -- Der Fremdschlüssel verweist auf die zusammengesetzten Primärschlüssel der Tabelle Staedte:
    FOREIGN KEY (SName, Bundesland) REFERENCES Staedte(Name, Bundesland)
);

CREATE TABLE Zuege (
    ZugNr INT PRIMARY KEY,
    Laenge INT,
    StartBahnhof VARCHAR(100) NOT NULL,
    ZielBahnhof VARCHAR(100) NOT NULL,
    FOREIGN KEY (StartBahnhof) REFERENCES Bahnhoefe(Name),
    FOREIGN KEY (ZielBahnhof) REFERENCES Bahnhoefe(Name)
);
CREATE TABLE verbindet (
    ZugNr INT,
    Von_BHf VARCHAR(100),
    Nach_BHf VARCHAR(100),
    Abfahrt TIME,
    Ankunft TIME,
    -- DEINE LOGIK: ZugNr und Von_BHf reichen nicht, die Abfahrtszeit macht es eindeutig!
    PRIMARY KEY (ZugNr, Von_BHf, Abfahrt),
    FOREIGN KEY (ZugNr) REFERENCES Zuege(ZugNr),
    FOREIGN KEY (Von_BHf) REFERENCES Bahnhoefe(BName),
    FOREIGN KEY (Nach_BHf) REFERENCES Bahnhoefe(BName)
);