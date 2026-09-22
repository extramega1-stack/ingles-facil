import '../models/models.dart';

/// Nivel 2 — Básico. Rutinas, comida, direcciones y el clima.
const level2 = Level(
  id: 'nivel_2',
  number: 2,
  name: 'Básico',
  description: 'Rutinas diarias, restaurante, direcciones, días y clima.',
  emoji: '🌿',
  colorValue: 0xFF2D7DD2,
  lessons: [
    Lesson(
      id: 'n2l1',
      title: 'Mi rutina diaria',
      subtitle: 'Habla de tu día en presente simple',
      grammarTitle: 'Presente simple: he / she + s',
      grammarBody:
          'Para hábitos y rutinas usa el presente simple.\n• I, you, we, they → el verbo no cambia: I work.\n• he, she, it → el verbo + s: She works.\n\nEjemplos: I eat breakfast. / He eats breakfast.',
      vocab: [
        VocabItem(
          english: 'wake up',
          spanish: 'despertarse',
          example: 'I wake up at 6 AM.',
        ),
        VocabItem(
          english: 'get up',
          spanish: 'levantarse',
          example: 'I get up at 6:30.',
        ),
        VocabItem(
          english: 'eat breakfast',
          spanish: 'desayunar',
          example: 'I eat breakfast at 7.',
        ),
        VocabItem(
          english: 'go to work',
          spanish: 'ir al trabajo',
          example: 'He goes to work by bus.',
        ),
        VocabItem(
          english: 'have lunch',
          spanish: 'almorzar',
          example: 'We have lunch at noon.',
        ),
        VocabItem(
          english: 'come home',
          spanish: 'volver a casa',
          example: 'She comes home at 6 PM.',
        ),
        VocabItem(
          english: 'have dinner',
          spanish: 'cenar',
          example: 'They have dinner at 8.',
        ),
        VocabItem(
          english: 'go to bed',
          spanish: 'acostarse',
          example: 'I go to bed at 10 PM.',
        ),
      ],
      phrases: [
        PhraseItem(
          english: 'I wake up at 6 AM.',
          spanish: 'Me despierto a las 6 AM.',
        ),
        PhraseItem(
          english: 'She works in an office.',
          spanish: 'Ella trabaja en una oficina.',
        ),
        PhraseItem(
          english: 'We have lunch at noon.',
          spanish: 'Almorzamos al mediodía.',
        ),
        PhraseItem(
          english: 'They go to bed at 10 PM.',
          spanish: 'Se acuestan a las 10 PM.',
        ),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question: 'She ___ in an office. (Ella trabaja en una oficina.)',
          options: ['works', 'work', 'working', 'worked'],
          correctIndex: 0,
          explanation: 'Con she el verbo lleva s: she works.',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa la frase.',
          question: 'I ___ up at 6 AM. (Me despierto a las 6.)',
          acceptedAnswers: ['wake'],
          hint: 'wake up = despertarse.',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada rutina con su traducción.',
          pairs: {
            'wake up': 'despertarse',
            'have lunch': 'almorzar',
            'go to bed': 'acostarse',
            'come home': 'volver a casa',
            'have dinner': 'cenar',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: 'Ellos cenan a las 8.',
          acceptedAnswers: [
            'they have dinner at 8',
            'they have dinner at 8 pm',
          ],
          hint: 'They have dinner at...',
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: 'I wake up at six.',
          options: [
            'I wake up at six.',
            'I go to bed at six.',
            'I have lunch at six.',
            'I come home at six.',
          ],
          correctIndex: 0,
        ),
      ],
    ),
    Lesson(
      id: 'n2l2',
      title: 'Comida y restaurante',
      subtitle: 'Pide comida con educación',
      grammarTitle: '"Would like" para pedir con educación',
      grammarBody:
          'En un restaurante evita "I want" (suena brusco). Usa:\n• I would like + algo → I would like a coffee. (Quisiera un café.)\n• También sirve: Can I have + algo? → Can I have the menu? (¿Me pasas el menú?)',
      vocab: [
        VocabItem(
          english: 'water',
          spanish: 'agua',
          example: 'A glass of water, please.',
        ),
        VocabItem(
          english: 'coffee',
          spanish: 'café',
          example: 'I would like a coffee.',
        ),
        VocabItem(
          english: 'bread',
          spanish: 'pan',
          example: 'Bread and butter.',
        ),
        VocabItem(
          english: 'chicken',
          spanish: 'pollo',
          example: 'Chicken with salad.',
        ),
        VocabItem(
          english: 'salad',
          spanish: 'ensalada',
          example: 'A green salad.',
        ),
        VocabItem(
          english: 'fish',
          spanish: 'pescado',
          example: 'Fish and chips.',
        ),
        VocabItem(
          english: 'menu',
          spanish: 'menú',
          example: 'The menu, please.',
        ),
        VocabItem(
          english: 'bill',
          spanish: 'la cuenta',
          example: 'The bill, please.',
        ),
      ],
      phrases: [
        PhraseItem(
          english: 'I would like a coffee.',
          spanish: 'Quisiera un café.',
        ),
        PhraseItem(
          english: 'The menu, please.',
          spanish: 'El menú, por favor.',
        ),
        PhraseItem(
          english: 'The bill, please.',
          spanish: 'La cuenta, por favor.',
        ),
        PhraseItem(english: "It's delicious!", spanish: '¡Está delicioso!'),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question: '___ like a salad. (Quisiera una ensalada.)',
          options: ['I would', 'I am', 'I has', 'I does'],
          correctIndex: 0,
          explanation: '"I would like" es la forma educada de pedir.',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa la frase.',
          question: 'The ___, please. (La cuenta, por favor.)',
          acceptedAnswers: ['bill'],
          hint: 'La cuenta = the...',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada palabra con su traducción.',
          pairs: {
            'water': 'agua',
            'bread': 'pan',
            'chicken': 'pollo',
            'bill': 'la cuenta',
            'menu': 'el menú',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: 'Quisiera un café.',
          acceptedAnswers: ['i would like a coffee'],
          hint: 'I would like...',
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: 'The bill, please.',
          options: [
            'The bill, please.',
            'The menu, please.',
            'A coffee, please.',
            'Some water, please.',
          ],
          correctIndex: 0,
        ),
      ],
    ),
    Lesson(
      id: 'n2l3',
      title: 'Lugares y direcciones',
      subtitle: 'Pregunta dónde queda todo',
      grammarTitle: 'Pedir direcciones',
      grammarBody:
          'La frase mágica es: Where is + lugar?\n• Where is the bank? (¿Dónde está el banco?)\n• Respuestas típicas: Turn left. (Gira a la izquierda.) / Turn right. / Go straight. (Sigue derecho.)',
      vocab: [
        VocabItem(
          english: 'street',
          spanish: 'calle',
          example: 'This is a quiet street.',
        ),
        VocabItem(
          english: 'bank',
          spanish: 'banco',
          example: 'The bank is near here.',
        ),
        VocabItem(
          english: 'hospital',
          spanish: 'hospital',
          example: 'The hospital is far.',
        ),
        VocabItem(
          english: 'pharmacy',
          spanish: 'farmacia',
          example: 'Is there a pharmacy near?',
        ),
        VocabItem(english: 'left', spanish: 'izquierda', example: 'Turn left.'),
        VocabItem(english: 'right', spanish: 'derecha', example: 'Turn right.'),
        VocabItem(
          english: 'near',
          spanish: 'cerca',
          example: "It's near the park.",
        ),
        VocabItem(
          english: 'far',
          spanish: 'lejos',
          example: "It's far from here.",
        ),
      ],
      phrases: [
        PhraseItem(
          english: 'Where is the bank?',
          spanish: '¿Dónde está el banco?',
        ),
        PhraseItem(english: 'Turn left.', spanish: 'Gira a la izquierda.'),
        PhraseItem(english: 'Go straight.', spanish: 'Sigue derecho.'),
        PhraseItem(english: "It's near here.", spanish: 'Está cerca de aquí.'),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question: '___ is the hospital? (¿Dónde está el hospital?)',
          options: ['Where', 'What', 'Who', 'How'],
          correctIndex: 0,
          explanation: 'Para lugares se pregunta con Where.',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa la frase.',
          question: 'Turn ___. (Gira a la derecha.)',
          acceptedAnswers: ['right'],
          hint: 'Lo contrario de left.',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada palabra con su traducción.',
          pairs: {
            'bank': 'banco',
            'hospital': 'hospital',
            'left': 'izquierda',
            'right': 'derecha',
            'street': 'calle',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: '¿Dónde está la farmacia?',
          acceptedAnswers: ['where is the pharmacy'],
          hint: 'Where is the...',
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: 'Turn left.',
          options: ['Turn left.', 'Turn right.', 'Go straight.', 'Stop here.'],
          correctIndex: 0,
        ),
      ],
    ),
    Lesson(
      id: 'n2l4',
      title: 'Días, horas y clima',
      subtitle: 'La hora, la semana y el pronóstico',
      grammarTitle: 'La hora y los días',
      grammarBody:
          'Para la hora: It\'s + número + o\'clock.\n• It\'s 3 o\'clock. (Son las 3.)\n• Con días siempre usa "on": on Monday, on Friday.\n• El clima: It\'s sunny. / It\'s rainy. / It\'s hot.',
      vocab: [
        VocabItem(
          english: 'Monday',
          spanish: 'lunes',
          example: 'See you on Monday.',
        ),
        VocabItem(
          english: 'Tuesday',
          spanish: 'martes',
          example: 'On Tuesday I work.',
        ),
        VocabItem(
          english: 'Wednesday',
          spanish: 'miércoles',
          example: 'Wednesday is busy.',
        ),
        VocabItem(
          english: 'Thursday',
          spanish: 'jueves',
          example: 'See you on Thursday.',
        ),
        VocabItem(
          english: 'Friday',
          spanish: 'viernes',
          example: 'Friday is my favorite day.',
        ),
        VocabItem(
          english: 'today',
          spanish: 'hoy',
          example: "It's sunny today.",
        ),
        VocabItem(
          english: 'sunny',
          spanish: 'soleado',
          example: "It's a sunny day.",
        ),
        VocabItem(
          english: 'rainy',
          spanish: 'lluvioso',
          example: "It's a rainy day.",
        ),
      ],
      phrases: [
        PhraseItem(english: 'What time is it?', spanish: '¿Qué hora es?'),
        PhraseItem(english: "It's 3 o'clock.", spanish: 'Son las 3.'),
        PhraseItem(english: "It's sunny today.", spanish: 'Hoy está soleado.'),
        PhraseItem(
          english: 'See you on Monday!',
          spanish: '¡Nos vemos el lunes!',
        ),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question: "It's ___ today. (Hoy está soleado.)",
          options: ['sunny', 'sun', 'sunning', 'suns'],
          correctIndex: 0,
          explanation: 'El adjetivo es "sunny".',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa la frase.',
          question: 'See you ___ Monday! (¡Nos vemos el lunes!)',
          acceptedAnswers: ['on'],
          hint: 'Con días se usa "on".',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada día con su traducción.',
          pairs: {
            'Monday': 'lunes',
            'Tuesday': 'martes',
            'Wednesday': 'miércoles',
            'Thursday': 'jueves',
            'Friday': 'viernes',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: '¿Qué hora es?',
          acceptedAnswers: ['what time is it'],
          hint: 'What time...',
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: "It's three o'clock.",
          options: [
            "It's three o'clock.",
            "It's four o'clock.",
            "It's two o'clock.",
            "It's five o'clock.",
          ],
          correctIndex: 0,
        ),
      ],
    ),
  ],
);
