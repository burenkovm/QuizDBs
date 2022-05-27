import pyodbc
connection = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=BURENKOVPC;DATABASE=QuizDB;Trusted_Connection=yes;')
cursor=connection.cursor()
print("Введите имя:")
nameUser = input()
cursor.execute("SELECT * FROM USERS WHERE UserName = '"+nameUser+"'")
UserRow =  cursor.fetchone()

if(UserRow != None):
    print("С возвращением. Ваш суммарный результат: "+str(UserRow.SCORE)+".")
else:
    cursor.execute("insert into USERS(UserName,SCORE) values ('"+nameUser+"', 0)")
    connection.commit()
    print("Добро пожаловать.")
    
print("Какую викторины вы хотите пройти, " + nameUser + "?")
dictQuiz = dict([("История",10),("Математика",20)])
print("Викторины на выбор:")
for i in dictQuiz:
    print(i)
quiz = input()
idQuiz = dictQuiz.get(quiz)
cursor.execute("SELECT * FROM Questions WHERE Number = "+str(idQuiz))

rows = cursor.fetchall()

scoreTest = 0
for row in rows:
    print(row.Question+" 1. "+ row.FirstAns+ " 2. "+row.SecondAns+" 3. "+row.ThirdAns+" 4. "+row.ForthAns)
    AnswerUser = int(input())
    if row.TrueAnswer == AnswerUser:
        scoreTest += 1
print("Вы набрали "+str(scoreTest)+" балла.")        
connection.execute("UPDATE USERS SET SCORE = SCORE + "+ str(scoreTest) +" where ID = "+str(UserRow.ID))
connection.commit()
scoreTest = 0
