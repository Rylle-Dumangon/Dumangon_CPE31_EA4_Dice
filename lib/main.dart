import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF14213D),
        appBar: AppBar(
          title: const Text(
              'Dice',
          style: TextStyle(
            color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1;
  int right = 1;
  String message = 'Press A Dice To Roll';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextButton(
                        onPressed: (){
                          setState(() {
                            ChangeValue();
                          });
                          print('left side pressed');
                        },
                        child: Image.asset('images/dice$left.png')),
                  )
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextButton(
                      onPressed: (){
                        setState(() {
                          ChangeValue();
                        });
                        print('right side pressed');
                      },
                      child: Image.asset('images/dice$right.png')),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Dice Total = ${left + right  }',
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                Reset();
              });
            }, child: const Text(
            'Reset',
            style: TextStyle(fontSize: 25),
          ),
          ),
        ],
      ),
    );
  }
  void ChangeValue(){
    left = 1 + Random().nextInt(6);
    right = 1 + Random().nextInt(6);
    if (left > right){
      message = 'Left Dice Rolled Higher';
    }else if (left < right){
      message = 'Right Dice Rolled Higher';
    }else{
      message = 'Dice Are Equal';
    }
  }
  void Reset(){
    left = 1;
    right =1;
  }
}

