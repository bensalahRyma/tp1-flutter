import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _questions = [
    {'q': 'La France a pour capitale Paris', 'a': true},
    {'q': '2 + 2 = 5', 'a': false},
    {'q': 'Flutter utilise Dart', 'a': true},
  ];

  int _index = 0;
  int _score = 0;

  String get question => _questions[_index]['q'];
  int get index => _index;
  int get total => _questions.length;

  void answer(bool value) {
    if (_questions[_index]['a'] == value) {
      _score++;
    }
    _index = (_index + 1) % _questions.length;
    notifyListeners();
  }
}
