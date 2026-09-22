import '../models/models.dart';
import 'nivel_1.dart';
import 'nivel_2.dart';
import 'nivel_3.dart';
import 'nivel_4.dart';

/// Plan de estudios completo del MVP: 4 niveles x 4 lecciones.
const List<Level> curriculum = [level1, level2, level3, level4];

/// Todas las lecciones en orden, útil para "siguiente lección".
List<Lesson> get allLessons =>
    curriculum.expand((level) => level.lessons).toList();

Lesson? nextLesson(String lessonId) {
  final lessons = allLessons;
  final i = lessons.indexWhere((l) => l.id == lessonId);
  if (i >= 0 && i < lessons.length - 1) return lessons[i + 1];
  return null;
}

Level? levelOfLesson(String lessonId) {
  for (final level in curriculum) {
    if (level.lessons.any((l) => l.id == lessonId)) return level;
  }
  return null;
}
