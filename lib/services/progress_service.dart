import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/curriculum.dart';
import '../models/models.dart';

/// Persistencia local con Hive (funciona en web vía IndexedDB).
/// Guarda lecciones completadas, mejores puntajes, XP, racha y precisión.
/// No requiere backend ni cuenta.
class ProgressService {
  static final ProgressService instance = ProgressService._();
  ProgressService._();

  static const _boxName = 'ingles_facil_progreso';
  late final Box _box;

  /// Se incrementa con cada cambio para que la UI se refresque.
  final ValueNotifier<int> version = ValueNotifier(0);

  Future<void> init() async {
    _box = await Hive.openBox(_boxName);
    _updateStreak();
  }

  void _bump() => version.value++;

  // --- Lecturas ------------------------------------------------------------

  List<String> get completedLessons =>
      List<String>.from(_box.get('completedLessons', defaultValue: <String>[]));

  Map<String, int> get bestScores => Map<String, int>.from(
    _box.get('bestScores', defaultValue: <String, int>{}),
  );

  int get xp => _box.get('xp', defaultValue: 0);
  int get streak => _box.get('streak', defaultValue: 0);
  int get totalAnswered => _box.get('totalAnswered', defaultValue: 0);
  int get totalCorrect => _box.get('totalCorrect', defaultValue: 0);

  bool isLessonCompleted(String lessonId) =>
      completedLessons.contains(lessonId);

  int bestScore(String lessonId) => bestScores[lessonId] ?? 0;

  int levelCompletedCount(Level level) =>
      level.lessons.where((l) => isLessonCompleted(l.id)).length;

  double levelProgress(Level level) => level.lessons.isEmpty
      ? 0
      : levelCompletedCount(level) / level.lessons.length;

  /// El nivel 0 siempre está desbloqueado; los demás requieren completar
  /// todas las lecciones del nivel anterior.
  bool isLevelUnlocked(int index) {
    if (index <= 0) return true;
    if (index >= curriculum.length) return false;
    final prev = curriculum[index - 1];
    return prev.lessons.every((l) => isLessonCompleted(l.id));
  }

  double accuracy() => totalAnswered == 0 ? 0 : totalCorrect / totalAnswered;

  int get totalLessons => allLessons.length;

  // --- Escrituras ----------------------------------------------------------

  void completeLesson({
    required String lessonId,
    required int percent,
    required int xpEarned,
    required int answered,
    required int correct,
  }) {
    final completed = completedLessons;
    if (!completed.contains(lessonId)) completed.add(lessonId);
    _box.put('completedLessons', completed);

    if (percent > bestScore(lessonId)) {
      _box.put('bestScores', {...bestScores, lessonId: percent});
    }
    _box.put('xp', xp + xpEarned);
    _box.put('totalAnswered', totalAnswered + answered);
    _box.put('totalCorrect', totalCorrect + correct);
    _updateStreak();
    _bump();
  }

  /// Racha de días consecutivos usando la app.
  void _updateStreak() {
    final now = DateTime.now();
    final today = _dayKey(now);
    final last = _box.get('lastActiveDate', defaultValue: '');
    if (last == today) return;
    final yesterday = _dayKey(now.subtract(const Duration(days: 1)));
    final current = _box.get('streak', defaultValue: 0) as int;
    _box.put('streak', last == yesterday ? current + 1 : 1);
    _box.put('lastActiveDate', today);
  }

  String _dayKey(DateTime d) => '${d.year}-${d.month}-${d.day}';

  Future<void> reset() async {
    await _box.clear();
    _updateStreak();
    _bump();
  }
}
