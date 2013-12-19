CREATE TABLE project(
title TEXT,
category TEXT,
funding_goal INTEGER,
start_date TIME,
end_date TIME)

INSERT INTO user (name, age)
VALUE
("Tyrion Lannister", 35),
("Cersei Lannister", 38),
("Jon Snow", 22),
("Jorah Mormont", 67),
("Petyr Baelish", 45),
("Davos Seaworth", 46),
("Margeary Tyrell", 19),
("Bran Stark", 5),
("Sansa Stark", 17),
("Bronn", 27),
("Theon Greyjoy", 32),
("Melissandre", 100),
("Gilly", 16),
("Shae", 22),
("Robb Stark", 28),
("Khal Drogo", 33),
("Eddard Stark", 40),
("Catelyn Stark", 39),
("Yoren", 76),
("Viserys", 28);


INSERT INTO project (title, category, funding_goal, start_date, end_date)
VALUE
('Helium', 'music', 100000, '2014-04-01', '2014-04-04'), 
('Dragons', 'books', 450, '2014-02-01', '2014-03-01'),
('Magic', 'music', 1000, '2014-04-04', '2014-05-15'),
('Sorcery', 'music', 200, '2014-05-10', '2014-06-11'),
('Witches', 'charity', 666, '2014-06-06', '2014-08-09'),
('Baba Yaga', 'charity', 456, '2014-07-07', '2014-08-14'),
('Children', 'books', 299, '2014-11-13', '2014-12-15'),
('Infants', 'charity', 4990, '2014-11-13', '2014-12-15'),
('Toddlers', 'books', 7990, '2014-10-13', '2014-12-14'),
('Tweens', 'music', 222, '2014-09-13', '2015-02-02');

#project starts at 4, max 13
#total of 30
INSERT INTO pledge (user_id, project_id, amount)
VALUE
(1, 10, 30),
(1, 11, 20),
(2, 13, 22),
(2, 12, 50),
(3, 12, 25),
(4, 5, 50),
(5, 5, 55),
(6, 6, 66),
(7, 8, 90),
(8, 9, 99),
(9, 4, 100),
(10, 5, 100),
(11, 6, 100),
(12, 7, 100),
(13, 7, 150),
(13, 8, 150),
(14, 8, 150),
(15, 8, 150),
(16, 13, 150),
(17, 11, 250),
(16, 13, 150),
(17, 4, 100),
(18, 5, 100),
(19, 6, 100),
(20, 6, 100),
(15, 8, 100),
(15, 6, 100),
(15, 9, 100),
(16, 9, 100),
(6, 9, 100)









