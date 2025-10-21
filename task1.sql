DROP DATABASE IF EXISTS hw_prog_1;
CREATE DATABASE hw_prog_1;
USE hw_prog_1;

-- Task 1.1: Create tables
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_title VARCHAR(100),
    department VARCHAR(100)
);

CREATE TABLE researchers(
    researcher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VAARCHAR(100),
    position VARCHAR(100),
    project_id INT,
    CONSTRAINT fk_project
    FORIEGN KEY (project_id)
    REFERENCES projects(project_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
)
-- Task 1.2: Insert Data
INSERT INTO projects (project_id, project_title, department) VALUES
(1,'Brain Scan', 'Neuroscience'),
(2,'Cryptography','CS'),
(3,'AI Project', 'AI LAB'),
(4, 'BIO signal', 'Biomedical');

INSERT INTO researchers (researcher_id, name, position, project_id) VALUES
(1,'ALice', 'PhD', 1),
(2,'Ben','Postdoc',2),
(3,'Cara','Assistant',2),
(4,'David','Phd',2),
(5, 'Eva', 'Postdoc', 3),
(6, 'Frank', 'Assistant',4);



-- Display all tables after Task 1.2
SELECT * FROM projects ORDER BY project_id ASC;
SELECT * FROM researchers ORDER BY researcher_id ASC;


-- -- Task 1.3: Update tables
UPDATE projects
SET department= 'Bio Eng';
WHERE project_title= 'Bio Signal';

UPDATE researchersSET postion = 'Senior Assistant'
WHere name='Cara';

-- -- Display all tables after Task 1.3
SELECT * FROM projects ORDER BY project_id ASC;
SELECT * FROM researchers ORDER BY researcher_id ASC;


-- -- Task 1.4: Delete operations
DELETE FROM researchers
WHERE researcher_id=1;

DELETE FROM projects
WHERE project_id =2;



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
SELECT r.name AS researcher_name, p.project_title
FROM researchers r
LEFT JOIN projects p on r.project_id = p.project_id
ORDER BY researcher_name ASC;
