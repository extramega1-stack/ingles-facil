import '../models/models.dart';

/// Nivel 1 — Principiante. Lo esencial para empezar de cero.
const level1 = Level(
  id: 'nivel_1',
  number: 1,
  name: 'Principiante',
  description: 'Saludos, números, el verbo "to be" y tus primeras preguntas.',
  emoji: '👋',
  colorValue: 0xFF2E9E5B,
  lessons: [
    Lesson(
      id: 'n1l1',
      title: 'Saludos y presentaciones',
      subtitle: 'Di hola y preséntate en inglés',
      grammarTitle: 'Presentarse: "My name is..."',
      grammarBody:
          'Para decir tu nombre en inglés usa:\n• My name is + tu nombre → My name is Ana.\n• I am + tu nombre → I am Ana.\n\n"Hello" es el saludo general, "Good morning" se usa hasta el mediodía y "Good night" solo al despedirse de noche.',
      vocab: [
        VocabItem(english: 'hello', spanish: 'hola', example: 'Hello, Ana!'),
        VocabItem(
          english: 'goodbye',
          spanish: 'adiós',
          example: 'Goodbye, see you tomorrow.',
        ),
        VocabItem(
          english: 'morning',
          spanish: 'mañana',
          example: 'Good morning!',
        ),
        VocabItem(english: 'night', spanish: 'noche', example: 'Good night!'),
        VocabItem(
          english: 'please',
          spanish: 'por favor',
          example: 'A coffee, please.',
        ),
        VocabItem(
          english: 'thanks',
          spanish: 'gracias',
          example: 'Thanks for your help.',
        ),
        VocabItem(english: 'yes', spanish: 'sí', example: 'Yes, I understand.'),
        VocabItem(english: 'no', spanish: 'no', example: 'No, thank you.'),
        VocabItem(
          english: 'sorry',
          spanish: 'perdón',
          example: "Sorry, I'm late.",
        ),
        VocabItem(
          english: 'name',
          spanish: 'nombre',
          example: 'My name is Luis.',
        ),
      ],
      phrases: [
        PhraseItem(
          english: 'Hello! My name is Ana.',
          spanish: '¡Hola! Me llamo Ana.',
        ),
        PhraseItem(english: 'Nice to meet you.', spanish: 'Mucho gusto.'),
        PhraseItem(english: 'How are you?', spanish: '¿Cómo estás?'),
        PhraseItem(
          english: "I'm fine, thanks.",
          spanish: 'Estoy bien, gracias.',
        ),
        PhraseItem(english: 'See you later!', spanish: '¡Nos vemos luego!'),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la traducción correcta.',
          question: '¿Cómo se dice "hola" en inglés?',
          options: ['Hello', 'Goodbye', 'Thanks', 'Night'],
          correctIndex: 0,
          explanation: 'Hello = hola. Es el saludo más usado.',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa la frase en inglés.',
          question: '___ morning! (¡Buenos días!)',
          acceptedAnswers: ['good'],
          hint: 'Empieza con G.',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada palabra con su traducción.',
          pairs: {
            'hello': 'hola',
            'thanks': 'gracias',
            'night': 'noche',
            'please': 'por favor',
            'goodbye': 'adiós',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: 'Me llamo Ana.',
          acceptedAnswers: ['my name is ana', 'i am ana', "i'm ana"],
          hint: 'My name is...',
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: 'Nice to meet you.',
          options: [
            'Nice to meet you.',
            'See you later.',
            'Good night.',
            'How are you?',
          ],
          correctIndex: 0,
        ),
      ],
    ),
    Lesson(
      id: 'n1l2',
      title: 'Los números del 1 al 10',
      subtitle: 'Cuenta, da tu edad y tu teléfono',
      grammarTitle: 'Los números y la edad',
      grammarBody:
          '1 one, 2 two, 3 three, 4 four, 5 five, 6 six, 7 seven, 8 eight, 9 nine, 10 ten.\n\nPara la edad en inglés NO se usa "tener": se dice "I am 25 years old" (literalmente "soy de 25 años").',
      vocab: [
        VocabItem(
          english: 'one',
          spanish: 'uno',
          example: 'One coffee, please.',
        ),
        VocabItem(
          english: 'two',
          spanish: 'dos',
          example: 'I have two brothers.',
        ),
        VocabItem(english: 'three', spanish: 'tres', example: 'Three apples.'),
        VocabItem(english: 'four', spanish: 'cuatro', example: 'Four chairs.'),
        VocabItem(english: 'five', spanish: 'cinco', example: 'Five minutes.'),
        VocabItem(english: 'six', spanish: 'seis', example: 'Six friends.'),
        VocabItem(english: 'seven', spanish: 'siete', example: 'Seven days.'),
        VocabItem(english: 'eight', spanish: 'ocho', example: 'Eight hours.'),
        VocabItem(english: 'nine', spanish: 'nueve', example: 'Nine cats.'),
        VocabItem(english: 'ten', spanish: 'diez', example: 'Ten fingers.'),
      ],
      phrases: [
        PhraseItem(
          english: 'My phone number is 555-1234.',
          spanish: 'Mi número de teléfono es 555-1234.',
        ),
        PhraseItem(english: 'I am 25 years old.', spanish: 'Tengo 25 años.'),
        PhraseItem(
          english: 'How old are you?',
          spanish: '¿Cuántos años tienes?',
        ),
        PhraseItem(
          english: 'One ticket, please.',
          spanish: 'Un boleto, por favor.',
        ),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la traducción correcta.',
          question: '¿Cómo se dice "cinco" en inglés?',
          options: ['Five', 'Four', 'Six', 'Nine'],
          correctIndex: 0,
          explanation: 'Five = cinco.',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa la frase en inglés.',
          question: 'I am ___ years old. (Tengo 7 años.)',
          acceptedAnswers: ['seven'],
          hint: 'El número 7.',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada número con su traducción.',
          pairs: {
            'one': 'uno',
            'two': 'dos',
            'three': 'tres',
            'four': 'cuatro',
            'five': 'cinco',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: 'Tengo 30 años.',
          acceptedAnswers: ['i am 30 years old'],
          hint: 'I am ___ years old.',
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: 'Eight.',
          options: ['Eight', 'Seven', 'Nine', 'Ten'],
          correctIndex: 0,
        ),
      ],
    ),
    Lesson(
      id: 'n1l3',
      title: 'El verbo "to be"',
      subtitle: 'Soy, eres, es... el verbo más importante',
      grammarTitle: 'To be: am / is / are',
      grammarBody:
          'El verbo "to be" significa ser o estar.\n• I → am → I am happy. (Estoy feliz.)\n• he, she, it → is → She is a doctor. (Ella es doctora.)\n• you, we, they → are → They are friends. (Son amigos.)\n\nPara preguntas se invierte el orden: Are you ready? (¿Estás listo?)',
      vocab: [
        VocabItem(english: 'I', spanish: 'yo', example: 'I am happy.'),
        VocabItem(
          english: 'you',
          spanish: 'tú / ustedes',
          example: 'You are kind.',
        ),
        VocabItem(english: 'he', spanish: 'él', example: 'He is a doctor.'),
        VocabItem(
          english: 'she',
          spanish: 'ella',
          example: 'She is my friend.',
        ),
        VocabItem(
          english: 'we',
          spanish: 'nosotros',
          example: 'We are students.',
        ),
        VocabItem(
          english: 'they',
          spanish: 'ellos',
          example: 'They are brothers.',
        ),
        VocabItem(
          english: 'am',
          spanish: '(yo) soy / estoy',
          example: 'I am from Mexico.',
        ),
        VocabItem(
          english: 'is',
          spanish: 'es / está',
          example: 'She is a teacher.',
        ),
        VocabItem(
          english: 'are',
          spanish: 'son / están',
          example: 'You are ready.',
        ),
      ],
      phrases: [
        PhraseItem(english: 'I am from Mexico.', spanish: 'Soy de México.'),
        PhraseItem(english: 'She is a teacher.', spanish: 'Ella es maestra.'),
        PhraseItem(english: 'Are you ready?', spanish: '¿Estás listo?'),
        PhraseItem(english: 'We are friends.', spanish: 'Somos amigos.'),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question: 'She ___ a teacher. (Ella es maestra.)',
          options: ['is', 'am', 'are', 'be'],
          correctIndex: 0,
          explanation: 'Con she siempre va "is".',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa con am, is o are.',
          question: 'They ___ my friends. (Ellos son mis amigos.)',
          acceptedAnswers: ['are'],
          hint: 'They va con...',
        ),
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question: '___ you from Brazil? (¿Eres de Brasil?)',
          options: ['Are', 'Is', 'Am', 'Be'],
          correctIndex: 0,
          explanation: 'Con you siempre va "are".',
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: 'Yo estoy feliz.',
          acceptedAnswers: ['i am happy'],
          hint: 'I ___ happy.',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada pronombre con su forma de "to be".',
          pairs: {
            'I': 'am',
            'he': 'is',
            'she': 'is',
            'they': 'are',
            'we': 'are',
          },
        ),
      ],
    ),
    Lesson(
      id: 'n1l4',
      title: 'Tus primeras preguntas',
      subtitle: 'What, where, who... pregunta lo básico',
      grammarTitle: 'Preguntas con WH-',
      grammarBody:
          'Las preguntas más comunes empiezan con:\n• What? = ¿Qué? / ¿Cuál?\n• Where? = ¿Dónde?\n• Who? = ¿Quién?\n• When? = ¿Cuándo?\n• Why? = ¿Por qué?\n• How? = ¿Cómo?\n\nFíjate en el orden: Where are you from? (¿De dónde eres?)',
      vocab: [
        VocabItem(
          english: 'what',
          spanish: 'qué / cuál',
          example: "What's your name?",
        ),
        VocabItem(
          english: 'where',
          spanish: 'dónde',
          example: 'Where are you from?',
        ),
        VocabItem(english: 'who', spanish: 'quién', example: 'Who is she?'),
        VocabItem(
          english: 'when',
          spanish: 'cuándo',
          example: 'When is the party?',
        ),
        VocabItem(
          english: 'why',
          spanish: 'por qué',
          example: 'Why are you late?',
        ),
        VocabItem(english: 'how', spanish: 'cómo', example: 'How are you?'),
        VocabItem(
          english: 'your',
          spanish: 'tu / su',
          example: 'What is your name?',
        ),
        VocabItem(english: 'from', spanish: 'de', example: 'I am from Peru.'),
      ],
      phrases: [
        PhraseItem(english: "What's your name?", spanish: '¿Cómo te llamas?'),
        PhraseItem(english: 'Where are you from?', spanish: '¿De dónde eres?'),
        PhraseItem(
          english: 'How old are you?',
          spanish: '¿Cuántos años tienes?',
        ),
        PhraseItem(english: 'Where do you live?', spanish: '¿Dónde vives?'),
      ],
      exercises: [
        Exercise(
          type: ExerciseType.multipleChoice,
          instruction: 'Elige la opción correcta.',
          question: '___ are you from? (¿De dónde eres?)',
          options: ['Where', 'What', 'Who', 'When'],
          correctIndex: 0,
          explanation: 'Where = dónde. Where are you from? = ¿De dónde eres?',
        ),
        Exercise(
          type: ExerciseType.fillBlank,
          instruction: 'Completa la pregunta.',
          question: '___ is your name? (¿Cómo te llamas?)',
          acceptedAnswers: ['what'],
          hint: 'What...',
        ),
        Exercise(
          type: ExerciseType.matching,
          instruction: 'Empareja cada palabra interrogativa con su traducción.',
          pairs: {
            'what': 'qué',
            'where': 'dónde',
            'who': 'quién',
            'when': 'cuándo',
            'how': 'cómo',
          },
        ),
        Exercise(
          type: ExerciseType.writing,
          instruction: 'Escribe en inglés:',
          question: '¿Dónde vives?',
          acceptedAnswers: ['where do you live'],
          hint: 'Where do you...',
        ),
        Exercise(
          type: ExerciseType.listening,
          instruction: 'Escucha con atención y elige lo que oyes.',
          audioText: 'Where are you from?',
          options: [
            'Where are you from?',
            'What is your name?',
            'How old are you?',
            'Who are you?',
          ],
          correctIndex: 0,
        ),
      ],
    ),
  ],
);
