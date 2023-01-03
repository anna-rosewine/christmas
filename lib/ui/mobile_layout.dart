import 'package:christmasspa/core/models.dart';
import 'package:christmasspa/ui/christmasSPA.dart';
import 'package:christmasspa/ui/christmas_images.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatefulWidget {
  MobileLayout({Key? key}) : super(key: key);

  @override
  _MobileLayoutState createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  MoodItem? openItem;
  double top = 0;
  _checkOpenItem(MoodItem item) {
    item.title == openItem?.title
        ? setState(() {
            openItem = null;
          })
        : setState(() {
            openItem = item;
          });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            notification.scrollDelta != null
                ? setState(() {
                    top -= notification.scrollDelta!;
                  })
                : '';
          }
          return true;
        },
        child: Stack(
          children: [
            Positioned(
              top: top,
              child: AppTitle(
                turns: 0,
                isMobileView: true,
              ),
            ),
            ChristmasImages(
              checkOpenItem: _checkOpenItem,
              padding: 0,
              isMobileView: true,
              topMobilePadding: 350 + top > 30 ? 350 + top : 10,
              mouseIn: () {},
              mouseOut: () {},
              openMpbileItem: openItem,
            ),
          ],
        ));
  }
}
