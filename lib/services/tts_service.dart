import 'package:flutter_tts/flutter_tts.dart';

/// Texto a voz para escuchar vocabulario, frases y ejercicios de escucha.
/// En web usa la síntesis de voz del navegador. Todo está envuelto en
/// try/catch: si el TTS no está disponible, la app sigue funcionando.
class TtsService {
  static final TtsService instance = TtsService._();
  TtsService._();

  final FlutterTts _tts = FlutterTts();
  bool _ready = false;

  Future<void> init() async {
    try {
      await _tts.setLanguage('en-US');
      await _tts.setSpeechRate(0.45); // lento, ideal para principiantes
      await _tts.setPitch(1.0);
      _ready = true;
    } catch (_) {
      _ready = false;
    }
  }

  Future<void> speak(String text) async {
    if (!_ready || text.isEmpty) return;
    try {
      await _tts.stop();
      await _tts.speak(text);
    } catch (_) {}
  }

  Future<void> stop() async {
    try {
      await _tts.stop();
    } catch (_) {}
  }
}
