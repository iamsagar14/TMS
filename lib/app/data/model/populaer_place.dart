import 'dart:convert';

class PopularPlace {
  final int id;
  final double rating;
  final String image;
  final String title;
  final String description;
   bool isfavorite;

  PopularPlace({
    required this.id,
    required this.rating,
    required this.image,
    required this.title,
    required this.description,
    required this.isfavorite,
  });
  factory PopularPlace.fromJson(String str) =>
      PopularPlace.fromMap(json.decode(str));
  factory PopularPlace.fromMap(Map<String, dynamic> json) => PopularPlace(
        id: json["id"],
        rating: json["rating"],
        image: json['image'],
        title: json['title'],
        description: json['description'],
        isfavorite: json['isfavorite'],
      );

  PopularPlace copyWith({
    int? id,
    double? rating,
    String? image,
    String? title,
    String? description,
    bool? isfavorite, required bool isFavorite,
  }) {
    return PopularPlace(
      id: id ?? this.id,
      rating: rating ?? this.rating,
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      isfavorite: isfavorite ?? this.isfavorite,
    );
  }
}
