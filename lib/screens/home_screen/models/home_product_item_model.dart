import 'package:json_annotation/json_annotation.dart';

part 'home_product_item_model.g.dart';

@JsonSerializable()
class HomeProductItemModel {
  final double rating;
  bool isLiked;
  final String title;
  final String image;
  final String subtitle;
  final double price;
  final String brand;

  HomeProductItemModel({
    required this.rating,
    required this.isLiked,
    required this.title,
    required this.image,
    required this.subtitle,
    required this.price,
    required this.brand,
  });

  factory HomeProductItemModel.fromJson(Map<String, dynamic> json) =>
      _$HomeProductItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeProductItemModelToJson(this);
}
