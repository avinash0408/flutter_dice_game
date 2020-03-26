import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(Dice());

class Dice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'dice home',
        home: Scaffold(
          backgroundColor: Colors.redAccent,
          appBar: AppBar(
            title: Center(child: Text("DICE GAME")),
            backgroundColor: Colors.orangeAccent,
          ),
          body: Homepage(),
        ));
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  var s = 0;
  var ln = 1;
  var rn = 2;
  var flag = 1;
  void reset() {
    setState(() {
      ln = 1;
      rn = 2;
      s = 0;
      flag=1;
    });
  }

  void face() {
    setState(() {
      if (ln == rn) {
        flag = 0;
      } else {
        ln = Random().nextInt(6) + 1;
        rn = Random().nextInt(6) + 1;
        s = s + 1;
      }
    });
  }
  void close()
  {
    exit(0);
  }
  

  Widget build(BuildContext context) {
    if (flag == 0)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'your score is:$s',
                style: TextStyle(fontSize: 40, color: Colors.greenAccent),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: FlatButton(
                      onPressed: reset,
                      child: Text("Restart",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                              ),
                              ),
                              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: FlatButton(
                      onPressed: close,
                      child: Text("Close",
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                              ),
                              ),
                              ),
            ],
          )
        ],
      );
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: face,
                    child: Image(
                      image: AssetImage('images/dice$ln.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: face,
                    child: Image(
                      image: AssetImage('images/dice$rn.png'),
                    ),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              FlatButton(
                onPressed: reset,
                child: Text(
                  "reset",
                  style: TextStyle(fontSize: 40, color: Colors.greenAccent),
                ),
              ),
            ]),
          ],
        ),
      );
    }
  }
}
