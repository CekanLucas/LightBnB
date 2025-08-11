-- resert table

DELETE FROM users;
DELETE FROM reservations;

INSERT INTO users 
VALUES (1, 'Jack Sparrow', 'matey@gmail.com', 'iratepirate28');

INSERT INTO users 
VALUES (2, 'Chris Kringles', 'cracklepop@gmail.com', '12cracklepop');

INSERT INTO users 
VALUES (3, 'Smarticus Assicus', 'smartass@gmail.com', 'passwordofsmartass'); 

-- insert multiple rows at once

INSERT INTO reservations

VALUES 
(1, '2018-09-11', '2018-09-26'),
(2, '2019-01-04', '2019-02-01'),
(3, '2021-10-01', '2021-10-14');


