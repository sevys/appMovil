import 'package:flutter/material.dart';

class second_page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('segunda pagina'),
      ),

      body: Stack( children: <Widget> [
        Container(
          alignment: Alignment.topCenter,

        child: Container(
          alignment: Alignment.center,
          child: Text('A'),
          color: Colors.amber,
          width: 30,
          height: 30,
        ),
      ),
      Container(
        alignment: Alignment.centerRight,

        child: Container(
          alignment: Alignment.center,
          child: Text('B'),
          color: Colors.amber,
          width: 30,
          height: 30,
        ),
      ),
      Container(
        alignment: Alignment.bottomCenter,

        child: Container(
          alignment: Alignment.center,
          child: Text('C'),
          color: Colors.amber,
          width: 30,
          height: 30,
        ),
      ),
      Container(
          alignment: Alignment.centerLeft,
        child: Container(
          alignment: Alignment.center,
          child: Text('D'),
          color: Colors.amber,
          width: 30,
          height: 30,
        ),
      ),

        ]),

    );
  }
}