import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  ResultScreen({required this.score});

  String getIQCategory() {
    if (score <= 1) {
      return 'Below Average';
    } else if (score == 2) {
      return 'Average';
    } else {
      return 'Above Average';
    }
  }

  String getEQCategory() {
    if (score <= 1) {
      return 'Low';
    } else if (score == 2) {
      return 'Moderate';
    } else {
      return 'High';
    }
  }

  String getSQCategory() {
    if (score <= 1) {
      return 'Needs Improvement';
    } else if (score == 2) {
      return 'Satisfactory';
    } else {
      return 'Excellent';
    }
  }

  String getFutureSkills() {
    if (score <= 1) {
      return 'You may benefit from developing problem-solving skills, emotional intelligence, and social understanding.';
    } else if (score == 2) {
      return 'You have a moderate level of skills in problem-solving, emotional intelligence, and social understanding.';
    } else {
      return 'You have strong skills in problem-solving, emotional intelligence, and social understanding.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your Scores:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'IQ: ${getIQCategory()}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'EQ: ${getEQCategory()}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'SQ: ${getSQCategory()}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Suggestion for Future Skills:',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                getFutureSkills(),
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
