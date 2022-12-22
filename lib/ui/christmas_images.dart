import 'package:christmasspa/core/models.dart';
import 'package:flutter/material.dart';

class ChristmasImages extends StatelessWidget {
  const ChristmasImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width * 0.6) / 3;
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

class ImageItem extends StatelessWidget {
  final double width;
  final String imageAsset;
  final String title;
  ImageItem(
      {Key? key,
      required this.width,
      required this.imageAsset,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: width,
      child: Stack(
        children: [
          ColorFiltered(
            colorFilter:
                ColorFilter.mode(Color(0xFF281C05), BlendMode.modulate),
            child: Image.asset(
              imageAsset,
              colorBlendMode: BlendMode.colorBurn,
              filterQuality: FilterQuality.high,
              width: width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
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
                  title,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
    // ),
  }
}
