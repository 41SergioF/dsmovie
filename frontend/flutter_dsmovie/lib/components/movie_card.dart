import 'package:flutter/material.dart';
import 'package:flutter_dsmovie/model/movie.dart';
import 'package:flutter_dsmovie/screens/form_page.dart';

class MovieCard extends StatefulWidget {

  final Movie _movie;

  const MovieCard(this._movie, {Key? key}) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {

  @override
  Widget build(BuildContext context) {
    MediaQueryData _deviceInfo = MediaQuery.of(context);

    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(widget._movie.image),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 50),
            child: Text(
              widget._movie.title,
              style: const TextStyle(
                fontSize: 25,
                color: Color(0XFF4A4A4A),
              ),
            ),
          ),
          Text(
            widget._movie.score.toString(),
            style: const TextStyle(
              fontSize: 25,
              color: Color(0xFFFFBB3A),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/star_full.png'),
                Image.asset('assets/images/star_full.png'),
                Image.asset('assets/images/star_half.png'),
                Image.asset('assets/images/star_empty.png'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              '${widget._movie.count} avaliações',
              style: const TextStyle(fontSize: 18, color: Color(0xFF989898)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormPage(widget._movie)),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF4d41c0),
              minimumSize: Size(
                _deviceInfo.size.width * 0.60,
                _deviceInfo.size.height * 0.06,
              ),
            ),
            child: const Text(
              'Avaliar',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
