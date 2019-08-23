import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

import '../constant/naming.dart';

/// 底层db，不应该随意修改
///
class DBProvider {
  static String _dbPath;
  static Database _dataBase;

  DBProvider() {
    initDB();
  }

  initDB() async{
    if (_dbPath == null) {
      final _directory = await getApplicationDocumentsDirectory();
      _dbPath = Path.join(_directory.path, DATABASE_NAME);
    }

    _dataBase =  await openDatabase(
      _dbPath,
      version: 1
    );
  }

  closeDB() {
    if (_dataBase != null) {
      _dataBase.close();
    }
  }
}