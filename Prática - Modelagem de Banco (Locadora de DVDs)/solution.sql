CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE discs (
    id SERIAL PRIMARY KEY,
    number TEXT NOT NULL UNIQUE,
    "barCode" TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL
);

CREATE TABLE actors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    nacionality TEXT NOT NULL,
    "birthDate" DATE NOT NULL
);

CREATE TABLE movies_actors (
    id SERIAL PRIMARY KEY,
    "discId" INTEGER NOT NULL,
    "actorId" INTEGER NOT NULL
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    phone VARCHAR(11) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE
);

CREATE TABLE addresses (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    street TEXT NOT NULL,
    number TEXT NOT NULL,
    complement TEXT NOT NULL,
    district TEXT NOT NULL,
    cep CHAR(8) NOT NULL,
    town TEXT NOT NULL,
    state TEXT NOT NULL
);

CREATE TABLE rentals (
    id SERIAL PRIMARY KEY,
    "discId" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "rentDate" DATE NOT NULL DEFAULT NOW(),
    "returnDate" DATE NOT NULL DEFAULT NOW(),
    "rating" INTEGER NOT NULL
);

CREATE TABLE ratings (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    rating INTEGER NOT NULL,
    "date" DATE NOT NULL DEFAULT NOW()
);

ALTER TABLE discs ADD CONSTRAINT discs_fk0 FOREIGN KEY ("categoryId") REFERENCES categories(id);

ALTER TABLE movies_actors ADD CONSTRAINT movies_actors_fk0 FOREIGN KEY ("discId") REFERENCES discs(id);

ALTER TABLE movies_actors ADD CONSTRAINT movies_actors_fk1 FOREIGN KEY ("actorId") REFERENCES actors(id);

ALTER TABLE addresses ADD CONSTRAINT addresses_fk0 FOREIGN KEY ("customerId") REFERENCES customers(id);

ALTER TABLE rentals ADD CONSTRAINT rentals_fk0 FOREIGN KEY ("discId") REFERENCES discs(id);

ALTER TABLE rentals ADD CONSTRAINT rentals_fk1 FOREIGN KEY ("customerId") REFERENCES customers(id);

ALTER TABLE ratings ADD CONSTRAINT ratings_fk0 FOREIGN KEY ("customerId") REFERENCES customers(id);