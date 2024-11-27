-- Insérer des administrateurs
INSERT INTO `administrator` (`id`, `name`, `lastName`, `dateOfBirth`, `mail`, `phone`, `adress`, `login`, `password`)
VALUES
    (1, 'John', 'Doe', '1980-01-15', 'john.doe@admin.com', 1234567890, '123 Admin Street', 'adminJohn', 'securePass1'),
    (2, 'Jane', 'Smith', '1985-02-20', 'jane.smith@admin.com', 1234567891, '456 Admin Lane', 'adminJane', 'securePass2');

-- Insérer des étudiants
INSERT INTO `student` (`id`, `name`, `lastName`, `dateOfBirth`, `mail`, `phone`, `adress`, `login`, `password`, `degree`, `class`)
VALUES
    (1, 'Alice', 'Brown', '2003-09-12', 'alice.brown@student.com', 1234567892, '789 Student Road', 'studentAlice', 'passAlice', 1, 'Math101'),
    (2, 'Bob', 'Johnson', '2002-11-30', 'bob.johnson@student.com', 1234567893, '321 Student Avenue', 'studentBob', 'passBob', 2, 'History201');

-- Insérer des professeurs
INSERT INTO `teacher` (`id`, `name`, `lastName`, `dateOfBirth`, `mail`, `phone`, `adress`, `login`, `password`, `subject`)
VALUES
    (1, 'Charles', 'White', '1975-07-18', 'charles.white@teacher.com', 1234567894, '654 Teacher Blvd', 'teacherCharles', 'teacherPass1', 'Mathematics'),
    (2, 'Diana', 'Green', '1980-03-22', 'diana.green@teacher.com', 1234567895, '987 Teacher Drive', 'teacherDiana', 'teacherPass2', 'History');
