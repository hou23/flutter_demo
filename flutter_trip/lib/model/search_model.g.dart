// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) {
  return SearchModel(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : SearchItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    keyword: json['keyword'] as String,
  );
}

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'keyword': instance.keyword,
    };

SearchItem _$SearchItemFromJson(Map<String, dynamic> json) {
  return SearchItem(
    word: json['word'] as String,
    type: json['type'] as String,
    price: json['price'] as String,
    star: json['star'] as String,
    zonename: json['zonename'] as String,
    districtname: json['districtname'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$SearchItemToJson(SearchItem instance) =>
    <String, dynamic>{
      'word': instance.word,
      'type': instance.type,
      'price': instance.price,
      'star': instance.star,
      'zonename': instance.zonename,
      'districtname': instance.districtname,
      'url': instance.url,
    };
