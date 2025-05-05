import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String? id;
  final String? name;
  final String? shop;
  final String? category;
  final String? description;
  final String? image;
  final String? price;
  final String? status;
  final String? rating;
  final String? numberoforders;

  ProductModel({
    this.id,
    this.name,
    this.shop,
    this.category,
    this.description,
    this.image,
    this.price,
    this.status,
    this.rating,
    this.numberoforders,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
