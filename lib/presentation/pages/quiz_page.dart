import 'package:flutter/material.dart';

import '../../business_logic/blocs/quiz_bloc.dart';
import '../widgets/quiz_card.dart';

class QuizBlocPage extends StatefulWidget {
  const QuizBlocPage({super.key});

  @override
  State<QuizBlocPage> createState() => _QuizBlocPageState();
}

class _QuizBlocPageState extends State<QuizBlocPage>
    with SingleTickerProviderStateMixin {

  final QuizBloc bloc = QuizBloc();
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  void _answer(bool value) {
    setState(() {
      bloc.answer(value);
      _controller.reset();
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz BLoC')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: bloc.isFinished
            ? _buildResult()
            : FadeTransition(
          opacity: _fade,
          child: _buildQuestion(),
        ),
      ),
    );
  }

  Widget _buildQuestion() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          bloc.currentQuestion!.text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => _answer(true),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('VRAI'),
            ),
            ElevatedButton(
              onPressed: () => _answer(false),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('FAUX'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildResult() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Quiz terminé 🎉',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          'Score : ${bloc.score} / ${bloc.total}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            setState(() {
              bloc.restart();
            });
          },
          child: const Text('Recommencer'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}