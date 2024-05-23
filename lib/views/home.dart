// ignore_for_file: prefer_interpolation_to_compose_strings, curly_braces_in_flow_control_structures

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_calculator_app/views/About.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({super.key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;
  dynamic result = '';
  dynamic finalResult = '0';
  dynamic opr = '';
  dynamic preOpr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculator"),
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.question_circle),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutView()));
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Calculator display
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    text.toString(),
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: Colors.white, fontSize: 68),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton('AC', Colors.grey, Colors.black),
                  calcbutton('+/-', Colors.grey, Colors.black),
                  calcbutton('%', Colors.grey, Colors.black),
                  calcbutton('/', Colors.amber[700], Colors.white),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton('7', Colors.grey[800], Colors.white),
                  calcbutton('8', Colors.grey[800], Colors.white),
                  calcbutton('9', Colors.grey[800], Colors.white),
                  calcbutton('x', Colors.amber[700], Colors.white),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton('4', Colors.grey[800], Colors.white),
                  calcbutton('5', Colors.grey[800], Colors.white),
                  calcbutton('6', Colors.grey[800], Colors.white),
                  calcbutton('-', Colors.amber[700], Colors.white),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton('1', Colors.grey[800], Colors.white),
                  calcbutton('2', Colors.grey[800], Colors.white),
                  calcbutton('3', Colors.grey[800], Colors.white),
                  calcbutton('+', Colors.amber[700], Colors.white),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton('0', Colors.grey[800], Colors.white),
                  calcbutton('.', Colors.grey[800], Colors.white),
                  ElevatedButton(
                    onPressed: () {
                      calculation('=');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[700],
                      padding: const EdgeInsets.fromLTRB(70, 20, 70, 20),
                    ),
                    child: const Text(
                      "=",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }

  Widget calcbutton(String btntxt, Color? btncolor, Color txtcolor) {
    return SizedBox(
      width: 70,
      height: 70,
      child: ElevatedButton(
        onPressed: () {
          calculation(btntxt);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: btncolor,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        child: Text(
          btntxt,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: txtcolor),
        ),
      ),
    );
  }

  void calculation(String btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = (numOne / 100).toString();
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
