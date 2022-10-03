import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myapp/pages/recover_password.dart';
import 'package:passwordfield/passwordfield.dart';

class PantallaLogin extends StatefulWidget {
  const PantallaLogin({Key? key}) : super(key: key);

  @override
  _PantallaLoginState createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iniciar sesión"),
        backgroundColor: const Color.fromRGBO(79, 21, 129, 1),
        leading: IconButton(
          onPressed: () => {Navigator.pop(context, true)},
          color: Colors.pink,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 50, 35, 0),
                            child: const Text(
                              "Inicia sesión con tu cuenta para continuar",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(117, 117, 117, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 230.0),
                                  child: const Text(
                                    "Correo electrónico",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 10),
                                  child: TextField(
                                      controller: _email,
                                      decoration: InputDecoration(
                                          labelStyle: const TextStyle(
                                              color: Color.fromRGBO(
                                                  189, 189, 189, 1)),
                                          labelText: "Email Address",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ))),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 270.0),
                                  child: const Text(
                                    "Contraseña",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: PasswordField(
                                    controller: _password,
                                    color: Colors.blue,
                                    passwordConstraint: r'.*[@$#.*].*',
                                    hintText: "Password",
                                    border: PasswordBorder(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue.shade100),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.blue.shade100),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Colors.red.shade200)),
                                    ),
                                    errorMessage:
                                        'Tiene que contener Simbolos . * @ # / ',
                                    hasFloatingPlaceholder: true,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 120.0),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    recoverPssw()));
                                      },
                                      child: const Text(
                                        "¿Has olvidado tu contraseña?",
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(252, 21, 96, 1)),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(117, 167, 87, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    minimumSize: const Size(350.0, 60.0),
                                    // primary: Colors.white,
                                  ),
                                  onPressed: () {
                                    fetchPost();
                                    // _procesologin();
                                  },
                                  child: const Text(
                                    'Ingresar',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 25),
                                child: const Text.rich(TextSpan(
                                  text: "¿Todavía no tienes una cuenta?",
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: " Regístrate",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(252, 21, 96, 1),
                                            fontWeight: FontWeight.bold))
                                  ],
                                )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _procesologin() async {
    print("${_email.text} y ${_password.text}");
    print("Tratando de Iniciar sesion");
  }

  void _showAlertDialog(res) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: const Text("Mensaje de Inicio de Sesion"),
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

  Future<String> fetchPost() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String api = 'desarrollovan-tis.dedyn.io:4010';
    String path = 'Api/User/LogIn';
    final response = await http.post(
      Uri.http(api, path),
      headers: headers,
      body: json.encode({
        "idChannel": 1,
        "email": _email.text,
        "password": _password.text,
        "idPlatform": 1,
        "idRole": 1,
        "idDevice": ""
      }),
    );

    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON
      //return Post.fromJson(json.decode(response.body));
      final map = json.decode(response.body);
      // Create storage
      final storage = new FlutterSecureStorage();
      await storage.write(key: 'jqwt', value: map["token"]);
      await storage.write(key: 'idUser', value: map["idUser"]);
      print(map["message"]);
      print(response.body);
      _showAlertDialog(map["message"]);

      String mensaje = "ok";
      return mensaje;
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      throw Exception('Failed to load post');
    }
  }
}
