CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email CHAR(11) NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price INTEGER NOT NULL,
    "mainImageUrl" TEXT NOT NULL,
    category TEXT NOT NULL,
    size TEXT NOT NULL
);

CREATE TABLE other_photos (
    id SERIAL PRIMARY KEY,
    "productId" INTEGER NOT NULL REFERENCES products(id),
    "imageUrl" TEXT NOT NULL
);

CREATE TABLE requests (
    id SERIAL PRIMARY KEY,
    "userId" INTEGER NOT NULL REFERENCES users(id),
    "productId" INTEGER NOT NULL REFERENCES products(id),
    size TEXT NOT NULL,
    amount INTEGER NOT NULL,
    adress TEXT NOT NULL,
    status TEXT NOT NULL,
    date TIMESTAMP NOT NULL DEFAULT NOW()
);