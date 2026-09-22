import 'package:flutter/material.dart';
import '../services/tts_service.dart';

/// Botón de altavoz que pronuncia un texto en inglés.
class SpeakButton extends StatelessWidget {
  final String text;
  final double size;

  const SpeakButton({super.key, required this.text, this.size = 22});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Escuchar',
      icon: Icon(Icons.volume_up, size: size),
      color: Theme.of(context).colorScheme.primary,
      onPressed: () => TtsService.instance.speak(text),
    );
  }
}

/// Título de sección dentro de la lección.
class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 20, 4, 8),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

/// Chip de estado de lección (completada / por hacer).
class LessonStatusChip extends StatelessWidget {
  final bool completed;
  final int bestScore;

  const LessonStatusChip({
    super.key,
    required this.completed,
    required this.bestScore,
  });

  @override
  Widget build(BuildContext context) {
    if (!completed) return const SizedBox.shrink();
    final color = bestScore >= 80
        ? Colors.green
        : (bestScore >= 50 ? Colors.orange : Colors.red);
    return Chip(
      label: Text(
        '$bestScore%',
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: color,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
    );
  }
}
