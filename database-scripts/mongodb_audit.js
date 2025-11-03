// MongoDB Security Audit Script
print("=== MongoDB Users ===");
printjson(db.system.users.find().toArray());

