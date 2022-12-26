import 'package:christmasspa/ui/christmasSPA.dart';
import 'package:christmasspa/ui/christmas_images.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ChristmasImages(
          padding: 0,
          isMobileView: true,
          mouseIn: () {},
          mouseOut: () {},
        ),
        AppTitle(
          turns: 0,
          isMobileView: true,
        )
      ],
    );
    ;
  }
}
