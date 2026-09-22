import 'package:flutter/material.dart';
import '../models/models.dart';
import '../services/progress_service.dart';
import '../widgets/widgets.dart';
import 'exercise_screen.dart';

class LessonScreen extends StatelessWidget {
  final Lesson lesson;
  final Level level;

  const LessonScreen({super.key, required this.lesson, required this.level});

  @override
  Widget build(BuildContext context) {
    final progress = ProgressService.instance;
    final completed = progress.isLessonCompleted(lesson.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
        backgroundColor: level.color.withValues(alpha: 0.12),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        children: [
          if (completed)
            Card(
              color: Colors.green.withValues(alpha: 0.12),
              child: ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.green),
                title: const Text('Lección completada'),
                subtitle: Text(
                  'Tu mejor puntaje: ${progress.bestScore(lesson.id)}%. ¡Puedes repetirla para mejorar!',
                ),
              ),
            ),
          const SectionTitle('📖 Vocabulario'),
          const Text('Toca 🔊 para escuchar la pronunciación.'),
          const SizedBox(height: 8),
          for (final v in lesson.vocab) _VocabCard(item: v),
          const SectionTitle('💬 Frases útiles'),
          for (final p in lesson.phrases) _PhraseCard(item: p),
          const SectionTitle('📝 Gramática'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.grammarTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    lesson.grammarBody,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            icon: const Icon(Icons.quiz),
            label: Text(
              '¡A practicar! (${lesson.exercises.length} ejercicios)',
            ),
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(54),
              textStyle: const TextStyle(fontSize: 17),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    ExerciseScreen(lesson: lesson, exercises: lesson.exercises),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VocabCard extends StatelessWidget {
  final VocabItem item;
  const _VocabCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(
          item.english,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.spanish,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              item.example,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
        trailing: SpeakButton(text: item.english),
      ),
    );
  }
}

class _PhraseCard extends StatelessWidget {
  final PhraseItem item;
  const _PhraseCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(
          item.english,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(item.spanish),
        trailing: SpeakButton(text: item.english),
      ),
    );
  }
}
