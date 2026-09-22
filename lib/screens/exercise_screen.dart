import 'package:flutter/material.dart';
import '../models/models.dart';
import '../services/progress_service.dart';
import '../services/tts_service.dart';
import 'result_screen.dart';

/// Flujo de ejercicios de una lección: una pregunta por pantalla,
/// retroalimentación inmediata y pantalla de resultados al final.
class ExerciseScreen extends StatefulWidget {
  final Lesson lesson;
  final List<Exercise> exercises;

  const ExerciseScreen({
    super.key,
    required this.lesson,
    required this.exercises,
  });

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int _index = 0;
  int _correct = 0;
  bool _answered = false;

  void _onAnswered(bool correct) {
    if (_answered) return;
    setState(() {
      _answered = true;
      if (correct) _correct++;
    });
  }

  void _next() {
    if (_index < widget.exercises.length - 1) {
      setState(() {
        _index++;
        _answered = false;
      });
    } else {
      _finish();
    }
  }

  void _finish() {
    final total = widget.exercises.length;
    final percent = total == 0 ? 0 : ((_correct / total) * 100).round();
    final xp = _correct * 10 + (percent == 100 ? 20 : 0);
    ProgressService.instance.completeLesson(
      lessonId: widget.lesson.id,
      percent: percent,
      xpEarned: xp,
      answered: total,
      correct: _correct,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          lesson: widget.lesson,
          percent: percent,
          correct: _correct,
          total: total,
          xp: xp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.exercises.length;
    final ex = widget.exercises[_index];
    final isLast = _index == total - 1;

    return Scaffold(
      appBar: AppBar(title: Text('Ejercicio ${_index + 1} de $total')),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: total == 0 ? 0 : _index / total,
            minHeight: 6,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              // Key nueva por pregunta: reinicia el estado del widget.
              child: _QuestionBody(
                key: ValueKey('q$_index'),
                exercise: ex,
                answered: _answered,
                onAnswered: _onAnswered,
              ),
            ),
          ),
          if (_answered)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FilledButton(
                  onPressed: _next,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(54),
                    textStyle: const TextStyle(fontSize: 17),
                  ),
                  child: Text(isLast ? 'Ver resultados' : 'Continuar'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _QuestionBody extends StatelessWidget {
  final Exercise exercise;
  final bool answered;
  final ValueChanged<bool> onAnswered;

  const _QuestionBody({
    super.key,
    required this.exercise,
    required this.answered,
    required this.onAnswered,
  });

  @override
  Widget build(BuildContext context) {
    switch (exercise.type) {
      case ExerciseType.multipleChoice:
        return _MultipleChoice(
          exercise: exercise,
          answered: answered,
          onAnswered: onAnswered,
        );
      case ExerciseType.listening:
        return _Listening(
          exercise: exercise,
          answered: answered,
          onAnswered: onAnswered,
        );
      case ExerciseType.fillBlank:
        return _FillBlank(
          exercise: exercise,
          answered: answered,
          onAnswered: onAnswered,
        );
      case ExerciseType.writing:
        return _Writing(
          exercise: exercise,
          answered: answered,
          onAnswered: onAnswered,
        );
      case ExerciseType.matching:
        return _Matching(exercise: exercise, onAnswered: onAnswered);
    }
  }
}

// --- Opción múltiple --------------------------------------------------------

class _MultipleChoice extends StatefulWidget {
  final Exercise exercise;
  final bool answered;
  final ValueChanged<bool> onAnswered;

  const _MultipleChoice({
    required this.exercise,
    required this.answered,
    required this.onAnswered,
  });

  @override
  State<_MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<_MultipleChoice> {
  int? _selected;

  @override
  Widget build(BuildContext context) {
    final ex = widget.exercise;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Instruction(ex.instruction),
        const SizedBox(height: 12),
        Text(
          ex.question,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        for (int i = 0; i < ex.options.length; i++)
          _OptionButton(
            text: ex.options[i],
            state: _stateFor(i, ex.correctIndex),
            onTap: widget.answered
                ? null
                : () {
                    setState(() => _selected = i);
                    widget.onAnswered(i == ex.correctIndex);
                  },
          ),
        if (widget.answered && ex.explanation.isNotEmpty)
          _Explanation(ex.explanation),
      ],
    );
  }

  _OptionState _stateFor(int i, int correct) {
    if (!widget.answered) {
      return _selected == i ? _OptionState.selected : _OptionState.idle;
    }
    if (i == correct) return _OptionState.correct;
    if (i == _selected) return _OptionState.wrong;
    return _OptionState.idle;
  }
}

enum _OptionState { idle, selected, correct, wrong }

class _OptionButton extends StatelessWidget {
  final String text;
  final _OptionState state;
  final VoidCallback? onTap;

  const _OptionButton({required this.text, required this.state, this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    Color? bg;
    Color? fg;
    IconData? icon;
    switch (state) {
      case _OptionState.selected:
        bg = scheme.primaryContainer;
        break;
      case _OptionState.correct:
        bg = Colors.green.shade100;
        fg = Colors.green.shade900;
        icon = Icons.check_circle;
        break;
      case _OptionState.wrong:
        bg = Colors.red.shade100;
        fg = Colors.red.shade900;
        icon = Icons.cancel;
        break;
      case _OptionState.idle:
        break;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          textStyle: const TextStyle(fontSize: 16),
          alignment: Alignment.centerLeft,
        ),
        child: Row(
          children: [
            Expanded(child: Text(text)),
            if (icon != null) Icon(icon),
          ],
        ),
      ),
    );
  }
}

// --- Escucha (listening) -----------------------------------------------------

class _Listening extends StatefulWidget {
  final Exercise exercise;
  final bool answered;
  final ValueChanged<bool> onAnswered;

  const _Listening({
    required this.exercise,
    required this.answered,
    required this.onAnswered,
  });

  @override
  State<_Listening> createState() => _ListeningState();
}

class _ListeningState extends State<_Listening> {
  int? _selected;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => TtsService.instance.speak(widget.exercise.audioText),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ex = widget.exercise;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Instruction(ex.instruction),
        const SizedBox(height: 24),
        Center(
          child: FilledButton.tonalIcon(
            icon: const Icon(Icons.volume_up, size: 32),
            label: const Text(
              'Escuchar de nuevo',
              style: TextStyle(fontSize: 17),
            ),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
            ),
            onPressed: () => TtsService.instance.speak(ex.audioText),
          ),
        ),
        const SizedBox(height: 24),
        for (int i = 0; i < ex.options.length; i++)
          _OptionButton(
            text: ex.options[i],
            state: _stateFor(i, ex.correctIndex),
            onTap: widget.answered
                ? null
                : () {
                    setState(() => _selected = i);
                    widget.onAnswered(i == ex.correctIndex);
                  },
          ),
        if (widget.answered && ex.explanation.isNotEmpty)
          _Explanation(ex.explanation),
      ],
    );
  }

  _OptionState _stateFor(int i, int correct) {
    if (!widget.answered) {
      return _selected == i ? _OptionState.selected : _OptionState.idle;
    }
    if (i == correct) return _OptionState.correct;
    if (i == _selected) return _OptionState.wrong;
    return _OptionState.idle;
  }
}

