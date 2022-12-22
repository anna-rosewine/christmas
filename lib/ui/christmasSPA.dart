import 'package:flutter/material.dart';

class ChristmasSPA extends StatefulWidget {
  const ChristmasSPA({Key? key}) : super(key: key);

  @override
  _ChristmasSPAState createState() => _ChristmasSPAState();
}

class _ChristmasSPAState extends State<ChristmasSPA> {
  @override
  Widget build(BuildContext context) {
    double itemWidth = (MediaQuery.of(context).size.width * 0.75) / 3;

    return Scaffold(
      backgroundColor: const Color(0xFF281C05),
      body: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  width: itemWidth,
                  child: Image.asset(
                    'assets/images/candles.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: itemWidth,
                child: Image.asset(
                  'assets/images/film.png',
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                  flex: 1,
                  child: Container(
                    width: itemWidth,

                    child: Image.asset(
                      'assets/images/girl.png',
                      fit: BoxFit.cover,
                    ),
                    //
                  )),
            ],
          ),
          AppTitle()
        ],
      ),
    );
  }
}

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Christmas ',
                    style: TextStyle(
                        fontFamily: 'Milssky',
                        color: Colors.white,
                        fontSize: 80)),
                Text('mood',
                    style: TextStyle(
                        fontFamily: 'Milssky',
                        color: Colors.white,
                        fontSize: 80)),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 140,
            child: Text('Створи різдвяний настрій за простим рецептом ',
                style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
