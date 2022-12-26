import 'package:christmasspa/core/models.dart';
import 'package:christmasspa/ui/customBtn.dart';
import 'package:flutter/material.dart';

class ChristmasImages extends StatelessWidget {
  final Function mouseIn;
  final Function mouseOut;
  final double padding;
  const ChristmasImages({
    Key? key,
    required this.padding,
    required this.mouseIn,
    required this.mouseOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width * 0.6) / 3;
    print(padding);
    return Container(
        padding: EdgeInsets.only(left: padding),
        child: MouseRegion(
            onEnter: (e) {
              mouseIn();
            },
            onExit: (e) {
              mouseOut();
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ...items.map(
                  (item) => ImageItem(
                    moodItem: item,
                    width: itemWidth,
                  ),
                ),
              ],
            )));
  }
}

class ImageItem extends StatefulWidget {
  ImageItem({Key? key, required this.width, required this.moodItem})
      : super(key: key);

  double width;
  final MoodItem moodItem;

  @override
  State<ImageItem> createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double width;

  bool isOpen = false;
  late Animation _flexAnimation;
  late Animation _titleOpacityAnimation;
  late Animation _widthAnimation;
  late Animation _filterAnimation;
  ColorFilter filter =
      const ColorFilter.mode(Color(0xFF281C05), BlendMode.modulate);

  @override
  void initState() {
    super.initState();
    width = widget.width;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _filterAnimation = ColorTween(
            begin: const Color(0xFF281C05), end: Colors.white.withOpacity(1))
        .animate(_controller);
    _widthAnimation =
        Tween<double>(begin: widget.width, end: widget.width * 1.5)
            .animate(_controller);
    _titleOpacityAnimation =
        Tween<double>(begin: 1, end: 0).animate(_controller);
    _flexAnimation = IntTween(begin: 100, end: 200).animate(_controller);
    _controller.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          return Flexible(
              flex: _flexAnimation.value,
              child: MouseRegion(
                  onEnter: (_) {
                    _controller.forward();
                    setState(() {
                      isOpen = true;
                    });
                  },
                  onExit: (_) {
                    _controller.reverse();
                    setState(() {
                      isOpen = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    height: MediaQuery.of(context).size.height,
                    // width: _widthAnimation.value,
                    child: Stack(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              _filterAnimation.value, BlendMode.modulate),
                          child: Image.asset(
                            widget.moodItem.assetPath,
                            colorBlendMode: BlendMode.colorBurn,
                            filterQuality: FilterQuality.high,
                            // width: _widthAnimation.value,
                            height: MediaQuery.of(context).size.height,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Opacity(
                            opacity: _titleOpacityAnimation.value,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 70, horizontal: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 1,
                                    color: Colors.white,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    widget.moodItem.title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              ),
                            )),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Opacity(
                                opacity: 1.0 - _titleOpacityAnimation.value,
                                child: CustomBtn(
                                    link: widget.moodItem.link,
                                    title: widget.moodItem.title),
                              ),
                            ))
                      ],
                    ),
                  )));
        });
    // ),
  }
}
