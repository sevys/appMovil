import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/google_sing_in_firebase/auth_with_google.dart';
import 'package:myapp/pages/paginaLogin.dart';
import 'package:myapp/pages/signUp.dart';
import 'package:myapp/google_sing_in_firebase/model/firebase_user.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';



class HomeEntry extends StatefulWidget {
  const HomeEntry({Key? key}) : super(key: key);
  
  @override
  _State createState() => _State();
}

class _State extends State<HomeEntry> {
  final FirebaseUser _user = FirebaseUser();
  final AuthServiceGoogle _auth = AuthServiceGoogle();
  String userEmail = '';

  @override
  void initState(){
    super.initState();
    _user.user(_auth.user);
  }

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _user.uid != null ? _logged(): _homeLogin(),
      ),
    );
  }

  //aqui si va ser una clase y sera la del menu principal
  ElevatedButton _logged(){
    return ElevatedButton.icon(
      icon:const  Icon(Icons.login),
      label: const Text('Ya estas registrado'),
      //este es para cerrar facebook
      // onPressed: () async{
      //   await FirebaseAuth.instance.signOut();
      //   await FacebookAuth.instance.logOut();
      //   setState(() {
      //     Navigator.of(context).pop();
      //   });
      // },
      onPressed: ()async{
        await _auth.singOutGoogle();
        setState(() {
          Navigator.of(context).pop();
        });
      },
    );
  }

  SafeArea _homeLogin(){
    return SafeArea(
      child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Image.asset(
                  'assets/images/LogoInicio.png',
                  width: 340.0,
                  height: 360.0,
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 40, 10, 20),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            minimumSize: const Size(350.0, 50.0),
                            primary: Colors.white,
                            backgroundColor: Color.fromARGB(255, 70, 101, 255),
                          ),
                          onPressed: () async{
                            print('Esto es continuar con Google');
                              await _auth.signInGoogle();
                              setState(() {
                                _user.user(_auth.user);
                              });
                            },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 35, 0),
                                child: Image.asset(
                                  'assets/images/logotipo-de-google-glass.png',
                                  width: 20.0,
                                  height: 20.0,
                                ),
                              ),
                              const Text(
                                'Continuar con Google',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            minimumSize: const Size(350.0, 50.0),
                            primary: Colors.white,
                            backgroundColor: Color.fromARGB(255, 40, 63, 174),
                          ),
                          onPressed: () {
                            print('Continuar con Facebook');
                            signInWithFacebook();
                            setState(() {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=> _logged())
                                );  
                            });
                            },

                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 35, 0),
                                child: Image.asset(
                                  'assets/images/facebook.png',
                                  width: 25.0,
                                  height: 25.0,
                                ),
                              ),
                              const Text(
                                'Continuar con Facebook',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: const BorderSide(
                                  color: Color.fromARGB(255, 105, 105, 105),
                                  width: 2.0,
                                )),
                            minimumSize: const Size(350.0, 50.0),
                            primary: Color.fromARGB(255, 105, 105, 105),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signUp()));
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                                child: Image.asset(
                                  'assets/images/email-removebg-preview (1).png',
                                  width: 30.0,
                                  height: 30.0,
                                ),
                              ),
                              const Text(
                                'Registrarse con e-mail',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                        child: Text(
                          'Entrar como invitado',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          'Entrar como vendedor',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 0, 10),
                        child: Row(
                          children: [
                            const Text(
                              '¿Ya tienes una cuenta?',
                              style: TextStyle(
                                color: Color.fromARGB(255, 70, 70, 70),
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    minimumSize: const Size(5, 5),
                                    primary: Color.fromARGB(255, 105, 105, 105)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PantallaLogin()));
                                },
                                child: const Text(
                                  'Iniciar sesión',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
  Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login(
    permissions: ['email', 'public_profile', 'user_birthday']
  );

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

  
  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
}