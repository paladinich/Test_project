#Web python project based on flask, because of it's simplicity

from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
	return 'Acc-Project'
import MySQLdb
import time
import datetime

ts = time.time()
timestamp = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
conn = MySQLdb.connect(host= "10.10.10.5",
              user="root",
              passwd="iasegoasigjiajegpj23g",
              db="acc-proj")
x = conn.cursor()

try:
   x.execute("""INSERT into test (test_date,test1,test2) values(%s,%s,%s)""",(timestamp,test1,test2))
   conn.commit()
except:
   conn.rollback()

conn.close()
if __name__ == '__main__':
	app.run(debug=True)
