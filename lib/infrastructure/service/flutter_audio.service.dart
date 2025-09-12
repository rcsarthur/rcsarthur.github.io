import 'package:audioplayers/audioplayers.dart' show AudioPlayer, AssetSource, PlayerState;
import 'package:curriculum_dart/service/audio.service.dart';

class FlutterAudioService implements AudioService {
  static FlutterAudioService? _instancia;
  static AudioPlayer? _player;

  FlutterAudioService._() {
    _player = AudioPlayer();
    _player?.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        _player?.release();
      }
    });
  }

  // Instância Singleton
  static FlutterAudioService get instance {
    _instancia ??= FlutterAudioService._();
    return _instancia!;
  }

  @override
  Future<void> play(String asset) async {
    try {
      await _player?.play(AssetSource(asset));
    } catch (e) {
      await _player?.release();
    }
  }

  @override
  void dispose() {
    _player?.dispose();
    _player = null;
    _instancia = null;
  }
}
