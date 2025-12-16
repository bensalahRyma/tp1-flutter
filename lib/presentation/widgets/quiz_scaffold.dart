import 'package:flutter/material.dart';

class QuizScaffold extends StatelessWidget {
  final String question;
  final VoidCallback onTrue;
  final VoidCallback onFalse;
  final int index;
  final int total;

  const QuizScaffold({
    super.key,
    required this.question,
    required this.onTrue,
    required this.onFalse,
    required this.index,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz (${index + 1}/$total)'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Animation simple
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) =>
                  FadeTransition(opacity: animation, child: child),
              child: Text(
                question,
                key: ValueKey(question),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                  ),
                  onPressed: onTrue,
                  icon: const Icon(Icons.check),
                  label: const Text('VRAI'),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 14),
                  ),
                  onPressed: onFalse,
                  icon: const Icon(Icons.close),
                  label: const Text('FAUX'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
