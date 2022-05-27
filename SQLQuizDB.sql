CREATE DATABASE QuizDB
GO
USE QuizDB
GO
CREATE TABLE USERS
(
ID int IDENTITY (1,1) NOT Null CONSTRAINT PK_user PRIMARY KEY,
UserName varchar(30) NOT NULL,
SCORE int NOT Null
)

CREATE TABLE Questions
(
Number int,
Question varchar(MAX) NOT NULL,
TrueAnswer int NOT NULL,
FirstAns varchar(50) NOT NULL,
SecondAns varchar(50) NOT NULL,
ThirdAns varchar(50) NOT NULL,
ForthAns varchar(50) NOT NULL
)
INSERT Questions (Number, Question, TrueAnswer, FirstAns, SecondAns, ThirdAns, ForthAns) VALUES
(10, 'По данным археологов, люди современного вида появились на Земле:', 2, 'Более 2 млн лет назад', '40 тыс. лет назад', '10 тыс. лет назад', 'В 4 тысячелетии до н.э'),
(10, 'Бог Солнца в Древнем Египте:', 1, 'Ра', 'Сет', 'Оссирис', 'Гор'),
(10, 'На чем писали в Междуречье в древности:', 2, 'Папирусе', 'Глиняных табличках', 'Пергаменте', 'Бумаге'),
(10, 'С каким островом связан миф о лабиринте и Минотавре:', 1, 'Крит', 'Саламин', 'Форос', 'Сицилия')
INSERT Questions (Number, Question, TrueAnswer, FirstAns, SecondAns, ThirdAns, ForthAns) VALUES
(20, 'Чему равно значение суммы 354 и 326?', 1, '680', '580', '670', '590'),
(20, 'Пешеход идет со скоростью 7 км/ч. Через сколько часов он преодолеет расстояние в 56 км?', 3, '6ч', '7ч', '8ч', '9ч'),
(20, 'Одна сторона прямоугольника равна 70 см, а площадь – 210см2. Найдите периметр этого прямоугольника.', 2, '73 см', '100 см', '292 см', '146 см'),
(20, 'После того как одну из цифр неизвестного числа в разряде единиц тысяч увеличили на 3, получилось 75436. Найдите первоначальное число.', 4, '77436', '75433', '72436', '77433'),
(20, 'Найдите неравенство, решением которого является число 3', 1, 'x ≥ 3', 'у ≤ 2', 'a•4 < 5', '18:c–3 > 7');

DELETE FROM Questions
WHERE Number = 20


INSERT INTO USERS(UserName,SCORE)
VALUES('Alex',1)