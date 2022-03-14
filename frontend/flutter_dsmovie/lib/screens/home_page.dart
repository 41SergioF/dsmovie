import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dsmovie/components/movie_card.dart';
import 'package:flutter_dsmovie/model/movie.dart';
import 'package:flutter_dsmovie/model/util/pageable.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Movie _movie;
  late List<Movie> _movies;
  late Pageable _pageable;

  Widget _body = Center(
    child: Container(
      color: Colors.grey,
    ),
  );

  void getMovieById(int id) async {
    var request = http.Request('GET',
        Uri.parse('https://carlos-sergio-dsmovie.herokuapp.com/movies/5'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map map = jsonDecode(await response.stream.bytesToString());
      setState(() {
        _movie = Movie.fromMap(map);
        _body = MovieCard(_movie);
      });
    } else {}
  }

  void getMovies(Pageable pageable) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://carlos-sergio-dsmovie.herokuapp.com/movies?size=12&page=${pageable.pageNumber}'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map map = jsonDecode(await response.stream.bytesToString());

      setState(() {
        _movies = map['content'].map<Movie>((map) {
          return Movie.fromMap(map);
        }).toList();

        _body = Container(
          child: ListView.builder(
            itemCount: _movies.length,
            itemBuilder: (contex, index) {
              return MovieCard(_movies[index]);
            },
          ),
        );
        _pageable = pageable;
      });
    } else {}
  }

  @override
  void initState() {
    _pageable = Pageable(0, 3, true, false);
    getMovies(_pageable);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4d41c0),
        title: const Text('DSMovie'),
        actions: [
          Image.asset('assets/images/github.png'),
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Align(
                child: Text('/41SergioF'),
              ),
            ),
          ),
        ],
      ),
      body: _body,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _pageable.beforePage();
                  getMovies(_pageable);
                });
              },
              color: Color((_pageable.first) ? 0XFFc2c2c2 : 0xFF4D41C0),
              icon: const Icon(Icons.navigate_before, size: 40),
            ),
            Container(
              child: Text(
                '${_pageable.pageNumber + 1} de ${_pageable.totalPages}',
                style: const TextStyle(color: Color(0xFF4D41C0), fontSize: 15),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  Pageable clone = _pageable.clone();
                  clone.nextPage();
                  getMovies(clone);
                });
              },
              color: Color((_pageable.last) ? 0XFFc2c2c2 : 0xFF4D41C0),
              icon: const Icon(Icons.navigate_next, size: 40),
            ),
          ],
        ),
      ),
    );
  }
}
