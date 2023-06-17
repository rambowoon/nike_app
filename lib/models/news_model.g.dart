// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsModel _$$_NewsModelFromJson(Map<String, dynamic> json) => _$_NewsModel(
      id: json['id'] as int?,
      photo: json['photo'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      view: json['view'] as int?,
      date_created: json['date_created'] as int?,
      type: json['type'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_NewsModelToJson(_$_NewsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'title': instance.title,
      'description': instance.description,
      'view': instance.view,
      'date_created': instance.date_created,
      'type': instance.type,
      'image': instance.image,
    };
