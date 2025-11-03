// MongoDB: list users and roles (run with mongo shell)
print("MongoDB Users and Roles - " + new Date());
db.getSiblingDB("admin").system.users.find({}).forEach(function(u){ printjson(u) });
