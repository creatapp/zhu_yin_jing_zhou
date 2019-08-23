import 'package:json_annotation/json_annotation.dart';

/// 所有模型都应该继承这个类
///
@JsonSerializable()
abstract class MyModel {
//  factory MyModel.fromJson(Map<String, dynamic> json) => MyModel();

  Map<String, dynamic> toJson();
}