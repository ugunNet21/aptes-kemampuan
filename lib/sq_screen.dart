import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'result_screen.dart';

class SQScreen extends StatefulWidget {
  @override
  _SQScreenState createState() => _SQScreenState();
}

class _SQScreenState extends State<SQScreen> {
  int selectedAnswerIndex = -1;
  int score = 0;

  List<String> questions = [
    'Question 1: How do you solve problems?',
    'Question 2: How well do you understand social dynamics?',
    'Question 3: How do you handle conflicts?',
  ];

  List<List<String>> options = [
    ['I analyze the situation and come up with a logical solution', 'I ask others for help', 'I avoid problems', 'I try different approaches'],
    ['I am not aware of social dynamics', 'I observe and adapt to social cues', 'I understand social dynamics well', 'I can lead and influence others'],
    ['I avoid conflicts at all costs', 'I give in and compromise', 'I stand my ground and assert my opinions', 'I find a win-win solution'],
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
        title: Text('SQ Test'),
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
