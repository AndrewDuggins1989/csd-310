from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.71xpc.mongodb.net/pytech"

client = MongoClient(url)
db = client.pytech

docs = db.students.find()

for doc in docs:
 print(doc)
 
 print(doc["student_id"])


db.students.update_one(
  { "student_id" : 1007 },
  { "$set": { "last_name": "smith" }}
)
