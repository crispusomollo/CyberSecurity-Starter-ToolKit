// MongoDB backup check - run in mongo shell or node with appropriate permissions
var backupDir = "/backups/mongodb";
print("MongoDB Backup Check - " + new Date());
try {
  var files = listFiles(backupDir);
  files.sort(function(a,b){ return b.date - a.date; });
  for (var i=0;i<Math.min(10, files.length); i++) print(files[i].name);
} catch (e) {
  print("Cannot access backup dir or listFiles not available in this runtime: " + e);
}
