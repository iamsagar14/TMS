import 'dart:convert';

class PlaceCategory {
  final int id;

  final String? title;

  PlaceCategory({
    required this.id,
    this.title,
  });
  factory PlaceCategory.fromJson(String str) =>
      PlaceCategory.fromMap(json.decode(str));
  factory PlaceCategory.fromMap(Map<String, dynamic> json) => PlaceCategory(
        id: json["id"],
        title: json['title'],
      );
}
