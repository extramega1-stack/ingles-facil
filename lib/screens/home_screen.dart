import 'package:flutter/material.dart';
import '../data/curriculum.dart';
import '../models/models.dart';
import '../services/progress_service.dart';
import 'level_screen.dart';
import 'stats_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inglés Fácil 🇺🇸'),
        centerTitle: false,
      ),
      body: _tab == 0 ? const _LevelsTab() : const StatsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tab,
        onTap: (i) => setState(() => _tab = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Aprender'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Mi progreso',
          ),
        ],
      ),
    );
  }
}

class _LevelsTab extends StatelessWidget {
  const _LevelsTab();

  @override
  Widget build(BuildContext context) {
    final progress = ProgressService.instance;
    return ValueListenableBuilder<int>(
      valueListenable: progress.version,
      builder: (context, _, __) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _HeaderCard(progress: progress),
            const SizedBox(height: 16),
            Text(
              'Tu camino al inglés conversacional',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Completa todas las lecciones de un nivel para desbloquear el siguiente.',
            ),
            const SizedBox(height: 12),
            for (int i = 0; i < curriculum.length; i++)
              _LevelCard(level: curriculum[i], index: i, progress: progress),
          ],
        );
      },
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final ProgressService progress;
  const _HeaderCard({required this.progress});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final done = progress.completedLessons.length;
    final total = progress.totalLessons;
    return Card(
      color: scheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¡Hola! Sigamos aprendiendo 👋',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _Stat(
                  icon: '🔥',
                  value: '${progress.streak}',
                  label: 'días de racha',
                ),
                _Stat(icon: '⭐', value: '${progress.xp}', label: 'puntos XP'),
                _Stat(icon: '📚', value: '$done/$total', label: 'lecciones'),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: total == 0 ? 0 : done / total,
                minHeight: 10,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              done == 0
                  ? 'Empieza con el Nivel 1 👇'
                  : 'Llevas el ${((done / total) * 100).round()}% del curso. ¡Sigue así!',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String icon;
  final String value;
  final String label;
  const _Stat({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(icon, style: const TextStyle(fontSize: 26)),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _LevelCard extends StatelessWidget {
  final Level level;
  final int index;
  final ProgressService progress;

  const _LevelCard({
    required this.level,
    required this.index,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final unlocked = progress.isLevelUnlocked(index);
    final done = progress.levelCompletedCount(level);
    final total = level.lessons.length;
    final pct = total == 0 ? 0.0 : done / total;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: unlocked
            ? () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LevelScreen(level: level, index: index),
                ),
              ).then((_) => progress.version.value++)
            : null,
        child: Opacity(
          opacity: unlocked ? 1 : 0.55,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: level.color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    level.emoji,
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Nivel ${level.number}: ${level.name}',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Icon(
                            unlocked
                                ? (done == total
                                      ? Icons.check_circle
                                      : Icons.play_circle_fill)
                                : Icons.lock,
                            color: unlocked
                                ? (done == total ? Colors.green : level.color)
                                : Colors.grey,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        level.description,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: pct,
                          minHeight: 8,
                          backgroundColor: level.color.withValues(alpha: 0.15),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            level.color,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        unlocked
                            ? '$done de $total lecciones completadas'
                            : 'Completa el nivel anterior para desbloquearlo',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
