import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkewCut',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skew Cut'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(50),
            child:ClipPath(
              clipper: SkewCut(),
              child: Container(
                color: Colors.blue,
              ),
            )
        )
    );
  }
}

class SkewCut extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0, size.height);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 70);
    path.quadraticBezierTo(size.width, 50, size.width - size.width * 0.07, 45);

    path.lineTo(size.width * 0.07, 0);
    path.quadraticBezierTo(0, -2, 0, 25);

    return path;
  }

  @override
  bool shouldReclip(SkewCut oldClipper) => false;
}
