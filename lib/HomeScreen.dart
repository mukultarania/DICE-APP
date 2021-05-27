import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int ld = 1;
  int rd = 1;
  void roll(){
    setState(() {
      Random random = new Random();
      // int randomNumber = random.nextInt(6)+1;
      ld = random.nextInt(6)+1;
      rd = random.nextInt(6)+1;
    });
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
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Image(
                      image: AssetImage('images/dice-png-$ld.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(50),
                    child: Image(
                      image: AssetImage('images/dice-png-$rd.png'),
                    ),
                  ),
                )
              ],
            ),
            RaisedButton(
              onPressed: roll,
              child: Text(
                'Roll',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: 'Pacifico', color: Colors.white, fontSize: 60),
              ),
            )
          ],
        ),
      ),
    );
  }
}
