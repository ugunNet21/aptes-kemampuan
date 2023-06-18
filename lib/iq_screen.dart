import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'result_screen.dart';

class IQScreen extends StatefulWidget {
  @override
  _IQScreenState createState() => _IQScreenState();
}

class _IQScreenState extends State<IQScreen> {
  int selectedAnswerIndex = -1;
  int score = 0;

  List<String> questions = [
    'Question 1: What is the capital of France?',
    'Question 2: What is the square root of 64?',
    'Question 3: What is the largest planet in our solar system?',
  ];

  List<List<String>> options = [
    ['London', 'Paris', 'Rome', 'Berlin'],
    ['4', '6', '8', '10'],
    ['Mars', 'Jupiter', 'Saturn', 'Earth'],
  ];

  void submitAnswer(int answerIndex) {
    setState(() {
      selectedAnswerIndex = answerIndex;
      if (selectedAnswerIndex == 1) {
        score += 1;
      }
    });
    if (questions.length > 1) {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          questions.removeAt(0);
          options.removeAt(0);
          selectedAnswerIndex = -1;
        });
      });
    } else {
      Future.delayed(Duration(seconds: 2), () {
        Get.off(ResultScreen(score: score));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IQ Test'),
      ),
      body: Center(
        child: questions.isEmpty
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    questions[0],
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 16),
                  Column(
                    children: List.generate(options[0].length, (index) {
                      return RadioListTile(
                        title: Text(options[0][index]),
                        value: index,
                        groupValue: selectedAnswerIndex,
                        onChanged: (int? value) {
                          submitAnswer(value!);
                        },
                      );
                    }),
                  ),
                ],
              ),
      ),
    );
  }
}
