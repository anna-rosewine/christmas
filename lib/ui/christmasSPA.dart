import 'package:flutter/material.dart';

class ChristmasSPA extends StatefulWidget {
  const ChristmasSPA({Key? key}) : super(key: key);

  @override
  _ChristmasSPAState createState() => _ChristmasSPAState();
}

class _ChristmasSPAState extends State<ChristmasSPA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF281C05),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              Text('Створи різдвяний настрій',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
          ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container();
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    width: 100,
                    color: Colors.green,
                  )),
              Flexible(
                  flex: 1,
                  child: Container(
                    width: 100,
                    color: Colors.yellow,
                  )),
              Flexible(
                  flex: 1,
                  child: Container(
                    width: 100,
                    color: Colors.purple,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
