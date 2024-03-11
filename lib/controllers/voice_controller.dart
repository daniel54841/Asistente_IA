import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceController extends GetxController {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  bool start = false;
  String _lastWords = '';
  @override
  void onInit() {
    _initSpeech();
    super.onInit();
  }

  /// Esto tiene que suceder solo una vez por aplicación.
  void _initSpeech() async {
    try {
      _speechEnabled = await _speechToText.initialize();
      update();
    } catch (e) {
      debugPrint("Exception in initSpeech $e");
    }
  }

  /// Cada vez que se inicia una sesión de reconocimiento de voz
  Future<void> startListening() async {
    try {
      await _speechToText.listen(onResult: _onSpeechResult);

      update();
    } catch (e) {
      debugPrint("Exception in startListening $e");
    }
  }

  /// Detener manualmente la sesión activa de reconocimiento de voz
  /// Tenga en cuenta que también hay tiempos de espera que impone cada plataforma.
  /// y el complemento SpeechToText admite la configuración de tiempos de espera en el
  /// método de escucha.
  Future<void> stopListening() async {
    await _speechToText.stop();
    update();
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    try {
      _lastWords = result.recognizedWords;
      debugPrint("_onSpeechResult: $_lastWords");
      update();
    } catch (e) {
      debugPrint("Exception in _onSpeechResult $e");
    }
  }
}
