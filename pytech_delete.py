from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.71xpc.mongodb.net/pytech"

client = MongoClient(url)
db = client.pytech

docs = db.students.find()

for doc in docs:
 print(doc)
 
 print(doc["student_id"])

db.students.delete_one(
  { "first_name" : "victor" , "last_name": "cruz", "student_id":"1010"}
)
