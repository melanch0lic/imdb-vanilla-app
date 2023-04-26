// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopMoviesResponse _$TopMoviesResponseFromJson(Map<String, dynamic> json) =>
    TopMoviesResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => TopMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopMoviesResponseToJson(TopMoviesResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
