import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

// Importaciones clase Vistas
//flutter doctor -v
import '../pages/on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    _loadImge("assets/images/splash.png");
    // _toOnbording();
  }

  _loadImge(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);

    setState(() => this.image = image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CustomPaint(
            painter: _SplashCanvas(image),
          ),
        ),
      ),
    );
  }

  _toOnbording() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnBoarding(),
      ),
    );
  }
}

class _SplashCanvas extends CustomPainter {
  final ui.Image? imageCanvas;
  const _SplashCanvas(this.imageCanvas);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color.fromRGBO(119, 171, 86, 1);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    path.lineTo(0, size.height * 0.10);

    path.quadraticBezierTo(size.width * 0.1, size.height * 0.20, size.width / 3,
        size.height * 0.12);

    path.quadraticBezierTo(size.width / 2.1, size.height * 0.08,
        2 * (size.width / 3), size.height * 0.12);

    path.quadraticBezierTo(size.width / 1.2, size.height * 0.15,
        3 * (size.width / 3), size.height * 0.1);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);

    final paint2 = Paint();

    paint2.color = const Color.fromRGBO(119, 171, 86, 1);

    paint2.style = PaintingStyle.fill;

    paint2.strokeWidth = 5;

    final path2 = Path();

    path2.lineTo(0, size.height);
    path2.quadraticBezierTo(
        size.width * 0.70, size.height * 0.80, size.width, size.height);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);

    canvas.drawPath(path2, paint2);

    canvas.scale(0.30, 0.30);

    canvas.drawImage(imageCanvas!, const Offset(130 * 2.5, 270 * 3.0), paint);

    const textSplash = TextStyle(color: Colors.black, fontSize: 80);
    const textS = TextSpan(text: 'Hello world', style: textSplash);
    final mostrarText = TextPainter(
      text: textS,
      textDirection: TextDirection.ltr,
    );
    mostrarText.layout(minWidth: 0, maxWidth: size.width);
    const offset = Offset(190 * 2.5, 300 * 5.8);
    mostrarText.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
