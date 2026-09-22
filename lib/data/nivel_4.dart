import '../models/models.dart';

/// Nivel 4 — Conversacional. Opina, narra, invita y resuelve problemas.
const level4 = Level(
  id: 'nivel_4',
  number: 4,
  name: 'Conversacional',
  description: 'Opiniones, historias, invitaciones y pedir ayuda.',
  emoji: '💬',
  colorValue: 0xFF8E44AD,
  lessons: [
    Lesson(
      id: 'n4l1',
      title: 'Small talk y opiniones',
      subtitle: 'Da tu opinión como un nativo',
      grammarTitle: 'Dar tu opinión',
      grammarBody:
          'Para sonar conversacional:\n• In my opinion... / I think... (En mi opinión... / Creo que...)\n• I agree. / I don\'t agree. (Estoy de acuerdo. / No estoy de acuerdo.)\n• What do you think? (¿Tú qué opinas?) — ¡preguntar también es conversar!',
      vocab: [
        VocabItem(
          english: 'think',
          spanish: 'pensar / creer',
          example: 'I think so.',
        ),
        VocabItem(
          english: 'believe',
          spanish: 'creer',
          example: 'I believe you.',
        ),
        VocabItem(
          english: 'agree',
          spanish: 'estar de acuerdo',
          example: 'I agree with you.',
        ),
        VocabItem(
          english: 'interesting',
          spanish: 'interesante',
          example: 'An interesting book.',
        ),
        VocabItem(
          english: 'boring',
          spanish: 'aburrido',
          example: 'The movie was boring.',
        ),
        VocabItem(
          english: 'enjoy',
          spanish: 'disfrutar',
          example: 'I enjoy traveling.',
        ),
      ],
      phrases: [
        PhraseItem(
          english: "In my opinion, it's great.",
          spanish: 'En mi opinión, es genial.',
        ),
        PhraseItem(
          english: 'I agree with you.',
          spanish: 'Estoy de acuerdo contigo.',
        ),
        PhraseItem(english: 'What do you think?', spanish: '¿Qué opinas?'),
        PhraseItem(english: 'I enjoy traveling.', spanish: 'Disfruto viajar.'),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question: '___ my opinion, the movie was great. (En mi opinión...)',
          options: ['In', 'On', 'At', 'Of'],
          correctIndex: 0,
          explanation: 'La expresión fija es "In my opinion".',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa la frase.',
          question: 'I ___ with you. (Estoy de acuerdo contigo.)',
          acceptedAnswers: ['agree'],
          hint: 'agree = estar de acuerdo.',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada palabra con su traducción.',
          pairs: {
            'think': 'pensar',
            'believe': 'creer',
            'agree': 'estar de acuerdo',
            'interesting': 'interesante',
            'enjoy': 'disfrutar',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: '¿Qué opinas?',
          acceptedAnswers: ['what do you think'],
          hint: 'What do you...',
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: 'I agree with you.',
          options: [
            'I agree with you.',
            'I think about you.',
            'I believe in you.',
            'I enjoy with you.',
          ],
          correctIndex: 0,
        ),
      ],
    ),
    Lesson(
      id: 'n4l2',
      title: 'Contar historias',
      subtitle: 'Narra con conectores y pasado continuo',
      grammarTitle: 'Conectores + pasado continuo',
      grammarBody:
          'Para contar historias:\n• Conectores: suddenly (de repente), then (entonces), after that (después), finally (finalmente).\n• Pasado continuo (acción en curso): was/were + verbo-ing → I was walking (iba caminando).\n• Combínalos: I was walking home when suddenly it started to rain.',
      vocab: [
        VocabItem(
          english: 'suddenly',
          spanish: 'de repente',
          example: 'Suddenly, it rained.',
        ),
        VocabItem(
          english: 'then',
          spanish: 'entonces',
          example: 'Then we laughed.',
        ),
        VocabItem(
          english: 'after',
          spanish: 'después',
          example: 'After dinner we talked.',
        ),
        VocabItem(
          english: 'finally',
          spanish: 'finalmente',
          example: 'Finally, we arrived.',
        ),
        VocabItem(
          english: 'while',
          spanish: 'mientras',
          example: 'While I was cooking...',
        ),
        VocabItem(
          english: 'story',
          spanish: 'historia',
          example: 'Tell me a story.',
        ),
        VocabItem(
          english: 'happened',
          spanish: 'pasó / ocurrió',
          example: 'What happened?',
        ),
        VocabItem(
          english: 'laughed',
          spanish: 'rió',
          example: 'We laughed a lot.',
        ),
      ],
      phrases: [
        PhraseItem(
          english: 'Suddenly, it started to rain.',
          spanish: 'De repente, empezó a llover.',
        ),
        PhraseItem(
          english: 'I was walking home when...',
          spanish: 'Iba caminando a casa cuando...',
        ),
        PhraseItem(
          english: 'And then, finally...',
          spanish: 'Y entonces, finalmente...',
        ),
        PhraseItem(
          english: "You won't believe what happened!",
          spanish: '¡No vas a creer lo que pasó!',
        ),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question: 'I ___ walking home when it rained. (Iba caminando...)',
          options: ['was', 'am', 'is', 'are'],
          correctIndex: 0,
          explanation: 'Pasado continuo con I: was + verbo-ing.',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa la frase.',
          question: '___, it started to rain. (De repente, empezó a llover.)',
          acceptedAnswers: ['suddenly'],
          hint: 'Empieza con s.',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada conector con su traducción.',
          pairs: {
            'suddenly': 'de repente',
            'then': 'entonces',
            'finally': 'finalmente',
            'while': 'mientras',
            'story': 'historia',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: 'De repente empezó a llover.',
          acceptedAnswers: ['suddenly it started to rain'],
          hint: 'Suddenly it started to...',
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: 'Suddenly, it started to rain.',
          options: [
            'Suddenly, it started to rain.',
            'Finally, it stopped raining.',
            'Then, we went home.',
            'While it was sunny.',
          ],
          correctIndex: 0,
        ),
      ],
    ),
    Lesson(
      id: 'n4l3',
      title: 'Planes e invitaciones',
      subtitle: 'Invita, acepta o rechaza con educación',
      grammarTitle: 'Invitar y responder',
      grammarBody:
          'Para invitar:\n• Would you like to come? (¿Te gustaría venir?)\n• Are you free on Saturday? (¿Estás libre el sábado?)\nPara aceptar: I\'d love to! / Sure!\nPara rechazar con educación: Sorry, I can\'t. Maybe next time.',
      vocab: [
        VocabItem(
          english: 'invite',
          spanish: 'invitar',
          example: 'I want to invite you.',
        ),
        VocabItem(
          english: 'party',
          spanish: 'fiesta',
          example: 'A birthday party.',
        ),
        VocabItem(
          english: 'weekend',
          spanish: 'fin de semana',
          example: 'This weekend?',
        ),
        VocabItem(english: 'join', spanish: 'unirse', example: 'Join us!'),
        VocabItem(
          english: 'would love',
          spanish: 'me encantaría',
          example: "I'd love to!",
        ),
        VocabItem(
          english: 'free',
          spanish: 'libre (tiempo)',
          example: 'Are you free?',
        ),
      ],
      phrases: [
        PhraseItem(
          english: 'Would you like to come?',
          spanish: '¿Te gustaría venir?',
        ),
        PhraseItem(
          english: 'What are you doing on Saturday?',
          spanish: '¿Qué haces el sábado?',
        ),
        PhraseItem(english: "I'd love to!", spanish: '¡Me encantaría!'),
        PhraseItem(
          english: "Sorry, I can't. Maybe next time.",
          spanish: 'Perdón, no puedo. Quizá la próxima.',
        ),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question: '___ you like to come to the party? (¿Te gustaría venir?)',
          options: ['Would', 'Will you to', 'Do', 'Are'],
          correctIndex: 0,
          explanation: '"Would you like to...?" es la invitación educada.',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa la frase.',
          question: "I'd ___ to! (¡Me encantaría!)",
          acceptedAnswers: ['love'],
          hint: "I'd ___ to!",
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada palabra con su traducción.',
          pairs: {
            'invite': 'invitar',
            'party': 'fiesta',
            'weekend': 'fin de semana',
            'join': 'unirse',
            'free': 'libre',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: '¿Qué haces el sábado?',
          acceptedAnswers: ['what are you doing on saturday'],
          hint: 'What are you doing on...',
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: 'Would you like to come?',
          options: [
            'Would you like to come?',
            'What would you like?',
            'Would you like coffee?',
            'Do you want to go?',
          ],
          correctIndex: 0,
        ),
      ],
    ),
    Lesson(
      id: 'n4l4',
      title: 'Pedir ayuda',
      subtitle: 'Resuelve problemas en inglés',
      grammarTitle: 'Pedir ayuda sin pena',
      grammarBody:
          'Frases que te salvan en cualquier apuro:\n• Can you help me, please? (¿Me ayudas, por favor?)\n• I need help with... (Necesito ayuda con...)\n• I don\'t understand. (No entiendo.)\n• Thank you so much! (¡Muchísimas gracias!)',
      vocab: [
        VocabItem(
          english: 'help',
          spanish: 'ayuda',
          example: 'Can you help me?',
        ),
        VocabItem(
          english: 'problem',
          spanish: 'problema',
          example: 'I have a problem.',
        ),
        VocabItem(
          english: 'wrong',
          spanish: 'mal',
          example: 'Something is wrong.',
        ),
        VocabItem(
          english: 'fix',
          spanish: 'arreglar',
          example: 'Can you fix it?',
        ),
        VocabItem(
          english: 'need',
          spanish: 'necesitar',
          example: 'I need help.',
        ),
        VocabItem(english: 'lost', spanish: 'perdido', example: "I'm lost."),
        VocabItem(english: 'broken', spanish: 'roto', example: "It's broken."),
        VocabItem(
          english: 'urgent',
          spanish: 'urgente',
          example: "It's urgent!",
        ),
      ],
      phrases: [
        PhraseItem(
          english: 'Can you help me, please?',
          spanish: '¿Me puedes ayudar, por favor?',
        ),
        PhraseItem(
          english: 'I have a problem with my phone.',
          spanish: 'Tengo un problema con mi teléfono.',
        ),
        PhraseItem(english: 'Something is wrong.', spanish: 'Algo anda mal.'),
        PhraseItem(english: 'Thank you so much!', spanish: '¡Muchas gracias!'),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question: 'Can you ___ me, please? (¿Me puedes ayudar?)',
          options: ['help', 'helps', 'helping', 'helped'],
          correctIndex: 0,
          explanation: 'Después de "Can you" va el verbo base: help.',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa la frase.',
          question:
              'I have a ___ with my phone. (Tengo un problema con mi teléfono.)',
          acceptedAnswers: ['problem'],
          hint: 'problem = problema.',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada palabra con su traducción.',
          pairs: {
            'help': 'ayuda',
            'problem': 'problema',
            'fix': 'arreglar',
            'need': 'necesitar',
            'broken': 'roto',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: '¿Me puedes ayudar, por favor?',
          acceptedAnswers: ['can you help me please'],
          hint: 'Can you help me...',
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: 'Can you help me, please?',
          options: [
            'Can you help me, please?',
            'Can you hear me, please?',
            'Can you call me, please?',
            'Can you see me, please?',
          ],
          correctIndex: 0,
        ),
      ],
    ),
  ],
);
