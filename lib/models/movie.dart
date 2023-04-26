import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final String id;
  final String image;
  final String title;
  final String description;

  Movie({required this.id, required this.image, required this.title, required this.description});

    factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
