import 'package:flutter/material.dart';

class newPage extends StatefulWidget {
  newPage({Key? key}) : super(key: key);

  @override
  State<newPage> createState() => _newPageState();
}

class _newPageState extends State<newPage> {
  int pages = 0;
  late Color color1 = Colors.amber;
  late Color color2 = Colors.red;
  late Color color3 = Colors.blue;
  late Text text1 = Text('Soy el 1');
  late Text text2 = Text('Soy el 2');
  late Text text3 = Text('Soy el 3');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    color: color1,
                    child: text1,
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    color: color2,
                    child: text2,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    color: color3,
                    child: text3,
                  )),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Column(
                    children: <Widget>[buttonOnBoarding(40, 100, "Precionar")],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  buttonOnBoarding(double height, double width, String text) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
          side: BorderSide(
            color: pages == 4 ? Colors.transparent : Colors.amber,
            width: 1.5,
          ),
        ),
        minimumSize: Size(width, height),
        backgroundColor: pages == 4 ? Colors.black : Colors.blue,
        padding: const EdgeInsets.all(0));

    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: TextButton(
        style: flatButtonStyle,
        onPressed: () {
          setState(() {
            pages += 1;
            if (pages == 1) {
              color1 = Colors.blue;
              color2 = Colors.amber;
              color3 = Colors.red;
              text1 = Text('Soy el 2');
              text2 = Text('Soy el 3');
              text3 = Text('Soy el 1');
            }
            if (pages == 2) {
              color1 = Colors.red;
              color2 = Colors.blue;
              color3 = Colors.amber;
              text1 = Text('Soy el 3');
              text2 = Text('Soy el 1');
              text3 = Text('Soy el 2');
            }
            if (pages > 2) {
              color1 = Colors.amber;
              color2 = Colors.red;
              color3 = Colors.blue;
              text1 = Text('Soy el 1');
              text2 = Text('Soy el 2');
              text3 = Text('Soy el 3');
              pages = 0;
            }
          });
        },
        child: Text(
          pages == 4 ? "Continuar" : "Siguiente",
          style: TextStyle(color: pages == 2 ? Colors.amber : Colors.white),
        ),
      ),
    );
  }
}
