// ignore_for_file: unnecessary_const
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'package:flutter/material.dart';

enum aceptarT { aceptar }

class signUp extends StatefulWidget {
  signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  bool isChecked = false;
  bool isHidePassword = true;
  aceptarT? _character = aceptarT.aceptar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Colors.pinkAccent, size: 25.0),
              onPressed: () => Navigator.pop(context, true),
            );
          }),
          title: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('Registrate'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 100.0),
                child: Image.asset(
                  'assets/images/LogoWhite.png',
                  width: 90.0,
                  height: 80.0,
                ),
              )
            ],
          ),
          backgroundColor: Color.fromARGB(255, 79, 21, 129),
        ),
        body: SafeArea(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 20, 0),
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Crear una cuenta para empezar a usar la App',
                    style: TextStyle(
                      color: Color.fromARGB(255, 69, 69, 69),
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 0, 10),
                    child: Text(
                      'Nombre',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 69, 69, 69),
                      ),
                      labelText: "Nombre completo",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                    child: Text(
                      'Correo electrónico',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 69, 69, 69),
                      ),
                      labelText: "Correo electrónico",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                    child: Text(
                      'Contraseña',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: SizedBox(
                    height: 58,
                    child: TextField(
                      controller: _password,
                      obscureText: isHidePassword,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              isHidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            )),
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(255, 69, 69, 69),
                        ),
                        labelText: "Contraseña",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 35.0, top: 10.0, bottom: 5.0),
                  child: Text(
                    'La contraseña debe de tener caracteres, números y símbolos con un  mínimo  de 6 caracteres',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    leading: Radio<aceptarT>(
                      value: aceptarT.aceptar,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Color.fromARGB(255, 153, 149, 149)),
                      groupValue: _character,
                      onChanged: (aceptarT? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                    /*Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),*/
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Al registrarme, acepto los ",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          TextSpan(
                              text: "términos y condiciones",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.pinkAccent,
                              )),
                          TextSpan(
                            text: " y la",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          TextSpan(
                              text: " política de privacidad",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.pinkAccent,
                              )),
                        ],
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120.0, left: 20.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      minimumSize: const Size(350.0, 50.0),
                      primary: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 117, 167, 86),
                    ),
                    onPressed: () {
                      
                      var email = _email.text;
                      var name = _name.text;

                        bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
                        print('valor de que me dice la expresion');
                        print(emailValid);
                        bool nameValid = RegExp(r'^([a-z]+)$').hasMatch(name);
                        print('valor de que me dice la expresion name');
                        print(nameValid);
                      if (emailValid) {
                        fetchPost();
                    }else{
                        setState(() {
                        Navigator.of(context).pop();
                      });
                    }

                    },
                    child: const Text(
                      'Crear cuenta',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 40, 0, 5),
                  child: Row(
                    children: const [
                      Text(
                        '¿Ya tienes una cuenta?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 70, 70, 70),
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Iniciar sesion',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
        ));
  }

  void _togglePasswordView() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }

  void _showAlertDialog(res) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: const Text("Mensaje de Creacion de Cuenta"),
            content: Text(res),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  "CERRAR",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future<String> fetchPost() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String api = 'desarrollovan-tis.dedyn.io:4010';
    String path = 'Api/User/CreateUser';
    final response = await http.post(
      Uri.http(api, path),
      headers: headers,
      body: json.encode({
        "idUser": 0,
        "email": _email.text,
        "name": _name.text,
        "phoneNumber": "",
        "pass": _password.text,
        "idRole": 1,
        "idPlatform": 1,
        "idChannel": 1,
        "guest": "",
        "lasName": ""
      }),
    );

    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON
      //return Post.fromJson(json.decode(response.body));

      final map = json.decode(response.body);
      print(map["message"]);
      _showAlertDialog(map["message"]);

      String mensaje = "Si esta bien we";
      return mensaje;
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      throw Exception('Failed to load post');
    }
  }
}
