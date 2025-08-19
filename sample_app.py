import os

from flask import Flask
from flask import request
from flask import render_template
from flask import redirect
from flask import url_for
from pymongo import MongoClient
from bson import ObjectId

sample = Flask(__name__)

mongo_uri  = os.environ.get("MONGO_URI")
db_name    = os.environ.get("DB_NAME")


client = MongoClient(mongo_uri)
mydb = client[mongo_uri]
mycol = mydb["routers"]

@sample.route("/")
def main():
    print(list(mycol.find()))
    return render_template("index.html", data=list(mycol.find()))

@sample.route("/add", methods=["POST"])
def add_comment():
    ip = request.form.get("ip")
    username = request.form.get("username")
    password = request.form.get("password")

    mycol.insert_one({"ip": ip, "username": username, "password": password})
    
    return redirect(url_for("main"))

@sample.route("/delete", methods=["POST"])
def delete_comment():
    try:

        id = str(request.form.get("_id"))
        mycol.delete_one({"_id": ObjectId(id)})
    except Exception:
        pass
    return redirect(url_for("main"))

if __name__ == "__main__":
    sample.run(host="0.0.0.0", port=8080)