import 'dart:convert';

class CategoryPlace {
  final int id;
  final double rating;
  final String image;
  final String title;
  final String description;
   bool isfavorite;

  CategoryPlace({
    required this.id,
    required this.rating,
    required this.image,
    required this.title,
    required this.description,
    required this.isfavorite,
  });
  factory CategoryPlace.fromJson(String str) =>
      CategoryPlace.fromMap(json.decode(str));
  factory CategoryPlace.fromMap(Map<String, dynamic> json) => CategoryPlace(
        id: json["id"],
        rating: json["rating"],
        image: json['image'],
        title: json['title'],
        description: json['description'],
        isfavorite: json['isfavorite'],
      );

  CategoryPlace copyWith({
    int? id,
    double? rating,
    String? image,
    String? title,
    String? description,
    bool? isfavorite, required bool isFavorite,
  }) {
    return CategoryPlace(
      id: id ?? this.id,
      rating: rating ?? this.rating,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      isfavorite: isfavorite ?? this.isfavorite,
    );
  }
}
