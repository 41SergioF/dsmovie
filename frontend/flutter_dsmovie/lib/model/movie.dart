class Movie {
  int? id;
  String? title;
  double? score;
  int? count;
  String? image;

  Movie(this.id, this.image, this.score, this.count, this.title);

  Movie.fromMap(Map map) {
    id = map['id'];
    title = map['title'];
    score = map['score'];
    count = map['count'];
    image = map['image'];
  }
}
