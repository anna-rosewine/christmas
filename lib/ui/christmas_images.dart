import 'package:christmasspa/core/models.dart';
import 'package:flutter/material.dart';

class ChristmasImages extends StatelessWidget {
  const ChristmasImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width * 0.6) / 3;
    print('here');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ...items.map(
          (item) => ImageItem(
            title: item.title,
            imageAsset: item.assetPath,
            width: itemWidth,
          ),
        ),
      ],
    );
  }
}

class ImageItem extends StatefulWidget {
  ImageItem(
      {Key? key,
      required this.width,
      required this.imageAsset,
      required this.title})
      : super(key: key);

  double width;
  final String imageAsset;
  final String title;

  @override
  State<ImageItem> createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  late double width;
  ColorFilter filter = ColorFilter.mode(Color(0xFF281C05), BlendMode.modulate);

  @override
  void initState() {
    super.initState();
    width = widget.width;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) {
          setState(() {
            width = widget.width * 1.5;
            filter = ColorFilter.mode(Colors.transparent, BlendMode.saturation);
          });
        },
        onExit: (_) {
          setState(() {
            width = widget.width;
            filter = ColorFilter.mode(Color(0xFF281C05), BlendMode.modulate);
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: MediaQuery.of(context).size.height,
          width: width,
          child: Stack(
            children: [
              ColorFiltered(
                colorFilter: filter,
                child: Image.asset(
                  widget.imageAsset,
                  colorBlendMode: BlendMode.colorBurn,
                  filterQuality: FilterQuality.high,
                  width: width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1,
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
    // ),
  }
}
