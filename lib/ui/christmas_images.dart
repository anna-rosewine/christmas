import 'package:flutter/material.dart';

class ChristmasImages extends StatelessWidget {
  const ChristmasImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width * 0.75) / 3;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ImageItem(
          imageAsset: 'assets/images/candles.png',
          width: itemWidth,
        ),
        ImageItem(
          imageAsset: 'assets/images/film.png',
          width: itemWidth,
        ),
        ImageItem(
          imageAsset: 'assets/images/girl.png',
          width: itemWidth,
        ),
      ],
    );
  }
}

class ImageItem extends StatelessWidget {
  final double width;
  final String imageAsset;
  ImageItem({Key? key, required this.width, required this.imageAsset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.greenAccent, BlendMode.hue),
      child: Image.asset(
        imageAsset,
        colorBlendMode: BlendMode.colorBurn,
        filterQuality: FilterQuality.high,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
