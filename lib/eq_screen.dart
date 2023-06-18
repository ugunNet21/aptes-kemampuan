import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'result_screen.dart';

class EQScreen extends StatefulWidget {
  @override
  _EQScreenState createState() => _EQScreenState();
}

class _EQScreenState extends State<EQScreen> {
  int selectedAnswerIndex = -1;
  int score = 0;

  List<String> questions = [
    'Question 1: How do you handle stress?',
    'Question 2: How do you express your emotions?',
    'Question 3: How well do you understand others\' feelings?',
  ];

  List<List<String>> options = [
    ['I take deep breaths and meditate', 'I yell and get angry', 'I ignore it', 'I talk to someone about it'],
    ['I keep them to myself', 'I cry and let it out', 'I express them calmly', 'I write them down'],
    ['I am not aware of others\' feelings', 'I can sense when someone is sad or happy', 'I understand their feelings well', 'I empathize and offer support'],
  ];

  void submitAnswer(int answerIndex) {
    setState(() {
      selectedAnswerIndex = answerIndex;
      if (selectedAnswerIndex == 2) {
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
        title: Text('EQ Test'),
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
