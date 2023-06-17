import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    int? id,
    String? photo,
    String? title,
    String? description,
    int? view,
    int? date_created,
    String? type,
    String? image,
  }) = _NewsModel;
  
  

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}