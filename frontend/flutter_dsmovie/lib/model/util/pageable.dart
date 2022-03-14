class Pageable {
  int pageNumber;
  int totalPages;
  bool first;
  bool last;

  Pageable(this.pageNumber, this.totalPages, this.first, this.last);
/*
  Pageable.fromMap(Map map) {
    pageNumber = map['pageable']['pageNumber'];
    last = map['last'];
    totalPages = map['totalPages'];
    first = map['first'];
  }
*/
  Pageable clone(){
    return this;
  }

  void nextPage() {
    if (pageNumber < totalPages-1) {
      pageNumber += 1;
      first = false;
      last = (pageNumber == totalPages - 1) ? true : false;
    }
  }

  void beforePage() {
    if (pageNumber != 0) {
      pageNumber -= 1;
      first = (pageNumber + 1 == 1) ? true : false;
      last = false;
    }
  }
}
