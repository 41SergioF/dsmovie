import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4d41c0),
        title: const Text('DSMovie'),
        actions: [
          Image.asset('images/github.png'),
          GestureDetector(
            onTap: (){
              print('onTap');
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
      body: Container(),
    );
  }
}
/**Row(
            children: [
              Image.asset('images/github.png'),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text('/41SergioF'),
              ),
            ],
          ) */