// --- Completar espacios ------------------------------------------------------

class _FillBlank extends StatefulWidget {
  final Exercise exercise;
  final bool answered;
  final ValueChanged<bool> onAnswered;

  const _FillBlank({
    required this.exercise,
    required this.answered,
    required this.onAnswered,
  });

  @override
  State<_FillBlank> createState() => _FillBlankState();
}

class _FillBlankState extends State<_FillBlank> {
  final _controller = TextEditingController();
  bool? _ok;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _check() {
    final ok = widget.exercise.acceptedAnswers
        .map(_normalize)
        .contains(_normalize(_controller.text));
    setState(() => _ok = ok);
    widget.onAnswered(ok);
  }

  @override
  Widget build(BuildContext context) {
    final ex = widget.exercise;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Instruction(ex.instruction),
        const SizedBox(height: 12),
        _BlankSentence(ex.question),
        const SizedBox(height: 20),
        TextField(
          controller: _controller,
          enabled: !widget.answered,
          autocorrect: false,
          textCapitalization: TextCapitalization.none,
          decoration: InputDecoration(
            labelText: 'Tu respuesta',
            hintText: ex.hint.isNotEmpty ? 'Pista: ${ex.hint}' : null,
            border: const OutlineInputBorder(),
          ),
          onSubmitted: (_) => widget.answered ? null : _check(),
        ),
        const SizedBox(height: 12),
        if (!widget.answered)
          FilledButton(onPressed: _check, child: const Text('Comprobar')),
        if (_ok != null) _Feedback(ok: _ok!, exercise: ex),
      ],
    );
  }
}

// --- Escritura libre ---------------------------------------------------------

class _Writing extends StatefulWidget {
  final Exercise exercise;
  final bool answered;
  final ValueChanged<bool> onAnswered;

  const _Writing({
    required this.exercise,
    required this.answered,
    required this.onAnswered,
  });

  @override
  State<_Writing> createState() => _WritingState();
}

class _WritingState extends State<_Writing> {
  final _controller = TextEditingController();
  bool? _ok;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _check() {
    final ok = widget.exercise.acceptedAnswers
        .map(_normalize)
        .contains(_normalize(_controller.text));
    setState(() => _ok = ok);
    widget.onAnswered(ok);
  }

  @override
  Widget build(BuildContext context) {
    final ex = widget.exercise;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Instruction(ex.instruction),
        const SizedBox(height: 12),
        Text(
          ex.question,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _controller,
          enabled: !widget.answered,
          autocorrect: false,
          textCapitalization: TextCapitalization.none,
          decoration: InputDecoration(
            labelText: 'Escribe en inglés',
            hintText: ex.hint.isNotEmpty ? 'Pista: ${ex.hint}' : null,
            border: const OutlineInputBorder(),
          ),
          onSubmitted: (_) => widget.answered ? null : _check(),
        ),
        const SizedBox(height: 12),
        if (!widget.answered)
          FilledButton(onPressed: _check, child: const Text('Comprobar')),
        if (_ok != null) _Feedback(ok: _ok!, exercise: ex),
      ],
    );
  }
}

