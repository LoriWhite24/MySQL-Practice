"""
 Author: Lori White
"""
import configparser
import mysql.connector
from mysql.connector import Error

config = configparser.RawConfigParser()
config.read('Data_Files/config.properties')

def get_connection(db):
  connection = None
  try:
    connection = mysql.connector.connect(host=config.get('DatabaseSection', 'hostname'),
      database=db, auth_plugin="mysql_native_password",
      user=config.get('DatabaseSection', 'username'),
      password=config.get('DatabaseSection', 'password'))
    if connection.is_connected():
      db_Info = connection.get_server_info()
      print("Connected to MySQL Server version ", db_Info)
      cursor = connection.cursor()
      cursor.execute("select database();")
      record = cursor.fetchone()
      print("You're connected to database: ", record)
  except Error as e:
    print("Error while connecting to MySQL", e)

  return connection

mydb = get_connection('book_store')
mycursor = mydb.cursor()

mycursor.execute("SELECT * FROM employees")

myresult = mycursor.fetchall()

for x in myresult:
  print(x)

mycursor.close()
mydb.close()