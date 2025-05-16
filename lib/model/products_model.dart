class ProductsModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  const ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  ProductsModel copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) =>
      ProductsModel(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
        rating: rating ?? this.rating,
      );

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
      };

  @override
  int get hashCode =>
      id.hashCode *
      title.hashCode *
      price.hashCode *
      description.hashCode *
      category.hashCode *
      image.hashCode *
      rating.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! ProductsModel) return false;
    return id == other.id &&
        title == other.title &&
        description == other.description &&
        price == other.price &&
        image == other.image &&
        category == other.category &&
        rating == other.rating;
  }
}

class Rating {
  final double? rate;
  final int? count;

  const Rating({
    this.rate,
    this.count,
  });

  Rating copyWith({
    double? rate,
    int? count,
  }) =>
      Rating(
        rate: rate ?? this.rate,
        count: count ?? this.count,
      );

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };

  @override
  int get hashCode => rate.hashCode * count.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! Rating) return false;
    return rate == other.rate && count == other.count;
  }
}
