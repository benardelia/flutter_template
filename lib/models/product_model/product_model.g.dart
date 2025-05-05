// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  shop: json['shop'] as String?,
  category: json['category'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String?,
  price: json['price'] as String?,
  status: json['status'] as String?,
  rating: json['rating'] as String?,
  numberoforders: json['numberoforders'] as String?,
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shop': instance.shop,
      'category': instance.category,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'status': instance.status,
      'rating': instance.rating,
      'numberoforders': instance.numberoforders,
    };
