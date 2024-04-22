import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dice(),
    );
  }
}

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  var die = [
    'dice1.png',
    'dice2.png',
    'dice3.png',
    'dice4.png',
    'dice5.png',
    'dice6.png'
  ];
  int diceOne = Random().nextInt(6);
  int diceTwo = Random().nextInt(6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: Text(
                'The sum is: ' + (diceOne + diceTwo + 2).toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset(
                  'images/' + die[diceOne],
                  height: 150,
                  width: 150,
                ),
                Image.asset(
                  'images/' + die[diceTwo],
                  height: 150,
                  width: 150,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: ElevatedButton(
                onPressed: changeDice,
                child: Text('Roll Dice'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void changeDice() {
    setState(() {
      diceOne = Random().nextInt(6);
      diceTwo = Random().nextInt(6);
    });
  }
}
