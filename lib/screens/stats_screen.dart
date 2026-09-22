import 'package:flutter/material.dart';
import '../data/curriculum.dart';
import '../services/progress_service.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = ProgressService.instance;
    return ValueListenableBuilder<int>(
      valueListenable: progress.version,
      builder: (context, _, __) {
        final done = progress.completedLessons.length;
        final total = progress.totalLessons;
        final acc = (progress.accuracy() * 100).round();
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Mi progreso',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.4,
              children: [
                _StatCard(
                  icon: '⭐',
                  value: '${progress.xp}',
                  label: 'Puntos XP',
                ),
                _StatCard(
                  icon: '🔥',
                  value: '${progress.streak}',
                  label: 'Días de racha',
                ),
                _StatCard(
                  icon: '📚',
                  value: '$done/$total',
                  label: 'Lecciones completadas',
                ),
                _StatCard(
                  icon: '🎯',
                  value: '$acc%',
                  label: 'Precisión en ejercicios',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Progreso por nivel',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            for (int i = 0; i < curriculum.length; i++)
              _LevelProgressRow(
                level: curriculum[i],
                index: i,
                progress: progress,
              ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              icon: const Icon(Icons.delete_outline),
              label: const Text('Reiniciar todo mi progreso'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                minimumSize: const Size.fromHeight(48),
              ),
              onPressed: () => _confirmReset(context),
            ),
          ],
        );
      },
    );
  }

  void _confirmReset(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('¿Reiniciar progreso?'),
        content: const Text(
          'Se borrarán tus lecciones completadas, XP y racha. Esta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              ProgressService.instance.reset();
              Navigator.pop(ctx);
            },
            child: const Text('Sí, reiniciar'),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String icon;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(icon, style: const TextStyle(fontSize: 28)),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _LevelProgressRow extends StatelessWidget {
  final dynamic level;
  final int index;
  final ProgressService progress;

  const _LevelProgressRow({
    required this.level,
    required this.index,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final unlocked = progress.isLevelUnlocked(index);
    final pct = progress.levelProgress(level);
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Text(level.emoji, style: const TextStyle(fontSize: 26)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nivel ${level.number}: ${level.name}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: pct,
                      minHeight: 8,
                      valueColor: AlwaysStoppedAnimation<Color>(level.color),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${(pct * 100).round()}%',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 4),
            Icon(
              unlocked ? Icons.lock_open : Icons.lock,
              size: 18,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
