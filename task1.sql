DROP DATABASE IF EXISTS hw_prog_1;
CREATE DATABASE hw_prog_1;
USE hw_prog_1;

-- Task 1.1: Create tables
CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_title VARCHAR(100),
    department VARCHAR(100)
);

CREATE TABLE researchers (
    researcher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    project_id INT,
    CONSTRAINT fk_project
        FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
-- Task 1.2: Insert Data
INSERT INTO projects (project_id, project_title, department) VALUES
(1,'Brain Scan', 'Neuroscience'),
(2,'Cryptography','CS'),
(3,'AI Project', 'AI Lab'),
(4, 'Bio Signal', 'Biomedical');

INSERT INTO researchers (researcher_id, name, position, project_id) VALUES
(1, 'Alice', 'PhD', 1),
(2, 'Ben', 'Postdoc', 1),
(3, 'Cara', 'Assistant', 2),
(4, 'David', 'PhD', 3),
(5, 'Eva', 'Postdoc', 3),
(6, 'Frank', 'Assistant', 4);



-- Display all tables after Task 1.2
SELECT * FROM projects ORDER BY project_id ASC;
SELECT * FROM researchers ORDER BY researcher_id ASC;


-- -- Task 1.3: Update tables
UPDATE projects
SET department = 'Bio Eng'
WHERE project_title = 'Bio Signal';

UPDATE researchers
SET position = 'Senior Assistant'
WHERE name = 'Cara';

-- -- Display all tables after Task 1.3
SELECT * FROM projects ORDER BY project_id ASC;
SELECT * FROM researchers ORDER BY researcher_id ASC;


-- -- Task 1.4: Delete operations
DELETE FROM researchers
WHERE researcher_id = 1;

DELETE FROM projects
WHERE project_id = 2;



-- Display all tables after Task 1.4
SELECT * FROM projects ORDER BY project_id ASC;
SELECT * FROM researchers ORDER BY researcher_id ASC;



-- Task 1.5: Show all projects from the Computer Science department, ordered by project_id in ascending order.
SELECT project_id, project_title, department
FROM projects
WHERE department = 'AI Lab'
ORDER BY project_id ASC;

-- Task 1.6: Show all researchers who are `Postdoc`, ordered by researcher_id in ascending order.

SELECT researcher_id, name, position, project_id
FROM researchers
WHERE position = 'Postdoc'
ORDER BY researcher_id ASC;

-- Task 1.7: Show the name of each researcher along with their project title, ordered by researcher_name in ascending order.
SELECT
    researchers.name AS researcher_name,
    projects.project_title
FROM researchers
LEFT JOIN projects
    ON researchers.project_id = projects.project_id
ORDER BY researcher_name ASC;