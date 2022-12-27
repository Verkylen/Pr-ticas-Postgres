CREATE TABLE airlines (
    id SERIAL PRIMARY KEY,
    acronym TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    acronym TEXT NOT NULL UNIQUE,
    "airlineId" INTEGER NOT NULL,
    "departureAirportId" INTEGER NOT NULL,
    "arrivalAirportId" INTEGER NOT NULL,
    "departureTime" TIMESTAMP WITH TIME ZONE NOT NULL,
    "arrivalTime" TIMESTAMP WITH TIME ZONE NOT NULL
);

ALTER TABLE flights ADD CONSTRAINT flights_fk0 FOREIGN KEY "airlineId" REFERENCES airlines(id);

ALTER TABLE flights ADD CONSTRAINT flights_fk1 FOREIGN KEY "departureAirportId" REFERENCES airports(id);

ALTER TABLE flights ADD CONSTRAINT flights_fk2 FOREIGN KEY "arrivalAirportId" REFERENCES airports(id);

CREATE TABLE airports (
    id SERIAL PRIMARY KEY,
    acronym TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL UNIQUE,

);