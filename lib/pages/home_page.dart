import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imdb_app/models/responses/movies_response.dart';
import 'package:imdb_app/pages/top_page.dart';

import '../models/movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void search(String filmName) async {
    if (filmName == '') {
      setState(() {
        _movies.clear();
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    var url = Uri.https('imdb-api.com', 'ru/API/Search/k_y48459w1/$filmName');
    var response = await http.get(url);
    var decodedRepsonse = MoviesResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
    setState(() {
      _movies = decodedRepsonse.results;
    });

    setState(() {
      _isLoading = false;
    });
  }

  bool _isLoading = false;
  List<Movie> _movies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImdbApp'),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TopFilmesPage())),
              icon: const Icon(Icons.star))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => search(value),
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Search'),
            ),
            const SizedBox(height: 10),
            _isLoading
                ? const Padding(
                    padding: EdgeInsets.only(top: 300),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : _movies.isEmpty
                    ? const Expanded(child: Center(child: Text('Введите название фильма')))
                    : Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => Container(
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.only(bottom: 5),
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage(_movies[index].image), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(15)),
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      _movies[index].title,
                                      style: const TextStyle(color: Colors.white, fontSize: 24),
                                    ),
                                    Text(
                                      _movies[index].description,
                                      style: const TextStyle(color: Colors.white, fontSize: 16),
                                    )
                                  ]),
                            ),
                          ),
                          itemCount: _movies.length,
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
