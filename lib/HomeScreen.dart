import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int ld1 = 1;
  int rd1 = 1;
  int ld2 = 1;
  int rd2 = 1;
  AnimationController _aC;
  var ani;
  void roll() {
    _aC.forward();
  }

  void animate() {
    _aC = AnimationController(duration: Duration(seconds: 1), vsync: this);
    // _aC.forward();
    ani = CurvedAnimation(parent: _aC, curve: Curves.bounceOut);
    ani.addListener(() {
      setState(() {});
    });
    ani.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ld1 = Random().nextInt(6) + 1;
        rd1 = Random().nextInt(6) + 1;
        ld2 = Random().nextInt(6) + 1;
        rd2 = Random().nextInt(6) + 1;
        _aC.reverse();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  void dispose() {
    super.dispose();
    _aC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Throw'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: roll,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 70, top: 70, right: 30, bottom: 30),
                      child: Image(
                        height: 200 - (ani.value) * 200,
                        image: AssetImage('images/dice-png-$ld1.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: roll,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 30, top: 70, right: 70, bottom: 30),
                      child: Image(
                        height: 200 - (ani.value) * 200,
                        image: AssetImage('images/dice-png-$rd1.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: roll,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 70, top: 30, right: 30, bottom: 70),
                      child: Image(
                        height: 200 - (ani.value) * 200,
                        image: AssetImage('images/dice-png-$ld2.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: roll,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 30, top: 30, right: 70, bottom: 70),
                      child: Image(
                        height: 200 - (ani.value) * 200,
                        image: AssetImage('images/dice-png-$rd2.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
            RaisedButton(
              onPressed: roll,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 30,right: 30),
                child: Text(
                  'Roll',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                      color: Colors.white,
                      fontSize: 40),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
