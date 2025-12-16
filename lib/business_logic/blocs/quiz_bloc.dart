import 'dart:async';

import '../../data/models/question.dart';

class QuizBloc {
  final List<Question> _questions = [
    Question(text: 'Flutter est développé par Google', answer: true),
    Question(text: 'Flutter utilise Java uniquement', answer: false),
    Question(text: 'Provider remplace setState ?', answer: true),
    Question(text: 'BLoC est une librairie UI ?', answer: false),
    Question(text: 'Flutter est cross-platform ?', answer: true),
  ];

  int _index = 0;
  int _score = 0;
  bool _finished = false;

  // GETTERS
  Question? get currentQuestion =>
      _finished ? null : _questions[_index];

  int get score => _score;
  bool get isFinished => _finished;
  int get total => _questions.length;

  // ACTION
  void answer(bool userAnswer) {
    if (_finished) return;

    if (_questions[_index].answer == userAnswer) {
      _score++;
    }

    if (_index < _questions.length - 1) {
      _index++;
    } else {
      _finished = true; // ✅ quiz terminé
    }
  }

  void restart() {
    _index = 0;
    _score = 0;
    _finished = false;
  }
}