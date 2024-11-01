from bson import ObjectId
from pymongo import MongoClient
from envparse import Env

env = Env()
MONGODB_URL = env.str("MONGODB_URL", default="mongodb://localhost:27017")

client = MongoClient(MONGODB_URL)
notes = MongoClient(MONGODB_URL)


dbname = client['user_auth']
dbname = notes['user_notes']

collection_name = dbname["users"]
my_col = dbname["all_notes"]


def create_user(email, first_name, password):
    dbname = client['user_auth']
    user = {
        "email": email,
        "first_name": first_name,
        "password": password
    }
    
    x = dbname["users"].insert_one(user)
    

def get_user(email):
    dbname = client['user_auth']
    myquery = { "email": email }
    mydoc = dbname["users"].find_one(myquery)
    return mydoc


def create_note(note_html, user_id):
    dbname = notes['user_notes']
    note_plan = {
        "note_html": note_html,
        "user_id": user_id
    }
    
    x = dbname["all_notes"].insert_one(note_plan)
    
def find_note(user_id):
    dbname = notes['user_notes']
    all_notes = dbname["all_notes"].find({"user_id": user_id})
    return list(all_notes) 


def delete_note(note_id, user_id):
    dbname = notes['user_notes']
    result = dbname["all_notes"].delete_one({"_id": ObjectId(note_id), "user_id": user_id})
    return result


