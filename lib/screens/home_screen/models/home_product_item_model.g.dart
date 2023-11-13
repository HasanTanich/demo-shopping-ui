// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_product_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeProductItemModel _$HomeProductItemModelFromJson(
        Map<String, dynamic> json) =>
    HomeProductItemModel(
      rating: (json['rating'] as num).toDouble(),
      isLiked: json['isLiked'] as bool,
      title: json['title'] as String,
      image: json['image'] as String,
      subtitle: json['subtitle'] as String,
      price: (json['price'] as num).toDouble(),
      brand: json['brand'] as String,
    );

Map<String, dynamic> _$HomeProductItemModelToJson(
        HomeProductItemModel instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'isLiked': instance.isLiked,
      'title': instance.title,
      'image': instance.image,
      'subtitle': instance.subtitle,
      'price': instance.price,
      'brand': instance.brand,
    };
