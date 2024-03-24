import 'dart:convert';

class PopularPlace {
  final int id;
  final String? image;

  final String? title;
  final String? description;
  final String? category;

  PopularPlace({
    required this.id,
    this.image,
    this.title,
    this.description,
    this.category,
  });
  factory PopularPlace.fromJson(String str) =>
      PopularPlace.fromMap(json.decode(str));
  factory PopularPlace.fromMap(Map<String, dynamic> json) => PopularPlace(
        id: json["id"],
        image: json['image'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
      );
}
