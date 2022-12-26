import 'package:christmasspa/core/models.dart';
import 'package:christmasspa/ui/customBtn.dart';
import 'package:flutter/material.dart';

class ChristmasImages extends StatelessWidget {
  final Function mouseIn;
  final Function mouseOut;
  final double padding;
  final bool isMobileView;
  final Function? checkOpenItem;
  final MoodItem? openMpbileItem;
  const ChristmasImages({
    Key? key,
    required this.padding,
    required this.mouseIn,
    required this.mouseOut,
    required this.isMobileView,
    required this.checkOpenItem,
    required this.openMpbileItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width * 0.6) / 3;
    print('build');
    return Container(
        padding:
            EdgeInsets.only(left: padding, top: isMobileView == true ? 350 : 0),
        child: MouseRegion(
            onEnter: (e) {
              mouseIn();
            },
            onExit: (e) {
              mouseOut();
            },
            child: isMobileView == true
                ? _mobileView(context)
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ...items.map(
                        (item) => ImageItem(
                          checkOpenItem: null,
                          isMobileOpen: false,
                          isMobileView: false,
                          moodItem: item,
                          width: itemWidth,
                        ),
                      ),
                    ],
                  )));
  }

  Widget _mobileView(BuildContext context) {
    return ListView(
      children: [
        ...items.map(
          (item) => ImageItem(
            isMobileOpen: openMpbileItem?.title == item.title ? true : false,
            checkOpenItem: checkOpenItem,
            isMobileView: true,
            moodItem: item,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}

class ImageItem extends StatefulWidget {
  final Function? checkOpenItem;
  bool isMobileOpen;

  ImageItem(
      {Key? key,
      required this.width,
      required this.moodItem,
      required this.isMobileView,
      required this.checkOpenItem,
      required this.isMobileOpen})
      : super(key: key);

  double width;
  final MoodItem moodItem;
  final bool isMobileView;

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
    // print(
    //     'is mob: ${widget.isMobileView}, open:${widget.isMobileOpen}, ${widget.moodItem.title} ');
    // if (widget.isMobileView == true && widget.isMobileOpen == false) {
    //   _controller.reverse();
    //   setState(() {
    //     isOpen = false;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isMobileView == true && widget.isMobileOpen == false) {
      _controller.reverse();
      // setState(() {
      //   isOpen = false;
      // });
    }
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          return widget.isMobileView == true
              ? InkWell(
                  onTap: () {
                    widget.checkOpenItem != null
                        ? widget.checkOpenItem!(widget.moodItem)
                        : '';
                    _controller.forward();
                    setState(() {
                      isOpen = true;
                    });
                  },
                  child: _imageBody())
              : Flexible(
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
                      child: _imageBody()));
        });
    // ),
  }

  Widget _imageBody() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: widget.isMobileView == true
          ? 200
          : MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      // width: _widthAnimation.value,
      child: Stack(
        children: [
          ColorFiltered(
            colorFilter:
                ColorFilter.mode(_filterAnimation.value, BlendMode.modulate),
            child: Image.asset(
              widget.moodItem.assetPath,
              colorBlendMode: BlendMode.colorBurn,
              filterQuality: FilterQuality.high,
              width: MediaQuery.of(context).size.width,
              height: widget.isMobileView == true
                  ? 200
                  : MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
          Opacity(
              opacity: _titleOpacityAnimation.value,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: widget.isMobileView == true ? 20 : 70,
                    horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1,
                      color: Colors.white,
                      height: widget.isMobileView == true
                          ? 60
                          : MediaQuery.of(context).size.height * 0.3,
                    ),
                    SizedBox(
                      height: widget.isMobileView == true ? 10 : 20,
                    ),
                    Text(
                      widget.moodItem.title,
                      style: TextStyle(
                          color: Colors.white, overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Opacity(
                  opacity: 1.0 - _titleOpacityAnimation.value,
                  child: CustomBtn(
                      link: widget.moodItem.link, title: widget.moodItem.title),
                ),
              ))
        ],
      ),
    );
  }
}
