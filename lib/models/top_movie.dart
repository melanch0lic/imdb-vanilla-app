import 'package:json_annotation/json_annotation.dart';

part 'top_movie.g.dart';

@JsonSerializable()
class TopMovie {
  final String id;
  final String rank;
  final String title;
  final String fullTitle;
  final String year;
  final String image;
  final String crew;
  final String imDbRating;
  final String imDbRatingCount;

  TopMovie(
      {required this.id,
      required this.rank,
      required this.title,
      required this.fullTitle,
      required this.crew,
      required this.imDbRating,
      required this.imDbRatingCount,
      required this.image,
      required this.year});

  factory TopMovie.fromJson(Map<String, dynamic> json) => _$TopMovieFromJson(json);
}
