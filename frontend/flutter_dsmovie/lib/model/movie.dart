class Movie {
  int id = 0;
  String title = '';
  double score = 0;
  int count = 0;
  String image = '';

  Movie(this.id, this.image, this.score, this.count, this.title);

  Movie.noArg();

  Movie.fromMap(Map map) {
    id = map['id'];
    title = map['title'];
    score = map['score'];
    count = map['count'];
    image = map['image'];
  }
  @override
  String toString() {
    return super.toString() +
        '${id}\n ${title}\n ${score.toString()}\n ${count.toString()}\n ${image}\n';
  }
}
