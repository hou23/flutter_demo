import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  final List<SearchItem> data;
  String keyword;

  SearchModel({this.data, this.keyword});

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}

@JsonSerializable()
class SearchItem {
  final String word;
  final String type;
  final String price;
  final String star;
  final String zonename;
  final String districtname;
  final String url;


  SearchItem({this.word, this.type, this.price, this.star, this.zonename,
      this.districtname, this.url});

  factory SearchItem.fromJson(Map<String, dynamic> json) =>
      _$SearchItemFromJson(json);

  Map<String, dynamic> toJson() => _$SearchItemToJson(this);
}
