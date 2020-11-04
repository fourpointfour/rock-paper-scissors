import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GamePage(),
  ));
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final List<String> imgList = ['rock', 'paper', 'scissor'];
  var image = AssetImage('assets/begin.png');

  void _startSpinning() {
    // display the result in the image
    String imgToBeDisplayed = imgList[Random().nextInt(3)] + '.png';
    setState(() {
      image = AssetImage('assets/' + imgToBeDisplayed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blue[200],
        // appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // this container will contain the images for rock paper and scissors
                Container(
                  height: 200,
                  width: 200,
                  child: Image(
                    image: image,
                  ),
                ),
                // the following container would contain the circular button to start
                Container(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.touch_app),
                    onPressed: () {
                      _startSpinning();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
