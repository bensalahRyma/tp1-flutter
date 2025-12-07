import 'package:flutter/material.dart';

class Question {
  final String text;
  final bool isCorrect;

  Question(this.text, this.isCorrect);
}

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  int index = 0;
  int score = 0;
  bool showResult = false;

  final List<Question> questions = [
    Question("La capitale de la France est Paris.", true),
    Question("2 + 2 = 5.", false),
    Question("Le soleil est une étoile.", true),
    Question("La Terre est plate.", false),
  ];

  void answer(bool userAnswer) {
    if (questions[index].isCorrect == userAnswer) {
      score++;
    }

    setState(() {
      if (index < questions.length - 1) {
        index++;
      } else {
        showResult = true;
      }
    });
  }

  void restart() {
    setState(() {
      index = 0;
      score = 0;
      showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quizz"),
        centerTitle: true,
      ),
      body: Center(
        child: showResult
            ? buildResult()
            : buildQuestion(),
      ),
    );
  }

  Widget buildQuestion() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questions[index].text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () => answer(true),
          child: const Text("VRAI"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => answer(false),
          child: const Text("FAUX"),
        ),
      ],
    );
  }

  Widget buildResult() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Score : $score / ${questions.length}",
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: restart,
          child: const Text("Recommencer"),
        ),
      ],
    );
  }
}
