import 'package:christmasspa/core/models.dart';
import 'package:christmasspa/ui/christmas_images.dart';
import 'package:christmasspa/ui/mobile_layout.dart';
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
        body: LayoutBuilder(builder: (context, constraints) {
          return constraints.maxWidth >= 600
              ? Stack(
                  children: [
                    ChristmasImages(
                      padding: padding,
                      isMobileView: false,
                      mouseIn: rotateToVertical,
                      mouseOut: rotateToHorizontal,
                    ),
                    AppTitle(
                      turns: rotation.value,
                      isMobileView: false,
                    )
                  ],
                )
              : MobileLayout();
        }));
  }
}

class AppTitle extends StatelessWidget {
  final bool isMobileView;
  AppTitle({Key? key, required this.turns, required this.isMobileView})
      : super(key: key);

  double turns;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 50, top: isMobileView == true ? 100 : 0),
      child: Column(
        mainAxisAlignment: isMobileView == true
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Transform(
              origin: Offset(80, 100),
              transform: Matrix4.rotationZ(isMobileView == true ? turns : 0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  turns == 0 ? 0 : 50
                    Text('Christmas ',
                        style: TextStyle(
                            fontFamily: 'Milssky',
                            color: Colors.white,
                            fontSize: isMobileView == true ? 50 : 80,
                            overflow: TextOverflow.ellipsis)),
                    Text('mood',
                        style: TextStyle(
                          fontFamily: 'Milssky',
                          color: Colors.white,
                          fontSize: isMobileView == true ? 50 : 80,
                        )),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: isMobileView == true ? 300 : 140,
            padding: EdgeInsets.only(left: isMobileView == true ? 160 : 0),
            child: const Text('Створи різдвяний настрій за простим рецептом ',
                style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
