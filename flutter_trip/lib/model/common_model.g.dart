// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonModel _$CommonModelFromJson(Map<String, dynamic> json) {
  return CommonModel(
    json['icon'] as String,
    json['title'] as String,
    json['url'] as String,
    json['statusBarColor'] as String,
    json['hideAppBar'] as bool,
  );
}

Map<String, dynamic> _$CommonModelToJson(CommonModel instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'url': instance.url,
      'statusBarColor': instance.statusBarColor,
      'hideAppBar': instance.hideAppBar,
    };
