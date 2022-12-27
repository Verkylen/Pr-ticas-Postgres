CREATE TABLE states (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    "stateId" INTEGER NOT NULL
);

CREATE TYPE "customerPhonesTypes" AS ENUM ('landline', 'mobile');

CREATE TABLE "customerPhones" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    number VARCHAR(11) NOT NULL,
    type "customerPhonesTypes" NOT NULL
);

CREATE TABLE "customerAddresses" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL UNIQUE,
    street TEXT NOT NULL,
    number TEXT NOT NULL,
    complement TEXT NOT NULL,
    "postalCode" CHAR(8) NOT NULL,
    "cityId" INTEGER NOT NULL
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    "fullName" TEXT NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE "bankAccount" (
    id SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    "accountNumber" VARCHAR(9) NOT NULL,
    agency VARCHAR(5) NOT NULL,
    "openDate" DATE NOT NULL,
    "closeDate" DATE NOT NULL
);

CREATE TYPE "transactionsTypes" AS ENUM('deposit', 'withdraw');

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    type "transactionsTypes" NOT NULL,
    time TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    description TEXT NOT NULL,
    cancelled BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE "creditCards" (
    id SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    name TEXT NOT NULL,
    number CHAR(16) NOT NULL,
    "securityCode" CHAR(16) NOT NULL,
    "expirationMonth" CHAR(2) NOT NULL,
    "expirationYear" CHAR(2) NOT NULL,
    password TEXT NOT NULL,
    "limit" INTEGER NOT NULL
);

ALTER TABLE cities ADD CONSTRAINT cities_fk0 FOREIGN KEY ("stateId") REFERENCES states(id);

ALTER TABLE "customerPhones" ADD CONSTRAINT "customerPhones_fk0" FOREIGN KEY ("customerId") REFERENCES customers(id);

ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk0" FOREIGN KEY ("customerId") REFERENCES customers(id);

ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk1" FOREIGN KEY ("cityId") REFERENCES cities(id);

ALTER TABLE "bankAccount" ADD CONSTRAINT "bankAccount_fk0" FOREIGN KEY ("customerId") REFERENCES customers(id);

ALTER TABLE transactions ADD CONSTRAINT transactions_fk0 FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"(id);

ALTER TABLE "creditCards" ADD CONSTRAINT "creditCards_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"(id);