// --- Emparejar ---------------------------------------------------------------

class _Matching extends StatefulWidget {
  final Exercise exercise;
  final ValueChanged<bool> onAnswered;

  const _Matching({required this.exercise, required this.onAnswered});

  @override
  State<_Matching> createState() => _MatchingState();
}

class _MatchingState extends State<_Matching> {
  late final List<String> _lefts;
  late final List<String> _rights;
  String? _selLeft;
  String? _selRight;
  final Set<String> _matched = {};
  int _mistakes = 0;
  bool _done = false;
  String _message = '';

  @override
  void initState() {
    super.initState();
    _lefts = widget.exercise.pairs.keys.toList()..shuffle();
    _rights = widget.exercise.pairs.values.toList()..shuffle();
  }

  void _tryMatch() {
    if (_selLeft == null || _selRight == null || _done) return;
    final left = _selLeft!;
    final right = _selRight!;
    if (widget.exercise.pairs[left] == right) {
      setState(() {
        _matched.add(left);
        _selLeft = null;
        _selRight = null;
        _message = '';
        if (_matched.length == widget.exercise.pairs.length) {
          _done = true;
          widget.onAnswered(_mistakes == 0);
        }
      });
    } else {
      setState(() {
        _mistakes++;
        _selLeft = null;
        _selRight = null;
        _message = 'Esa pareja no es correcta, inténtalo de nuevo.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Instruction(widget.exercise.instruction),
        const SizedBox(height: 6),
        if (_message.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              _message,
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final l in _lefts)
                    _MatchChip(
                      text: l,
                      selected: _selLeft == l,
                      matched: _matched.contains(l),
                      onTap: _matched.contains(l) || _done
                          ? null
                          : () {
                              setState(() => _selLeft = l);
                              _tryMatch();
                            },
                    ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final r in _rights)
                    _MatchChip(
                      text: r,
                      selected: _selRight == r,
                      matched: _matched.contains(
                        _keyForValue(widget.exercise.pairs, r),
                      ),
                      onTap:
                          _done ||
                              _matched.contains(
                                _keyForValue(widget.exercise.pairs, r),
                              )
                          ? null
                          : () {
                              setState(() => _selRight = r);
                              _tryMatch();
                            },
                    ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          '${_matched.length} de ${widget.exercise.pairs.length} parejas',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  String _keyForValue(Map<String, String> map, String value) {
    for (final e in map.entries) {
      if (e.value == value) return e.key;
    }
    return '';
  }
}

class _MatchChip extends StatelessWidget {
  final String text;
  final bool selected;
  final bool matched;
  final VoidCallback? onTap;

  const _MatchChip({
    required this.text,
    required this.selected,
    required this.matched,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: matched
              ? Colors.green.shade100
              : (selected ? scheme.primaryContainer : null),
          foregroundColor: matched ? Colors.green.shade900 : null,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            if (matched) ...[
              const SizedBox(width: 4),
              const Icon(Icons.check, size: 16),
            ],
          ],
        ),
      ),
    );
  }
}

// --- Piezas comunes ----------------------------------------------------------

class _Instruction extends StatelessWidget {
  final String text;
  const _Instruction(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class _Explanation extends StatelessWidget {
  final String text;
  const _Explanation(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb_outline),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class _Feedback extends StatelessWidget {
  final bool ok;
  final Exercise exercise;
  const _Feedback({required this.ok, required this.exercise});

  @override
  Widget build(BuildContext context) {
    final correct = exercise.acceptedAnswers.isNotEmpty
        ? exercise.acceptedAnswers.first
        : '';
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ok ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            ok ? Icons.check_circle : Icons.cancel,
            color: ok ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              ok ? '¡Correcto! 🎉' : 'Casi... la respuesta era: "$correct"',
              style: TextStyle(
                color: ok ? Colors.green.shade900 : Colors.red.shade900,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BlankSentence extends StatelessWidget {
  final String sentence;
  const _BlankSentence(this.sentence);

  @override
  Widget build(BuildContext context) {
    final parts = sentence.split('___');
    final spans = <TextSpan>[];
    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(text: parts[i]));
      if (i < parts.length - 1) {
        spans.add(
          const TextSpan(
            text: ' ______ ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        );
      }
    }
    return Text.rich(
      TextSpan(children: spans),
      style: Theme.of(
        context,
      ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}

/// Normaliza respuestas para comparar sin importar mayúsculas,
/// espacios extra, apóstrofes ni punto final.
String _normalize(String s) {
  var t = s.toLowerCase().trim().replaceAll(RegExp(r'\s+'), ' ');
  t = t.replaceAll('’', "'").replaceAll("'", '');
  t = t.replaceAll(RegExp(r'[.?!¡¿]+$'), '');
  return t;
}
