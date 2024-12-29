import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  double resultText = 0;
  double firstNumber = 0;
  double secondNumber = 0;
  String operation = "";
  bool isFirstNumber = true; // İlk sayıyı mı giriyoruz kontrolü

  void numberPressed(int number) {
    setState(() {
      if (isFirstNumber) {
        firstNumber = number.toDouble();
      } else {
        secondNumber = number.toDouble();
      }
    });
  }

  void operationPressed(String op) {
    operation = op;
    isFirstNumber = false;
  }

  void calculate() {
    setState(() {
      switch (operation) {
        case "+":
          resultText = firstNumber + secondNumber;
          break;
        case "-":
          resultText = firstNumber - secondNumber;
          break;
        case "*":
          resultText = firstNumber * secondNumber;
          break;
        case "/":
          if (secondNumber != 0) {
            resultText = firstNumber / secondNumber;
          }
          break;
      }
      // İşlem sonrası sıfırlama
      firstNumber = 0;
      secondNumber = 0;
      isFirstNumber = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator app", style: TextStyle(fontSize: 25)),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "First: $firstNumber\nSecond: $secondNumber\nResult: $resultText",
                style: TextStyle(fontSize: 30)
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => numberPressed(1),
                child: Text("1", style: TextStyle(fontSize: 30))
              ),
              TextButton(
                onPressed: () => numberPressed(2),
                child: Text("2", style: TextStyle(fontSize: 30))
              ),
              TextButton(
                onPressed: () => numberPressed(3),
                child: Text("3", style: TextStyle(fontSize: 30))
              ),
              TextButton(
                onPressed: () => numberPressed(4),
                child: Text("4", style: TextStyle(fontSize: 30))
              ),
              TextButton(
                onPressed: () => numberPressed(5),
                child: Text("5", style: TextStyle(fontSize: 30))
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => numberPressed(6),
                child: Text("6", style: TextStyle(fontSize: 30))
              ),
              TextButton(
                onPressed: () => numberPressed(7),
                child: Text("7", style: TextStyle(fontSize: 30))
              ),
              TextButton(
                onPressed: () => numberPressed(8),
                child: Text("8", style: TextStyle(fontSize: 30))
              ),
              TextButton(
                onPressed: () => numberPressed(9),
                child: Text("9", style: TextStyle(fontSize: 30))
              ),
              TextButton(
                onPressed: () => numberPressed(10),
                child: Text("10", style: TextStyle(fontSize: 30))
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => operationPressed("+"),
                child: Text("+", style: TextStyle(fontSize: 80))
              ),
              TextButton(
                onPressed: () => operationPressed("-"),
                child: Text("-", style: TextStyle(fontSize: 80))
              ),
              TextButton(
                onPressed: () => operationPressed("*"),
                child: Text("*", style: TextStyle(fontSize: 80))
              ),
              TextButton(
                onPressed: () => operationPressed("/"),
                child: Text("/", style: TextStyle(fontSize: 80))
              ),
            ],
          ),
          ElevatedButton(
            onPressed: calculate,
            child: Text("=", style: TextStyle(fontSize: 40))
          )
        ],
      ),
    );
  }
}