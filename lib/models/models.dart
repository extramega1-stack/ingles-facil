import 'package:flutter/material.dart';

/// Tipos de ejercicio interactivo disponibles en el MVP.
enum ExerciseType { multipleChoice, fillBlank, matching, writing, listening }

class VocabItem {
  final String english;
  final String spanish;
  final String example;

  const VocabItem({
    required this.english,
    required this.spanish,
    required this.example,
  });
}

class PhraseItem {
  final String english;
  final String spanish;

  const PhraseItem({required this.english, required this.spanish});
}

class Exercise {
  final ExerciseType type;

  /// Instrucción en español (ej. "Elige la opción correcta").
  final String instruction;

  /// Pregunta o enunciado. En [fillBlank] usa ___ para el espacio.
  final String question;

  /// Para [multipleChoice] y [listening].
  final List<String> options;
  final int correctIndex;

  /// Para [fillBlank] y [writing]: respuestas aceptadas (en minúsculas,
  /// se comparan normalizadas).
  final List<String> acceptedAnswers;

  /// Pista opcional que se muestra en ejercicios de escritura.
  final String hint;

  /// Para [matching]: pares inglés -> español.
  final Map<String, String> pairs;

  /// Para [listening]: texto que se reproduce con TTS.
  final String audioText;

  /// Explicación en español que se muestra tras responder.
  final String explanation;

  const Exercise({
    required this.type,
    required this.instruction,
    this.question = '',
    this.options = const [],
    this.correctIndex = 0,
    this.acceptedAnswers = const [],
    this.hint = '',
    this.pairs = const {},
    this.audioText = '',
    this.explanation = '',
  });
}

class Lesson {
  final String id;
  final String title;
  final String subtitle;
  final String grammarTitle;
  final String grammarBody;
  final List<VocabItem> vocab;
  final List<PhraseItem> phrases;
  final List<Exercise> exercises;

  const Lesson({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.grammarTitle,
    required this.grammarBody,
    required this.vocab,
    required this.phrases,
    required this.exercises,
  });
}

class Level {
  final String id;
  final int number;
  final String name;
  final String description;
  final String emoji;
  final int colorValue;
  final List<Lesson> lessons;

  const Level({
    required this.id,
    required this.number,
    required this.name,
    required this.description,
    required this.emoji,
    required this.colorValue,
    required this.lessons,
  });

  Color get color => Color(colorValue);
}
