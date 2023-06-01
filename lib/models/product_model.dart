import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nike/models/rating_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    int? id,
    String? photo,
    String? title,
    String? description,
    double? price,
    double? price_new,
    int? discount,
    int? view,
    String? type,
    String? image,
    List<dynamic>? gallery,
    RatingModel? rating
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
  _$ProductModelFromJson(json);
}