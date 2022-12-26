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
  double rotation = 0.0;

  rotateToVertical() {
    print('vert');

    setState(() {
      padding = MediaQuery.of(context).size.width * 0.2;
      rotation = -1.58;
    });
  }

  rotateToHorizontal() {
    setState(() {
      padding = MediaQuery.of(context).size.width * 0.2;
      rotation = 0.0;
    });
  }

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
            turns: rotation,
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
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              // transform: Matrix4.rotationZ(turns),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  turns == 0 ? 0 : 50
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
          const SizedBox(
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
