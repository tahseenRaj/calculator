import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Array of button
  final List<String> operations = [
    'C',
    '\u{232B}',
    '👻',
    '/',
    '7',
    '8',
    '9',
    '\u00d7',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '%',
    '=',
  ];
  var userInput = '';
  var answer = '0';

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            // color: Colors.red,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                userInput,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: GoogleFonts.robotoSlab(fontSize: 40, letterSpacing: 1),
              ),
            ),
          ),
          const Divider(
            color: Colors.black12,
            indent: 20,
            endIndent: 20,
          ),
          Container(
            height: 100,
            width: double.infinity,
            // color: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            alignment: Alignment.centerRight,
            child: Text(
              answer,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: GoogleFonts.robotoSlab(fontSize: 50, letterSpacing: 1),
            ),
          ),
          const Divider(
            color: Colors.black12,
          ),
          Expanded(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: operations.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TextButton(
                        style: ButtonStyle(
                          // backgroundColor: MaterialStateProperty.all(isOperator(operations[index]) ? Colors.lightBlue : Colors.transparent),
                          overlayColor:
                              MaterialStateProperty.all(Colors.black12),
                          shape:
                              MaterialStateProperty.resolveWith<OutlinedBorder>(
                                  (_) {
                            return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50));
                          }),
                        ),
                        onPressed: () {
                          if (index == 0) {
                            setState(() {
                              if (userInput.isNotEmpty) {
                                userInput = '';
                                answer = '0';
                              }
                            });
                          } else if (index == 1) {
                            setState(() {
                              if (userInput.isNotEmpty) {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                              }
                            });
                          } else if (index == 2) {
                            setState(() {
                              showDialog(
                                  // barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    Future.delayed(const Duration(seconds: 3),
                                        () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return const AlertDialog(
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      title: Image(
                                          image: AssetImage('assets/6os.gif')),
                                    );
                                  });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.blueGrey,
                                      elevation: 1,
                                      duration: Duration(milliseconds: 2000),
                                      content: Text(
                                          'Sorry don\'t know what to do with this operator! 😕')));
                            });
                          } else if (index == 19) {
                            setState(() {
                              answer = '';
                              equalPressed();
                            });
                          } else {
                            setState(() {
                              userInput += operations[index];
                            });
                          }
                          print('You have clicked ${operations[index]}');
                          print(userInput);
                        },
                        child: Center(
                            child: Text(
                          operations[index],
                          style: GoogleFonts.robotoSlab(
                              fontSize: 35, color: Colors.black),
                        )));
                  }))
        ],
      );
  }

  bool isOperator(String x) {
    if (x == '/' ||
        x == '\u00d7' ||
        x == '-' ||
        x == '+' ||
        x == '=' ||
        x == '%') {
      return true;
    }
    return false;
  }

// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('\u00d7', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    if (answer.contains('.')) {
      answer = eval.toStringAsFixed(3);
    } else {
      answer = eval.toStringAsFixed(eval.truncateToDouble() == eval ? 0 : 1);
    }
  }
}
