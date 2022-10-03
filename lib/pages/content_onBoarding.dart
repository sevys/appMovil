import 'package:flutter/material.dart';

class ContentBoarding extends StatelessWidget {
  const ContentBoarding({
    Key? key,
    required this.encabezado,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String encabezado, text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              image,
              width: 230,
              height: 230,
            ),
            Text(
              encabezado,
              style: const TextStyle(
                color: Color.fromRGBO(78, 23, 129, 1),
                fontSize: 25,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromRGBO(113, 113, 113, 1),
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
