import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/home_Entry.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override //es un decorator
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vista1',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomeEntry(),
    );
  }
}

//colocar las libreias que necesito para la autenticacion