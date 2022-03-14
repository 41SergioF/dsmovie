import 'package:flutter/material.dart';
import 'package:flutter_dsmovie/model/util/pageable.dart';

class Pagination extends StatefulWidget {
  final Pageable _pageable;
  const Pagination(this._pageable, {Key? key}) : super(key: key);

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            color: Color((widget._pageable.first) ? 0XFFc2c2c2 : 0xFF4D41C0),
            icon: const Icon(Icons.navigate_before, size: 40),
          ),
          Container(
            color: Colors.yellow,
            child: Text(
              '${widget._pageable.pageNumber} de ${widget._pageable.totalPages}',
              style: const TextStyle(color: Color(0xFF4D41C0), fontSize: 15),
            ),
          ),
          IconButton(
            onPressed: () {},
            color: Color((widget._pageable.last) ? 0XFFc2c2c2 : 0xFF4D41C0),
            icon: const Icon(Icons.navigate_next, size: 40),
          ),
        ],
      ),
    );
  }
}
