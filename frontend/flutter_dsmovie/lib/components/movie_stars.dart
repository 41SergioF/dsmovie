import 'package:flutter/material.dart';

class MovieStars extends StatefulWidget {

  double score;

  MovieStars(this.score, { Key? key }) : super(key: key);

  @override
  State<MovieStars> createState() => _MovieStarsState();
}

class _MovieStarsState extends State<MovieStars> {

  List<double> fills = [0, 0, 0, 0, 0];

  getFills(double score){
    int integerPart = score.toInt();
    
    for (int i = 0; i < integerPart; i++){
      fills[i] = 1;
    }

    if(score - integerPart > 0){
      fills[integerPart] = 0.5;
    }
  }

 String star(double fill){
    if(fill == 0){
      return 'assets/images/star_empty.png';
    }else if(fill == 0.5){
      return 'assets/images/star_half.png';
    }
    return 'assets/images/star_full.png'; 
  }


  @override
  void initState() {
    getFills(widget.score);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(star(fills[0])),
        Image.asset(star(fills[1])),
        Image.asset(star(fills[2])),
        Image.asset(star(fills[3])),
        Image.asset(star(fills[4])),
      ],
    );
  }
}