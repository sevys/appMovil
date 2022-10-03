import 'package:flutter/material.dart';
import 'package:myapp/pages/content_onBoarding.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int pages = 0;

  List<Map<String, String>> onBoardingDatas = [
    {
      "encabezado": "ESPARCIMIENTO",
      "text": "Brindamos todos los sevicios para consentir a tu mascota",
      "image": "assets/images/B1.png",
    },
    {
      "encabezado": "ADOPCION",
      "text":
          "Nulla faucibus tellus ut odio scelerisque, vitae molestie lectus feugiat.",
      "image": "assets/images/B2.png",
    },
    {
      "encabezado": "HOSPITALIDAD",
      "text":
          "Nulla faucibus tellus ut odio scelerisque, vitae molestie lectus feugiat.",
      "image": "assets/images/B3.png",
    },
    {
      "encabezado": "VETERINARIA",
      "text":
          "Nulla faucibus tellus ut odio scelerisque, vitae molestie lectus feugiat.",
      "image": "assets/images/B4.png",
    },
    {
      "encabezado": "TIENDA",
      "text": "Compara todas las necesidades de tu mascota sin salir de casa",
      "image": "assets/images/B5.png",
    },
  ];

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
                flex: 4,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      pages = value;
                      print(pages);
                    });
                  },
                  itemCount: onBoardingDatas.length,
                  itemBuilder: (context, index) => ContentBoarding(
                    encabezado: onBoardingDatas[index]["encabezado"]!,
                    text: onBoardingDatas[index]["text"]!,
                    image: onBoardingDatas[index]["image"]!,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 35),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < onBoardingDatas.length; i++)
                            if (i == pages) ...[navigation(true)] else
                              navigation(false),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Column(
                    children: <Widget>[_buttonOnBoarding(50, 300, "")],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  _buttonOnBoarding(double height, double width, String text) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(
            color: pages == 4
                ? Colors.transparent
                : const Color.fromRGBO(116, 116, 116, 1),
            width: 1.5,
          ),
        ),
        minimumSize: Size(width, height),
        backgroundColor: pages == 4
            ? const Color.fromRGBO(117, 167, 86, 1)
            : Colors.transparent,
        padding: const EdgeInsets.all(0));

    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: TextButton(
        style: flatButtonStyle,
        onPressed: () {
          setState(() {
            pages += 1;
            print(pages);
            if (pages > 4) {
              pages = 0;
            }
          });
        },
        child: Text(
          pages == 4 ? "Continuar" : "Siguiente",
          style: TextStyle(
              color: pages == 4
                  ? Colors.white
                  : const Color.fromRGBO(116, 116, 116, 1)),
        ),
      ),
    );
  }
}

Widget navigation(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 50),
    margin: const EdgeInsets.symmetric(horizontal: 8),
    height: isActive ? 6 : 7,
    width: isActive ? 28 : 18,
    decoration: BoxDecoration(
        color: isActive
            ? const Color.fromRGBO(252, 19, 96, 1)
            : const Color.fromRGBO(224, 224, 224, 1),
        borderRadius: const BorderRadius.all(Radius.circular(12))),
  );
}
