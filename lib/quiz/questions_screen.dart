import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text(currentQuestion.text),
            const SizedBox(height: 30),
            // ...currentQuestion.shuffedAnswers
          ],
        ),
      ),
    );
  }
}
