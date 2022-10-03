import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class nwPassword extends StatefulWidget {
  nwPassword({Key? key}) : super(key: key);

  @override
  State<nwPassword> createState() => _nwPasswordState();
}

class _nwPasswordState extends State<nwPassword> {
  final _password = TextEditingController();
  final _confirm = TextEditingController();
  @override
  void dispose() {
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recuperar contraseña"),
        backgroundColor: const Color.fromRGBO(79, 21, 129, 1),
        leading: IconButton(
          onPressed: () => {Navigator.pop(context, true)},
          color: Colors.pink,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
                  child: const Text(
                    'Por seguridad, tu contraseña dede tener una longitud de entre 8 a 15 caracteres, usar mayúsculas, minúsculas, contener por lo menos un número y un carácter especial.',
                    style: TextStyle(
                      color: Color.fromARGB(238, 119, 116, 116),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(left: 32),
                        child: const Text('Nueva contraseña',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        height: 50,
                        width: 350,
                        padding: const EdgeInsets.only(top: 3),
                        child: labelDatos(indexAll: 'Nueva contraseña'),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(left: 32),
                        margin: const EdgeInsets.only(top: 35),
                        child: const Text('Confirmar nueva contraseña',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        height: 80,
                        width: 350,
                        padding: const EdgeInsets.only(top: 3),
                        margin: const EdgeInsets.all(0),
                        child:
                            labelDatos2(indexAll: 'Confirmar nueva contraseña'),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(117, 167, 87, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            minimumSize: const Size(350.0, 60.0),
                            // primary: Colors.white,
                          ),
                          onPressed: () {
                            if (!_password.text.isEmpty &&
                                _password.text == _confirm.text) {
                              fetchPost();
                            } else {
                              print("las entradas no coinciden o estan vacias");
                            }
                          },
                          child: const Text(
                            'Actualizar contraseña',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  labelDatos({required String indexAll}) {
    return TextField(
      controller: _password,
      keyboardType: TextInputType.visiblePassword,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          hintStyle: const TextStyle(color: Colors.grey),
          hintText: indexAll),
    );
  }

  labelDatos2({required String indexAll}) {
    return TextField(
      controller: _confirm,
      keyboardType: TextInputType.visiblePassword,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          hintStyle: const TextStyle(color: Colors.grey),
          hintText: indexAll),
    );
  }

  void _showAlertDialog(res) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: const Text("Status de la operacion:"),
            content: Text(res),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  "CERRAR",
                  style: TextStyle(color: Color.fromARGB(255, 3, 116, 177)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  OutlinedButton button() {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color.fromARGB(198, 97, 174, 58),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        side: const BorderSide(
            color: Colors.transparent, width: 2, style: BorderStyle.solid),
      ),
      child: const Text(
        'Actualizar contraseña',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  Future<String> fetchPost() async {
    final storage = new FlutterSecureStorage();
    var value = await storage.read(key: 'jwt');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $value'
    };
    String api = 'desarrollovan-tis.dedyn.io:4010';
    String path = 'Api/User/UpdatePasswordRecovery';
    final response = await http.post(
      Uri.http(api, path),
      headers: headers,
      body: json.encode({"idChannel": 1, "password": _password.text}),
    );

    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON
      //return Post.fromJson(json.decode(response.body));

      final map = json.decode(response.body);
      print(map["message"]);
      _showAlertDialog(map["message"]);

      String mensaje = "ok";
      return mensaje;
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      throw Exception('Failed to load post');
    }
  }
}
