// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopMovie _$TopMovieFromJson(Map<String, dynamic> json) => TopMovie(
      id: json['id'] as String,
      rank: json['rank'] as String,
      title: json['title'] as String,
      fullTitle: json['fullTitle'] as String,
      crew: json['crew'] as String,
      imDbRating: json['imDbRating'] as String,
      imDbRatingCount: json['imDbRatingCount'] as String,
      image: json['image'] as String,
      year: json['year'] as String,
    );

Map<String, dynamic> _$TopMovieToJson(TopMovie instance) => <String, dynamic>{
      'id': instance.id,
      'rank': instance.rank,
      'title': instance.title,
      'fullTitle': instance.fullTitle,
      'year': instance.year,
      'image': instance.image,
      'crew': instance.crew,
      'imDbRating': instance.imDbRating,
      'imDbRatingCount': instance.imDbRatingCount,
    };
