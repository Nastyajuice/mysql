import pymysql

db = pymysql.connect('localhost','root','1765','mydb')

cursor = db.cursor()
while True:
    print('''Введите действие:
Просмотреть-1, Добавить-2, Редактировать-3, Удалить-4, Выход-5''')
    a = input(":::")
    if a == '1':

        cursor.execute("SELECT * FROM `mydb`.`studentsIU-10-15`;")
        data = cursor.fetchall()

        print(*data, sep="\n")

    elif a == '2':

        surname = input("Введите фамилию:")
        name = input("Введите имя:")
        pat = input("Введите отчество:")

        cursor.execute("INSERT INTO `mydb`.`students IU-10-15` (`Фамилия`, `Имя`, `Отчество`) VALUES (%s, %s, %s);", (surname,name,pat))
        cursor.execute("SELECT * FROM mydb.studentsIU-10-15;")

        print("Студент занесен в таблицу")

    elif a == '3':
        id = input("Введите ID студента которого хотите изменить:")
        surname = input("Введите фамилию :")
        name = input("Введите имя :")
        pat = input('Введите отчетство :')

        sql = "UPDATE `mydb`.`students` SET `Фамилия` = '%s', `Имя` = '%s', `Отчество` = '%s' WHERE (`idStudents` = '%s');"% (surname,name,pat,id)

        cursor.execute(sql)
        cursor.execute("SELECT * FROM mydb.studentsIU-10-15;")
        print("Студент изменен")

    elif a == '4':
        id = input("Введите ID студента которого хотите удалить:")
        sql = "DELETE FROM `mydb`.`students` WHERE (`idStudents` = '%s');"%(id)

        cursor.execute(sql)
        cursor.execute("SELECT * FROM mydb.studentsIU10-15;")
        print("Студент удален!")

    elif a == '5':
        break
db.commit()

db.close()




