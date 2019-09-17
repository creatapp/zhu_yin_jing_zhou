
/// 2019/9/17
/// 使用访问者模式来解析传过来的字符串
/// 规则请参考 {doc/interpreter.md}
class Interpreter {
  // singleton
  static Interpreter _interpreter;
  Interpreter._();
  static Interpreter getInstance () {
    if (_interpreter == null) {
      _interpreter = Interpreter._();
    }
    return _interpreter;
  }

  //
}

class InterpreterType {
  //一部经咒
  static const String Book = '00';

  //题目
  static const String BookTitle = '10';
  static const String VolumeTitle = '11';
  static const String ParagraphTitle = '12';
  static const String SectionTitle = '13';

  //名称
  static const String interpreter = '20';
  static const String name = '21';

  //字
  static const String sectionAligned = '30';
  static const String sectionUnaligned = '31';
  static const String space = '32';
  static const String line = '33';
  static const String hint = '34';
  static const String context = '35';

  //格式
  static const String newPage = '40';
}