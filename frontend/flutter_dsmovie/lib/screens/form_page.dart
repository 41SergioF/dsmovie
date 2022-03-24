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
  String _dropdownValue = '1';

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
              DropdownButton<String>(
                value: _dropdownValue,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                
                  color: Colors.deepPurple,
                ),
                items: <String>['1', '2', '3', '4', '5']
                    .map(
                      (String value) => DropdownMenuItem<String>(
                          child: Text(value), value: value),
                    )
                    .toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _dropdownValue = newValue!;
                  });
                },
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {
                  if (_controllerEmail.text.isEmpty ||
                      _dropdownValue == 'Nota') {
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

class $ {}
