import 'package:flutter/material.dart';

import 'package:imdb_app/models/top_movie.dart';

class DetailsPage extends StatelessWidget {
  final TopMovie movie;
  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Full Information')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    movie.image,
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(height: 10),
            Text(
              movie.fullTitle,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 10),
            Text('Production: ${movie.crew}'),
            const SizedBox(height: 10),
            Text('Rating: ${movie.imDbRating} RatingCount:  ${movie.imDbRatingCount}'),
            const SizedBox(height: 10),
            Text('Year Created: ${movie.year}')
          ]),
        ),
      ),
    );
  }
}
