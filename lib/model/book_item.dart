import 'package:json_annotation/json_annotation.dart';

part 'book_item.g.dart';

@JsonSerializable()
class BookItem {
  String id;
  String name;
  String intro;
  String interpreter;
  String cover;
  double version;
  double progress;
  BookItemEnum bookItemEnum;

  BookItem(this.id
      , this.name
      , this.interpreter
      , this.version
      , this.intro
      , this.cover
      , this.progress
      , this.bookItemEnum);

  factory BookItem.fromJson(Map<String, dynamic> json) => _$BookItemFromJson(json);

  Map<String, dynamic> toJson() => _$BookItemToJson(this);
}

enum BookItemEnum {
  downloadable,
  downloading,
  readable
}