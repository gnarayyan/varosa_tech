import 'package:equatable/equatable.dart';

class FavoriteProduct extends Equatable {
  final int productId;
  final String title;
  final double price;
  final String image;
  final String category;
  final DateTime addedAt;

  const FavoriteProduct({
    required this.productId,
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    required this.addedAt,
  });

  factory FavoriteProduct.fromProduct(
    int productId,
    String title,
    double price,
    String image,
    String category,
  ) {
    return FavoriteProduct(
      productId: productId,
      title: title,
      price: price,
      image: image,
      category: category,
      addedAt: DateTime.now(),
    );
  }

  factory FavoriteProduct.fromMap(Map<String, dynamic> map) {
    return FavoriteProduct(
      productId: map['productId'] as int,
      title: map['title'] as String,
      price: map['price'] as double,
      image: map['image'] as String,
      category: map['category'] as String,
      addedAt: DateTime.parse(map['addedAt'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'category': category,
      'addedAt': addedAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
    productId,
    title,
    price,
    image,
    category,
    addedAt,
  ];
}
