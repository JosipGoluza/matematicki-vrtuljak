import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerProvider extends ChangeNotifier {
  late AudioPlayer _audioPlayer;
  late AudioPlayer _correctSoundPlayer;
  late AudioPlayer _wrongSoundPlayer;

  AudioPlayer get audioPlayer => _audioPlayer;
  AudioPlayer get correctSoundPlayer => _correctSoundPlayer;
  AudioPlayer get wrongSoundPlayer => _wrongSoundPlayer;

  AudioPlayerProvider() {
    _audioPlayer = AudioPlayer();
    _correctSoundPlayer = AudioPlayer();
    _wrongSoundPlayer = AudioPlayer();

    // Set a sequence of audio sources that will be played by the audio player.
    _audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///assets/audio/music.wav'),
          ),
        ],
      ),
    ).catchError((error) {
      // Handle errors
    });

    // Set loop mode to LoopMode.one
    _audioPlayer.setLoopMode(LoopMode.one);
  }

  // Method to play a short sound effect
  Future<void> playCorrectSoundEffect() async {
    await _correctSoundPlayer.setAudioSource(
      AudioSource.uri(Uri.parse('asset:///assets/audio/sound_correct.wav')),
    );
    _correctSoundPlayer.play();
  }

  Future<void> playWrongSoundEffect() async {
    await _wrongSoundPlayer.setAudioSource(
      AudioSource.uri(Uri.parse('asset:///assets/audio/sound_wrong.wav')),
    );
    _wrongSoundPlayer.play();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _correctSoundPlayer.dispose();
    _wrongSoundPlayer.dispose();
    super.dispose();
  }
}