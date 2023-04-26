import 'package:imdb_app/models/top_movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_movies_response.g.dart';

@JsonSerializable()
class TopMoviesResponse {
  final List<TopMovie> items;

  TopMoviesResponse({required this.items});

  factory TopMoviesResponse.fromJson(Map<String, dynamic> json) => _$TopMoviesResponseFromJson(json);
}
