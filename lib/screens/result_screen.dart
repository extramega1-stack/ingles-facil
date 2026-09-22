import 'package:flutter/material.dart';
import '../data/curriculum.dart';
import '../models/models.dart';
import 'exercise_screen.dart';
import 'lesson_screen.dart';

class ResultScreen extends StatelessWidget {
  final Lesson lesson;
  final int percent;
  final int correct;
  final int total;
  final int xp;

  const ResultScreen({
    super.key,
    required this.lesson,
    required this.percent,
    required this.correct,
    required this.total,
    required this.xp,
  });

  int get _stars =>
      percent >= 90 ? 3 : (percent >= 70 ? 2 : (percent >= 40 ? 1 : 0));

  String get _message {
    if (percent == 100) return '¡Perfecto! Dominaste la lección 🏆';
    if (percent >= 70) return '¡Muy bien! Vas por buen camino 💪';
    if (percent >= 40) return 'Bien, repasa y vuelve a intentarlo 📖';
    return 'No te rindas: repite la lección y lo lograrás 🌱';
  }

  @override
  Widget build(BuildContext context) {
    final next = nextLesson(lesson.id);
    final nextLevel = next != null ? levelOfLesson(next.id) : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Resultados')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Icon(
                    i < _stars ? Icons.star : Icons.star_border,
                    size: 56,
                    color: Colors.amber,
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '$percent%',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '$correct de $total correctas',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              _message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Center(
              child: Chip(
                avatar: const Icon(Icons.bolt, color: Colors.amber),
                label: Text(
                  '+$xp XP',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Spacer(),
            if (next != null && nextLevel != null)
              FilledButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        LessonScreen(lesson: next, level: nextLevel),
                  ),
                ),
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(54),
                ),
                child: Text(
                  'Siguiente: ${next.title} →',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => ExerciseScreen(
                    lesson: lesson,
                    exercises: lesson.exercises,
                  ),
                ),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(54),
              ),
              child: const Text(
                'Repetir lección',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
              child: const Text('Volver al inicio'),
            ),
          ],
        ),
      ),
    );
  }
}
