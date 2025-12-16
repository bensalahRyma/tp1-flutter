import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  final String question;
  final VoidCallback onTrue;
  final VoidCallback onFalse;

  const QuizCard({
    super.key,
    required this.question,
    required this.onTrue,
    required this.onFalse,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(question,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: onTrue,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('VRAI')),
                ElevatedButton(
                    onPressed: onFalse,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('FAUX')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
