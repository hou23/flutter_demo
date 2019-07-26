import 'common_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grid_nav_model.g.dart';

// 首页网格卡片模型
@JsonSerializable()
class GridNavModel {
  final GridNavItem hotel;
  final GridNavItem flight;
  final GridNavItem travel;

  GridNavModel({this.hotel, this.flight, this.travel});

  factory GridNavModel.fromJson(Map<String, dynamic> json) =>
      _$GridNavModelFromJson(json);

  Map<String, dynamic> toJson() => _$GridNavModelToJson(this);
}

@JsonSerializable()
class GridNavItem {
  final String startColor;
  final String endColor;
  final CommonModel mainItem;
  final CommonModel item1;
  final CommonModel item2;
  final CommonModel item3;
  final CommonModel item4;

  GridNavItem(
      {this.startColor,
      this.endColor,
      this.mainItem,
      this.item1,
      this.item2,
      this.item3,
      this.item4});

  factory GridNavItem.fromJson(Map<String, dynamic> json) =>
      _$GridNavItemFromJson(json);

  Map<String, dynamic> toJson() => _$GridNavItemToJson(this);
}
