abstract class QuizEvent {}

class AnswerEvent extends QuizEvent {
  final bool answer;
  AnswerEvent(this.answer);
}

class RestartEvent extends QuizEvent {}
