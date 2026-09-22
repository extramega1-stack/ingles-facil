import 'package:flutter/material.dart';
import '../models/models.dart';
import '../services/progress_service.dart';
import '../widgets/widgets.dart';
import 'lesson_screen.dart';

class LevelScreen extends StatelessWidget {
  final Level level;
  final int index;

  const LevelScreen({super.key, required this.level, required this.index});

  @override
  Widget build(BuildContext context) {
    final progress = ProgressService.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('${level.emoji} Nivel ${level.number}: ${level.name}'),
        backgroundColor: level.color.withValues(alpha: 0.12),
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: progress.version,
        builder: (context, _, __) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                level.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 4),
              Text(
                '${progress.levelCompletedCount(level)} de ${level.lessons.length} lecciones completadas',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              for (int i = 0; i < level.lessons.length; i++)
                _LessonTile(
                  lesson: level.lessons[i],
                  number: i + 1,
                  level: level,
                ),
            ],
          );
        },
      ),
    );
  }
}

class _LessonTile extends StatelessWidget {
  final Lesson lesson;
  final int number;
  final Level level;

  const _LessonTile({
    required this.lesson,
    required this.number,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    final progress = ProgressService.instance;
    final completed = progress.isLessonCompleted(lesson.id);
    final best = progress.bestScore(lesson.id);

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: completed
              ? Colors.green.withValues(alpha: 0.15)
              : level.color.withValues(alpha: 0.15),
          child: completed
              ? const Icon(Icons.check, color: Colors.green)
              : Text(
                  '$number',
                  style: TextStyle(
                    color: level.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        title: Text(
          lesson.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(lesson.subtitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LessonStatusChip(completed: completed, bestScore: best),
            const SizedBox(width: 4),
            Text(
              '${lesson.exercises.length} ejercicios',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LessonScreen(lesson: lesson, level: level),
          ),
        ),
      ),
    );
  }
}
