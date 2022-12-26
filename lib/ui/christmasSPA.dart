import 'package:christmasspa/core/models.dart';
import 'package:christmasspa/ui/christmas_images.dart';
import 'package:flutter/material.dart';

class ChristmasSPA extends StatefulWidget {
  const ChristmasSPA({Key? key}) : super(key: key);

  @override
  _ChristmasSPAState createState() => _ChristmasSPAState();
}

class _ChristmasSPAState extends State<ChristmasSPA>
    with SingleTickerProviderStateMixin {
  late double padding;
  late Animation<double> rotation;
  late AnimationController _rotateController;

  rotateToVertical() {
    print('vert');
    _rotateController.forward();
    setState(() {
      padding = MediaQuery.of(context).size.width * 0.2;
    });
  }

  rotateToHorizontal() {
    _rotateController.reverse();
    setState(() {
      padding = MediaQuery.of(context).size.width * 0.2;
    });
  }

  @override
  initState() {
    super.initState();

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 400,
      ),
    );

    rotation = Tween<double>(
      begin: 0.0,
      end: -1.58,
    ).animate(_rotateController);

    _rotateController.addListener(() {
      setState(() {});
    });

    // _rotateController.forward();
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
            turns: rotation.value,
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
            child: Transform(
              origin: Offset(80, 100),
              transform: Matrix4.rotationZ(turns),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    //  turns == 0 ? 0 : 50
                    Text('Christmas ',
                        style: TextStyle(
                            fontFamily: 'Milssky',
                            color: Colors.white,
                            fontSize: 80,
                            overflow: TextOverflow.ellipsis)),
                    Text('mood',
                        style: TextStyle(
                            fontFamily: 'Milssky',
                            color: Colors.white,
                            fontSize: 80)),
                  ],
                ),
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
