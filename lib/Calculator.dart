/* ******************************************
                 *** START***
****************************************** */

import 'package:flutter/material.dart';

class LCalculator2 extends StatefulWidget {
  @override
  _LCalculator2State createState() => _LCalculator2State();
}

class _LCalculator2State extends State<LCalculator2> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    // print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildNumberPad(String buttonText) {
    return Expanded(
      child: Container(
        color: Colors.pinkAccent.shade50,
        child: OutlineButton(
          padding: EdgeInsets.all(24.0),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => buttonPressed(buttonText),
          borderSide: BorderSide(
            color: Colors.pink, //Color of the border
            style: BorderStyle.solid, //Style of the border
            width: 0.1, //width of the border
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.pink,
                    width: 1.0,
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: Text(output,
                    style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink))),
            Divider(),
            Column(children: [
              Row(children: [
                buildNumberPad("1"),
                buildNumberPad("2"),
                buildNumberPad("3"),
                buildNumberPad("/")
              ]),
              Row(children: [
                buildNumberPad("4"),
                buildNumberPad("5"),
                buildNumberPad("6"),
                buildNumberPad("x")
              ]),
              Row(children: [
                buildNumberPad("7"),
                buildNumberPad("8"),
                buildNumberPad("9"),
                buildNumberPad("-")
              ]),
              Row(children: [
                buildNumberPad("."),
                buildNumberPad("0"),
                buildNumberPad("00"),
                buildNumberPad("+")
              ]),
              Row(children: [
                buildNumberPad("CLEAR"),
                buildNumberPad("="),
              ])
            ])
          ],
        ),
      )),
    );
  }
}

/* ******************************************
*********************************************
*********************************************
              *** END***
*********************************************
*********************************************
****************************************** */
