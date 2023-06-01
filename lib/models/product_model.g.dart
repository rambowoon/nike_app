// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as int?,
      photo: json['photo'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      price_new: (json['price_new'] as num?)?.toDouble(),
      discount: json['discount'] as int?,
      view: json['view'] as int?,
      type: json['type'] as String?,
      image: json['image'] as String?,
      gallery: json['gallery'] as List<dynamic>?,
      rating: json['rating'] == null
          ? null
          : RatingModel.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'price_new': instance.price_new,
      'discount': instance.discount,
      'view': instance.view,
      'type': instance.type,
      'image': instance.image,
      'gallery': instance.gallery,
      'rating': instance.rating,
    };
