import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomBtn extends StatelessWidget {
  final String link;
  final String title;
  const CustomBtn({Key? key, required this.link, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          launch(link);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          color: Colors.black,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ));
  }
}
