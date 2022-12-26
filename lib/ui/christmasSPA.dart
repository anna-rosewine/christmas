import 'package:christmasspa/core/models.dart';
import 'package:christmasspa/ui/christmas_images.dart';
import 'package:flutter/material.dart';

class ChristmasSPA extends StatefulWidget {
  const ChristmasSPA({Key? key}) : super(key: key);

  @override
  _ChristmasSPAState createState() => _ChristmasSPAState();
}

class _ChristmasSPAState extends State<ChristmasSPA> {
  late double padding;
  double turns = 0.0;

  void _changeRotation() {
    setState(() => turns += 1.0 / 8.0);
  }

  rotateToVertical() {
    print('vert');

    _changeRotation();
    setState(() {
      padding = MediaQuery.of(context).size.width * 0.2;
    });
  }

  rotateToHorizontal() {}

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width * 0.75) / 3;
    padding = MediaQuery.of(context).size.width * 0.4;
    return Scaffold(
      backgroundColor: const Color(0xFF281C05),
      body: Stack(
        children: [
          ChristmasImages(
            padding: padding,
            mouseIn: rotateToVertical,
            mouseOut: rotateToHorizontal,
          ),
          AppTitle(
            turns: turns,
          )
        ],
      ),
    );
  }
}

class AppTitle extends StatelessWidget {
  AppTitle({Key? key, required this.turns}) : super(key: key);

  double turns;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: AnimatedRotation(
              turns: turns,
              duration: const Duration(seconds: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Christmas ',
                      style: TextStyle(
                          fontFamily: 'Milssky',
                          color: Colors.white,
                          fontSize: 80)),
                  Text('mood',
                      style: TextStyle(
                          fontFamily: 'Milssky',
                          color: Colors.white,
                          fontSize: 80)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 140,
            child: Text('Створи різдвяний настрій за простим рецептом ',
                style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
