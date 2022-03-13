import 'package:flutter/material.dart';
import 'package:flutter_dsmovie/components/movie_card.dart';
import 'package:flutter_dsmovie/model/movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Movie _movie;

  @override
  void initState() {
    Map<String, dynamic> _map = {
      'id': 1,
      'title': "The Witcher",
      'score': 4.5,
      'count': 2,
      'image':
          'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/jBJWaqoSCiARWtfV0GlqHrcdidd.jpg',
    };
    super.initState();
    _movie = Movie.fromMap(_map);
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
            onTap: () {
            },
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
        child: MovieCard(_movie),
      ),
    );
  }
}
