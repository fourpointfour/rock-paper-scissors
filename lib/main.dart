import 'dart:async';
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

  void _startSpinning() async{
    // display the result in the image
    var i = 0;
    var beginning = DateTime.now();
    while(DateTime.now().difference(beginning).inSeconds < 2)
    {
      String imgToBeDisplayed = imgList[i] + '.png';
      setState(() {
        image = AssetImage('assets/' + imgToBeDisplayed);
      });
      i++;
      if(i == 3) i = 0;
      await Future.delayed(const Duration(milliseconds: 100));
    }
    // display a random image finally
    setState(() {
      image = AssetImage('assets/' + imgList[Random().nextInt(3)] + '.png');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent[100],
        // appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // this container will contain the images for rock paper and scissors
                Container(
                  height: 300,
                  width: 300,
                  child: Image(
                    image: image,
                  ),
                ),
                // the following container would contain the circular button to start
                Container(
                  height: 70.0,
                  width: 160.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.touch_app,
                      size: 45.0,
                    ),
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
