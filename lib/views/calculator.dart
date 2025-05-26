import 'package:calculator_app/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _expression = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        _output = "0";
        _expression = "";
        _num1 = 0;
        _num2 = 0;
        _operand = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "×" ||
          buttonText == "÷") {
        _num1 = double.parse(_output);
        _operand = buttonText;
        _expression = _output + " " + _operand;
        _output = "0";
      } else if (buttonText == "=") {
        _num2 = double.parse(_output);
        _expression = "$_expression $_output =";

        double result = 0;
        if (_operand == "+") {
          result = _num1 + _num2;
        } else if (_operand == "-") {
          result = _num1 - _num2;
        } else if (_operand == "×") {
          result = _num1 * _num2;
        } else if (_operand == "÷") {
          result = _num2 != 0 ? _num1 / _num2 : double.nan;
        }

        if (result.isNaN || result.isInfinite) {
          _output = "Error";
        } else {
          _output =
              result % 1 == 0
                  ? result.toInt().toString()
                  : result.toStringAsFixed(7);
        }

        _operand = "";
        _num1 = 0;
        _num2 = 0;
      } else if (buttonText == "%") {
        double current = double.parse(_output);
        current = current / 100;
        _output =
            current % 1 == 0
                ? current.toInt().toString()
                : current.toStringAsFixed(7);
      } else if (buttonText == ".") {
        if (!_output.contains(".")) {
          _output += ".";
        }
      } else {
        if (_output == "0") {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  _expression,
                  style: TextStyle(fontSize: 50, color: Colors.white60),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  _output,
                  style: TextStyle(fontSize: 50, color: Colors.white70),
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalculatorButton(
                        label: 'AC',
                        onTap: () => buttonPressed('AC'),
                        bgColor: Color(0xFF777772),
                        textColor: Colors.white,
                      ),
                      CalculatorButton(
                        label: '+/-',
                        onTap: () => buttonPressed('+/-'),
                        bgColor: Color(0xFF777772),
                        textColor: Colors.white,
                      ),
                      CalculatorButton(
                        label: '%',
                        onTap: () => buttonPressed('%'),
                        bgColor: Color(0xFF777772),
                        textColor: Colors.white,
                      ),
                      CalculatorButton(
                        label: '÷',
                        onTap: () => buttonPressed('÷'),
                        bgColor: Color(0xFFFF9500),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalculatorButton(
                        label: '7',
                        onTap: () => buttonPressed('7'),
                      ),
                      CalculatorButton(
                        label: '8',
                        onTap: () => buttonPressed('8'),
                      ),
                      CalculatorButton(
                        label: '9',
                        onTap: () => buttonPressed('9'),
                      ),
                      CalculatorButton(
                        label: 'x',
                        bgColor: Color(0xFFFF9500),
                        onTap: () => buttonPressed('×'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalculatorButton(
                        label: '4',
                        onTap: () => buttonPressed('4'),
                      ),
                      CalculatorButton(
                        label: '5',
                        onTap: () => buttonPressed('5'),
                      ),
                      CalculatorButton(
                        label: '6',
                        onTap: () => buttonPressed('6'),
                      ),
                      CalculatorButton(
                        label: '-',
                        bgColor: Color(0xFFFF9500),
                        onTap: () => buttonPressed('-'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CalculatorButton(
                        label: '1',
                        onTap: () => buttonPressed('1'),
                      ),
                      CalculatorButton(
                        label: '2',
                        onTap: () => buttonPressed('2'),
                      ),
                      CalculatorButton(
                        label: '3',
                        onTap: () => buttonPressed('3'),
                      ),
                      CalculatorButton(
                        label: '+',
                        bgColor: Color(0xFFFF9500),
                        onTap: () => buttonPressed('+'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => buttonPressed('0'),
                        child: Container(
                          width: 190,
                          height: 80,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 30),
                          margin: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Color(0xFF505050),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Text(
                            '0',
                            style: TextStyle(fontSize: 28, color: Colors.white),
                          ),
                        ),
                      ),
                      CalculatorButton(label: '.'),
                      CalculatorButton(
                        label: '=',
                        bgColor: Color(0xFFFF9500),
                        onTap: () => buttonPressed('='),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
