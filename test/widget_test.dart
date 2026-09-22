// Prueba de humo: el currículo carga y la lógica de progreso funciona.
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:ingles_facil/data/curriculum.dart';
import 'package:ingles_facil/services/progress_service.dart';

void main() {
  test('El currículo tiene 4 niveles con 4 lecciones cada uno', () {
    expect(curriculum.length, 4);
    for (final level in curriculum) {
      expect(level.lessons.length, 4);
      for (final lesson in level.lessons) {
        expect(lesson.exercises.length, 5);
        expect(lesson.vocab.isNotEmpty, true);
        expect(lesson.phrases.isNotEmpty, true);
      }
    }
    expect(allLessons.length, 16);
  });

  test('Progreso: completar lecciones desbloquea niveles y suma XP', () async {
    final dir = await Directory.systemTemp.createTemp('hive_test');
    Hive.init(dir.path);
    await ProgressService.instance.init();
    final p = ProgressService.instance;

    expect(p.isLevelUnlocked(0), true);
    expect(p.isLevelUnlocked(1), false);

    for (final lesson in curriculum[0].lessons) {
      p.completeLesson(
        lessonId: lesson.id,
        percent: 100,
        xpEarned: 50,
        answered: 5,
        correct: 5,
      );
    }

    expect(p.isLevelUnlocked(1), true);
    expect(p.xp, 200);
    expect(p.accuracy(), 1.0);

    await p.reset();
    expect(p.xp, 0);
    expect(p.isLevelUnlocked(1), false);
    await Hive.close();
  });
}
