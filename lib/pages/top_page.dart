import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:imdb_app/models/responses/top_movies_response.dart';
import 'package:imdb_app/models/top_movie.dart';
import 'package:http/http.dart' as http;
import 'package:imdb_app/pages/details_page.dart';

class TopFilmesPage extends StatefulWidget {
  const TopFilmesPage({super.key});

  @override
  State<TopFilmesPage> createState() => _TopFilmesPageState();
}

class _TopFilmesPageState extends State<TopFilmesPage> {
  void getTopFilms() async {
    setState(() {
      _isLoading = true;
    });

    var url = Uri.https('imdb-api.com', 'ru/API/Top250Movies/k_y48459w1');
    var response = await http.get(url);
    var decodedRepsonse =
        TopMoviesResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
    setState(() {
      _movies = decodedRepsonse.items;
    });

    setState(() {
      _isLoading = false;
    });
  }

  bool _isLoading = false;
  List<TopMovie> _movies = [];

  @override
  void initState() {
    super.initState();
    getTopFilms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top 250 Films')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => DetailsPage(movie: _movies[index]))),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(_movies[index].image), fit: BoxFit.contain),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Column(
                    children: [
                      Text(_movies[index].rank, style: const TextStyle(color: Colors.black, fontSize: 32)),
                      const SizedBox(height: 5),
                      Text(_movies[index].title, style: const TextStyle(color: Colors.black, fontSize: 32))
                    ],
                  )),
                ),
              ),
              itemCount: _movies.length,
            ),
    );
  }
}
