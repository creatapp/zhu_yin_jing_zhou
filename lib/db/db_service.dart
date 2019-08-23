

import 'db_provider.dart';
import '../model/my_model.dart';

/// 所有需要持久化的数据继承这个接口
///
abstract class DBService {
  static DBProvider dbProvider = DBProvider();

  MyModel insert(MyModel model);

  MyModel delete(MyModel model);

  MyModel update(MyModel oldModel, MyModel newModel);

  MyModel find(dynamic id);
}