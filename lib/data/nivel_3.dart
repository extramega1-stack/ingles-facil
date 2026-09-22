import '../models/models.dart';

/// Nivel 3 — Intermedio. Pasado, futuro, comparaciones y trabajo.
const level3 = Level(
  id: 'nivel_3',
  number: 3,
  name: 'Intermedio',
  description: 'Pasado simple, futuro, comparaciones y teléfono.',
  emoji: '🚀',
  colorValue: 0xFFE8830C,
  lessons: [
    Lesson(
      id: 'n3l1',
      title: 'Pasado simple',
      subtitle: 'Cuenta lo que hiciste ayer',
      grammarTitle: 'Pasado: regulares e irregulares',
      grammarBody:
          'Para hablar del pasado:\n• Regulares: verbo + ed → worked, played, watched.\n• Irregulares (memorizar): go → went, eat → ate, see → saw, buy → bought.\n• Preguntas y negativos usan "did": Did you go? / I didn\'t go.',
      vocab: [
        VocabItem(
          english: 'went',
          spanish: 'fue / fueron',
          example: 'I went to the park.',
        ),
        VocabItem(english: 'ate', spanish: 'comió', example: 'She ate pizza.'),
        VocabItem(english: 'saw', spanish: 'vio', example: 'We saw a movie.'),
        VocabItem(
          english: 'bought',
          spanish: 'compró',
          example: 'He bought a car.',
        ),
        VocabItem(
          english: 'worked',
          spanish: 'trabajó',
          example: 'I worked late.',
        ),
        VocabItem(
          english: 'played',
          spanish: 'jugó',
          example: 'They played soccer.',
        ),
        VocabItem(
          english: 'watched',
          spanish: 'vio (TV)',
          example: 'We watched the game.',
        ),
        VocabItem(
          english: 'visited',
          spanish: 'visitó',
          example: 'I visited my grandma.',
        ),
      ],
      phrases: [
        PhraseItem(
          english: 'I went to the beach yesterday.',
          spanish: 'Fui a la playa ayer.',
        ),
        PhraseItem(
          english: 'She bought a new car.',
          spanish: 'Ella compró un carro nuevo.',
        ),
        PhraseItem(
          english: 'We watched a movie.',
          spanish: 'Vimos una película.',
        ),
        PhraseItem(english: 'Did you have fun?', spanish: '¿Te divertiste?'),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question: 'I ___ to the park yesterday. (Ayer fui al parque.)',
          options: ['went', 'go', 'goes', 'going'],
          correctIndex: 0,
          explanation: 'El pasado de "go" es "went" (irregular).',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa en pasado.',
          question:
              'She ___ a movie last night. (Ella vio una película anoche.)',
          acceptedAnswers: ['watched'],
          hint: 'watch + ed.',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada verbo con su pasado.',
          pairs: {
            'go': 'went',
            'eat': 'ate',
            'see': 'saw',
            'buy': 'bought',
            'work': 'worked',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: 'Ayer comí pizza.',
          acceptedAnswers: ['yesterday i ate pizza', 'i ate pizza yesterday'],
          hint: 'I ate pizza...',
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: 'I went to the beach.',
          options: [
            'I went to the beach.',
            'I go to the beach.',
            'I will go to the beach.',
            'I am at the beach.',
          ],
          correctIndex: 0,
        ),
      ],
    ),
    Lesson(
      id: 'n3l2',
      title: 'Hablando del futuro',
      subtitle: 'Planes, promesas y "going to"',
      grammarTitle: 'Futuro: will vs going to',
      grammarBody:
          'Dos formas de futuro:\n• will → decisiones del momento o promesas: I will help you.\n• going to → planes ya decididos: I\'m going to travel in June.\n\nEn conversación diaria, "going to" es lo más usado.',
      vocab: [
        VocabItem(
          english: 'will',
          spanish: '(futuro)',
          example: 'I will call you.',
        ),
        VocabItem(
          english: 'going to',
          spanish: 'ir a (hacer algo)',
          example: "I'm going to travel.",
        ),
        VocabItem(
          english: 'tomorrow',
          spanish: 'mañana',
          example: 'See you tomorrow.',
        ),
        VocabItem(
          english: 'next week',
          spanish: 'la próxima semana',
          example: 'Next week I rest.',
        ),
        VocabItem(
          english: 'plan',
          spanish: 'plan',
          example: 'What is your plan?',
        ),
        VocabItem(
          english: 'promise',
          spanish: 'promesa',
          example: 'I promise!',
        ),
        VocabItem(
          english: 'later',
          spanish: 'más tarde',
          example: 'See you later.',
        ),
        VocabItem(
          english: 'soon',
          spanish: 'pronto',
          example: 'It will rain soon.',
        ),
      ],
      phrases: [
        PhraseItem(
          english: 'I will call you tomorrow.',
          spanish: 'Te llamaré mañana.',
        ),
        PhraseItem(
          english: "We're going to travel in June.",
          spanish: 'Vamos a viajar en junio.',
        ),
        PhraseItem(
          english: 'It will rain soon.',
          spanish: 'Va a llover pronto.',
        ),
        PhraseItem(english: 'I promise!', spanish: '¡Lo prometo!'),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question: 'I ___ call you tomorrow. (Te llamaré mañana.)',
          options: ['will', 'am', 'did', 'have'],
          correctIndex: 0,
          explanation: '"will" + verbo = futuro.',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa la frase.',
          question: "We're ___ to travel in June. (Vamos a viajar en junio.)",
          acceptedAnswers: ['going'],
          hint: 'going to = ir a.',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada palabra con su traducción.',
          pairs: {
            'tomorrow': 'mañana',
            'soon': 'pronto',
            'later': 'más tarde',
            'promise': 'promesa',
            'plan': 'plan',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: 'Voy a viajar en junio.',
          acceptedAnswers: [
            'i am going to travel in june',
            "i'm going to travel in june",
          ],
          hint: "I'm going to travel...",
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: 'I will call you tomorrow.',
          options: [
            'I will call you tomorrow.',
            'I called you yesterday.',
            'I call you every day.',
            'I am calling you now.',
          ],
          correctIndex: 0,
        ),
      ],
    ),
    Lesson(
      id: 'n3l3',
      title: 'Comparaciones',
      subtitle: 'Más grande, mejor, más barato...',
      grammarTitle: 'Comparativos: -er / more ... than',
      grammarBody:
          'Para comparar dos cosas:\n• Adjetivos cortos + er: fast → faster, cheap → cheaper.\n• Adjetivos largos: more + adjetivo → more interesting.\n• Irregulares: good → better, bad → worse.\n• Siempre con "than" (= que): bigger than (más grande que).',
      vocab: [
        VocabItem(
          english: 'bigger',
          spanish: 'más grande',
          example: 'My house is bigger.',
        ),
        VocabItem(
          english: 'smaller',
          spanish: 'más pequeño',
          example: 'A smaller car.',
        ),
        VocabItem(
          english: 'better',
          spanish: 'mejor',
          example: 'Coffee is better than tea.',
        ),
        VocabItem(
          english: 'worse',
          spanish: 'peor',
          example: 'Today is worse.',
        ),
        VocabItem(
          english: 'than',
          spanish: 'que (comparando)',
          example: 'Bigger than mine.',
        ),
        VocabItem(english: 'more', spanish: 'más', example: 'More beautiful.'),
        VocabItem(
          english: 'faster',
          spanish: 'más rápido',
          example: 'A faster car.',
        ),
        VocabItem(
          english: 'cheaper',
          spanish: 'más barato',
          example: "It's cheaper here.",
        ),
      ],
      phrases: [
        PhraseItem(
          english: 'This car is faster than that one.',
          spanish: 'Este carro es más rápido que ese.',
        ),
        PhraseItem(
          english: 'My house is bigger.',
          spanish: 'Mi casa es más grande.',
        ),
        PhraseItem(
          english: 'Coffee is better than tea.',
          spanish: 'El café es mejor que el té.',
        ),
        PhraseItem(
          english: "It's cheaper here.",
          spanish: 'Aquí es más barato.',
        ),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question: 'This book is ___ than that one. (más interesante)',
          options: [
            'more interesting',
            'interestinger',
            'most interesting',
            'interested',
          ],
          correctIndex: 0,
          explanation: 'Adjetivos largos usan "more".',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa la comparación.',
          question:
              'My car is faster ___ yours. (Mi carro es más rápido que el tuyo.)',
          acceptedAnswers: ['than'],
          hint: 'than = que (comparando).',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada adjetivo con su comparativo.',
          pairs: {
            'good': 'better',
            'bad': 'worse',
            'fast': 'faster',
            'cheap': 'cheaper',
            'big': 'bigger',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: 'El café es mejor que el té.',
          acceptedAnswers: ['coffee is better than tea'],
          hint: 'Coffee is better...',
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: 'Better than yesterday.',
          options: [
            'Better than yesterday.',
            'Worse than yesterday.',
            'Bigger than yesterday.',
            'Faster than yesterday.',
          ],
          correctIndex: 0,
        ),
      ],
    ),
    Lesson(
      id: 'n3l4',
      title: 'En el trabajo y por teléfono',
      subtitle: 'Llamadas formales sin miedo',
      grammarTitle: 'Frases de teléfono y oficina',
      grammarBody:
          'En llamadas formales usa:\n• Can I speak to...? (¿Puedo hablar con...?)\n• I\'ll call you back. (Te devuelvo la llamada.)\n• He\'s busy right now. (Está ocupado ahora mismo.)',
      vocab: [
        VocabItem(
          english: 'meeting',
          spanish: 'reunión',
          example: "He's in a meeting.",
        ),
        VocabItem(
          english: 'boss',
          spanish: 'jefe',
          example: 'My boss is kind.',
        ),
        VocabItem(
          english: 'email',
          spanish: 'correo electrónico',
          example: 'Send me an email.',
        ),
        VocabItem(
          english: 'call',
          spanish: 'llamada',
          example: "I'll call you back.",
        ),
        VocabItem(
          english: 'office',
          spanish: 'oficina',
          example: 'She works in an office.',
        ),
        VocabItem(
          english: 'busy',
          spanish: 'ocupado',
          example: "He's busy right now.",
        ),
        VocabItem(
          english: 'message',
          spanish: 'mensaje',
          example: 'Leave a message.',
        ),
        VocabItem(
          english: 'appointment',
          spanish: 'cita',
          example: 'I have an appointment.',
        ),
      ],
      phrases: [
        PhraseItem(
          english: 'Can I speak to Ana, please?',
          spanish: '¿Puedo hablar con Ana, por favor?',
        ),
        PhraseItem(
          english: "I'll call you back.",
          spanish: 'Te devuelvo la llamada.',
        ),
        PhraseItem(
          english: "He's in a meeting.",
          spanish: 'Está en una reunión.',
        ),
        PhraseItem(
          english: 'Please send me an email.',
          spanish: 'Por favor envíame un correo.',
        ),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question:
              'Can I ___ to the boss, please? (¿Puedo hablar con el jefe?)',
          options: ['speak', 'speaking', 'spoke', 'speaks'],
          correctIndex: 0,
          explanation: 'Después de "Can I" va el verbo base: speak.',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa la frase.',
          question: "I'll call you ___. (Te devuelvo la llamada.)",
          acceptedAnswers: ['back'],
          hint: 'call you...',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada palabra con su traducción.',
          pairs: {
            'meeting': 'reunión',
            'boss': 'jefe',
            'call': 'llamada',
            'busy': 'ocupado',
            'message': 'mensaje',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: 'Está en una reunión.',
          acceptedAnswers: [
            'he is in a meeting',
            'she is in a meeting',
            "he's in a meeting",
            "she's in a meeting",
          ],
          hint: "He's in a...",
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: "I'll call you back.",
          options: [
            "I'll call you back.",
            "I'll see you soon.",
            "I'll send an email.",
            "I'll wait here.",
          ],
          correctIndex: 0,
        ),
      ],
    ),
  ],
);
