import 'package:flutter/material.dart';

class Firstclass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Primera vista.widget'),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 30,
                height: 30,
                color: Colors.red,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: 30,
                height: 30,
                color: Colors.red,
              ),
            ),
            Center(
              child: SizedBox(
                //Crea un cuadro que será tan grande como lo permita su padre
                height: 259,
                width: double.infinity,
                child: Container(
                  child: ListView(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 50.0,
                        color: Colors.amber,
                        child: const Text('A'),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        color: Colors.amber,
                        child: const Text('B'),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        color: Colors.amber,
                        child: const Text('C'),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        color: Colors.amber,
                        child: const Text('D'),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        color: Colors.amber,
                        child: const Text('E'),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        color: Colors.amber,
                        child: const Text('F'),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        color: Colors.amber,
                        child: const Text('G'),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        color: Colors.amber,
                        child: const Text('H'),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        color: Colors.amber,
                        child: const Text('I'),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        color: Colors.amber,
                        child: const Text('J'),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        color: Colors.amber,
                        child: const Text('K'),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        color: Colors.amber,
                        child: const Text('L'),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        color: Colors.amber,
                        child: const Text('M'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 50,
              child: TextButton(
                child: Text('2 Page'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/two');
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 200,
              child: TextButton(
                child: Text('3 Page'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/three');
                },
              ),
            ),
          ],
        ));
  }
}
