import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  //database creation
  static Future<sql.Database> OpenDb() async {
    return sql.openDatabase('datauser.db', version: 1,
        onCreate: (sql.Database database, int version) async {
          await createTable(database);
        });
  }

  static Future<void>createTable(sql.Database database) async {
    await database.execute('''CREATE TABLE user(
        id INTEGER PRIMARY KEY  AUTOINCREMENT NOT NULL,
        name TEXT,
        email TEXT,
        password TEXT  
      )''');
  }

  static Future<int> newuser(String name, String email, String password) async {
    final db = await SQLHelper.OpenDb();
    final data = {'name': name, 'email': email, 'password': password};
    final id = db.insert('user', data);
    return id;
  }

  static Future<List<Map>> logincheck(String email, String password) async {
    final db = await SQLHelper.OpenDb();
    final data = await db.rawQuery(
        "SELECT * FROM user WHERE email= '$email' AND password = '$password' ");
    if (data.isNotEmpty) {
      return data;
    }
    return data;
  }

  static Future<List<Map>> userFound(String uname, String eemail) async {
    final db = await SQLHelper.OpenDb();
    final data = await db.rawQuery(
        "SELECT * FROM user WHERE name= '$uname' AND email = '$eemail' ");
    if (data.isNotEmpty) {
      return data;
    }
    return data;
  }
  static Future<List<Map<String ,dynamic>>> getAll() async {
    final db = await SQLHelper.OpenDb();
    final data = db.rawQuery("SELECT * FROM user");
    return data;
  }

  static Future<void> Deleteuser(int id) async {
    final db = await SQLHelper.OpenDb();
    db.delete('user', where: 'id = ?', whereArgs: [id]);
  }

}
