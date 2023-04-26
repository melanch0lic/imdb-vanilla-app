import 'package:imdb_app/models/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse {
  final String expression;

  final List<Movie> results;

  MoviesResponse({required this.expression, required this.results});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => _$MoviesResponseFromJson(json);
}
