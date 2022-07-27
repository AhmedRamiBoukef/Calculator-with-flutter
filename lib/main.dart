import 'package:flutter/material.dart';
import 'widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int firstNum = 0;
  int secondNum = 0;
  String history = '';
  String res = '';
  String textToDisplay = '';
  String operation = '';
  void btnOnClick(btnValue) {
    print(btnValue);
    if (btnValue == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      operation = '';
    } else if (btnValue == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnValue == '/' ||
        btnValue == 'X' ||
        btnValue == '-' ||
        btnValue == '+') {
      firstNum = int.parse(textToDisplay);
      res = '';
      operation = btnValue;
    } else if (btnValue == '=') {
      secondNum = int.parse(textToDisplay);
      history =
          firstNum.toString() + operation.toString() + secondNum.toString();
      if (operation == 'X') {
        res = (firstNum * secondNum).toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
      }
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
      }
      if (operation == '/') {
        res = (firstNum / secondNum).toString();
      }
    } else if (btnValue == '<') {
      if (textToDisplay != '')
        res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnValue == '+/-') {
      if (textToDisplay[0] == '-') {
        res = textToDisplay.substring(1);
      } else {
        res = '-' + textToDisplay;
      }
    } else {
      res = int.parse(textToDisplay + btnValue).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      title: 'Calculator',
      home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'Claculator',
              ),
            ),
          ),
          backgroundColor: Color(0xFF28527a),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment(1.0, 1.0),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      history,
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0x66FFFFFF),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment(1.0, 1.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      textToDisplay,
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Calc_Button('AC', Color(0xFF8ac4d0), btnOnClick),
                    Calc_Button('C', Color(0xFF8ac4d0), btnOnClick),
                    Calc_Button('<', Color(0xFFf4d160), btnOnClick),
                    Calc_Button('/', Color(0xFFf4d160), btnOnClick),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Calc_Button('9', Color(0xFF8ac4d0), btnOnClick),
                    Calc_Button('8', Color(0xFF8ac4d0), btnOnClick),
                    Calc_Button('7', Color(0xFF8ac4d0), btnOnClick),
                    Calc_Button('X', Color(0xFFf4d160), btnOnClick),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Calc_Button('4', Color(0xFF8ac4d0), btnOnClick),
                    Calc_Button('5', Color(0xFF8ac4d0), btnOnClick),
                    Calc_Button('6', Color(0xFF8ac4d0), btnOnClick),
                    Calc_Button('-', Color(0xFFf4d160), btnOnClick),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Calc_Button('1', Color(0xFF8ac4d0), btnOnClick),
                    Calc_Button('2', Color(0xFF8ac4d0), btnOnClick),
                    Calc_Button('3', Color(0xFF8ac4d0), btnOnClick),
                    Calc_Button('+', Color(0xFFf4d160), btnOnClick),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Calc_Button('+/-', Color(0xFF8ac4d0), btnOnClick),
                    Calc_Button('0', Color(0xFF8ac4d0), btnOnClick),
                    Calc_Button('00', Color(0xFF8ac4d0), btnOnClick),
                    Calc_Button('=', Color(0xFFf4d160), btnOnClick),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
