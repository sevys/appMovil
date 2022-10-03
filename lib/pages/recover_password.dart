import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:myapp/pages/newPassword.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class recoverPssw extends StatefulWidget {
  recoverPssw({Key? key}) : super(key: key);

  @override
  State<recoverPssw> createState() => _recoverPsswState();
}

class _recoverPsswState extends State<recoverPssw> {
  final _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
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
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 35),
                        child: const Text(
                            'Ingresa tu email para restablecer tu contraseña',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 123, 122, 122),
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  )),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(left: 32),
                        child: const Text('Correo electrònico',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        height: 50,
                        width: 350,
                        child: labelDatos(),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, left: 15, right: 0),
                        padding: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                        ),
                        child: const Text(
                          'Ingrese su correo electrónico registrado y le enviaremos un correo electrónico que contiene un enlace para restablecer su contraseña.',
                          style: TextStyle(
                            color: Color.fromARGB(239, 189, 189, 189),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
                            if (!_email.text.isEmpty) {
                              fetchPost();
                            }

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => nwPassword()));
                          },
                          child: const Text(
                            'Enviar solicitud',
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

  labelDatos() {
    // return Container(
    //   alignment: Alignment.centerLeft,
    //   height: 20,
    //   width: 60,
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(10),
    //     border: Border.all(
    //       color: Colors.grey
    //     )
    //   ),
    //   child: const Text(
    //     ' Dirección de correo',
    //     style:  TextStyle(
    //       fontSize: 15,
    //       color: Colors.grey
    //     ),
    //   ),
    // );
    return TextField(
      controller: _email,
      keyboardType: TextInputType.emailAddress,
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
          hintText: 'Dirección de correo'),
    );
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
        'Enviar solicitud',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  void _showAlertDialog(code, res) {
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
                  if (code) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => nwPassword()));
                  }
                },
              )
            ],
          );
        });
  }

  Future<String> fetchPost() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String api = 'desarrollovan-tis.dedyn.io:4010';
    String path = 'Api/User/RecoverPassword';
    final response = await http.post(
      Uri.http(api, path),
      headers: headers,
      body: json.encode({"idChannel": 1, "email": _email.text}),
    );

    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON
      //return Post.fromJson(json.decode(response.body));

      final map = json.decode(response.body);
      print(map["message"]);
      final storage = new FlutterSecureStorage();
      var value = await storage.read(key: 'jwt');
      print(value);
      _showAlertDialog(map["code"], map["message"]);

      String mensaje = "ok";
      return mensaje;
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      throw Exception('Failed to load post');
    }
  }
}
