import 'package:flutter/material.dart';
import 'package:flutter_dsmovie/model/movie.dart';

class FormPage extends StatefulWidget {
  final Movie _movie;
  const FormPage(this._movie, {Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerScore = TextEditingController();

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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.network(widget._movie.image),
              Container(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  widget._movie.title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(
                      0XFF4A4A4A,
                    ),
                  ),
                ),
              ),
              TextField(
                controller: _controllerEmail,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: 'email', hintText: 'Informe seu email...'),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: _controllerScore,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Avaliação',
                  hintText: 'Informe sua avaliação...',
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {
                  if (_controllerEmail.text.isEmpty ||
                      _controllerScore.text.isEmpty) {
                  } else {
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF4d41c0),
                  minimumSize: const Size(300, 50),
                ),
                child: const Text('Salvar'),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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
