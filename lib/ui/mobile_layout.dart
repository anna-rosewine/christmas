import 'package:christmasspa/core/models.dart';
import 'package:christmasspa/ui/christmasSPA.dart';
import 'package:christmasspa/ui/christmas_images.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  _MobileLayoutState createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  MoodItem? openItem;
  _checkOpenItem(MoodItem item) {
    print(item.title + ' ttttttt');
    setState(() {
      openItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ChristmasImages(
          checkOpenItem: _checkOpenItem,
          padding: 0,
          isMobileView: true,
          mouseIn: () {},
          mouseOut: () {},
          openMpbileItem: openItem,
        ),
        AppTitle(
          turns: 0,
          isMobileView: true,
        )
      ],
    );
  }
}
