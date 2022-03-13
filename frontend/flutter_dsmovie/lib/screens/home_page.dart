import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dsmovie/components/movie_card.dart';
import 'package:flutter_dsmovie/model/movie.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Movie _movie;
  Container _body = Container(color:Colors.grey,);

  void getMovieById(int id) async {
    var request = http.Request('GET',
        Uri.parse('https://carlos-sergio-dsmovie.herokuapp.com/movies/5'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map map = jsonDecode(await response.stream.bytesToString());
      setState(() {
        _movie = Movie.fromMap(map);
        _body = Container(child: MovieCard(_movie),);
      });
    } else {}
  }

  @override
  void initState() {
    getMovieById(5);
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
      body: Center(
        child: _body,
      ),
    );
  }
}
