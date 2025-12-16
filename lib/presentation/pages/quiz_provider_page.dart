import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/question.dart';
import '../widgets/quiz_card.dart';

class QuizProvider extends ChangeNotifier {
  final List<Question> _questions = [
    Question(text: 'La France a pour capitale Paris.', answer: true),
    Question(text: '2 + 2 = 5.', answer: false),
    Question(text: 'Flutter utilise Dart.', answer: true),
  ];

  int _index = 0;
  int _score = 0;

  Question get current => _questions[_index];
  int get score => _score;
  bool get isFinished => _index >= _questions.length - 1;

  void answer(bool userAnswer) {
    if (userAnswer == current.answer) {
      _score++;
    }
    if (!isFinished) {
      _index++;
    }
    notifyListeners();
  }

  void restart() {
    _index = 0;
    _score = 0;
    notifyListeners();
  }
}

class QuizProviderPage extends StatelessWidget {
  const QuizProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: const _QuizView(),
    );
  }
}

class _QuizView extends StatelessWidget {
  const _QuizView();

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz – Provider')),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: quiz.isFinished
              ? _Result(score: quiz.score, onRestart: quiz.restart)
              : QuizCard(
            key: ValueKey(quiz.current.text),
            question: quiz.current.text,
            onTrue: () => quiz.answer(true),
            onFalse: () => quiz.answer(false),
          ),
        ),
      ),
    );
  }
}

class _Result extends StatelessWidget {
  final int score;
  final VoidCallback onRestart;

  const _Result({required this.score, required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Score : $score',
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onRestart,
          child: const Text('Recommencer'),
        )
      ],
    );
  }
}
