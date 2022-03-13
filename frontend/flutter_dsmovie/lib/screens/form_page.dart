import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerScore = TextEditingController();

  //test
  Map<String, dynamic> movie = {
    'id': 1,
    'title': "The Witcher",
    'score': 4.5,
    'count': 2,
    'image':
        'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/jBJWaqoSCiARWtfV0GlqHrcdidd.jpg',
  };

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.network(movie['image']),
              Container(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  movie['title'],
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(
                      0XFF4A4A4A,
                    ),
                  ),
                ),
              ),
              const TextField(
                //controller: _controllerEmail,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'email',
                  hintText: 'Informe seu email...'
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const TextField(
                //controller: _controllerScore,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Avaliação',
                  hintText: 'Informe sua avaliação...',
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF4d41c0),
                  minimumSize: const Size(300, 50),
                ),
                child: const Text('Salvar'),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF4d41c0),
                  minimumSize: const Size(300, 50),
                ),
                child: const Text('Cancelar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
