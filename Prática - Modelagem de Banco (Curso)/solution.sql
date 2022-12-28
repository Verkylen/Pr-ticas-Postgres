CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE classes (
    id SERIAL PRIMARY KEY,
    code TEXT NOT NULL UNIQUE
);

CREATE TABLE students_classes (
    id SERIAL PRIMARY KEY,
    "studentId" INTEGER NOT NULL,
    "classId" INTEGER NOT NULL,
    "entryMoment" TIMESTAMP NOT NULL,
    "exitMoment" TIMESTAMP NOT NULL
);

CREATE TABLE modules (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
); 

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    "moduleId" INTEGER NOT NULL
); 

CREATE TYPE "gradeTypes" AS ENUM ('Abaixo das expectativas', 'Dentro das Expectativas', 'Acima das Expectativas'); 

CREATE TABLE deliveries (
    id SERIAL PRIMARY KEY,
    "studentId" INTEGER NOT NULL,
    "deliveryTime" TIMESTAMP NOT NULL,
    grade "gradeTypes" NOT NULL,
    "projectId" INTEGER NOT NULL
);

ALTER TABLE students_classes ADD CONSTRAINT students_classes_fk0 FOREIGN KEY ("studentId") REFERENCES students(id);

ALTER TABLE students_classes ADD CONSTRAINT students_classes_fk1 FOREIGN KEY ("classId") REFERENCES classes(id);

ALTER TABLE projects ADD CONSTRAINT projects_fk0 FOREIGN KEY ("moduleId") REFERENCES modules(id); 

ALTER TABLE deliveries ADD CONSTRAINT deliveries_fk0 FOREIGN KEY ("studentId") REFERENCES students(id); 

ALTER TABLE deliveries ADD CONSTRAINT deliveries_fk1 FOREIGN KEY ("projectId") REFERENCES projects(id);