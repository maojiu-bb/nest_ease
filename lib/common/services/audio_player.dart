import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

/// 播放状态枚举
enum AudioPlayerState {
  stopped, // 初始状态，已停止或发生错误
  playing, // 正在播放
  paused, // 暂停
  completed // 播放结束
}

class AudioPlayerService extends GetxService {
  static AudioPlayerService get to => Get.find();

  final audioPlayer = AudioPlayer();

  AudioPlayerState audioPlayerState = AudioPlayerState.stopped;

  // 音量
  double volume = 1.0;

  // 是否播放
  RxBool isPlaying = false.obs;

  // progress
  double progress = 0.0;

  // current time
  String currentTime = '00:00';

  // total time
  String totalTime = '00:00';

  // speed
  String speed = '1.0x';

  void initState() {
    audioPlayer.onDurationChanged.listen((Duration duration) {
      totalTime = _formatTime(duration);
    });

    audioPlayer.onPositionChanged.listen((Duration position) {
      progress = position.inMilliseconds.toDouble();
      currentTime = _formatTime(position);
    });

    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      audioPlayerState = _convertToAudioPlayerState(state);
    });
  }

  // 播放
  void playMusic(String url) {
    audioPlayer.play(
      UrlSource(url),
      volume: volume,
    );
    isPlaying.value = true;
  }

  // 终止
  void pauseMusic() {
    audioPlayer.pause();
    isPlaying.value = false;
  }

  // 暂停
  void stopMusic() {
    audioPlayer.stop();
    isPlaying.value = false;
  }

  // 继续播放
  void continueMusic() {
    audioPlayer.resume();
    isPlaying.value = true;
  }

  // 设置音量
  void setVolume(double volume) {
    audioPlayer.setVolume(volume);
    volume = volume;
  }

  // 上一首
  void previousTrack() {
    // TODO: Implement previous track logic
  }

  // 下一首
  void nextTrack() {
    // TODO: Implement next track logic
  }

  // 初始化
  Future<AudioPlayerService> init() async {
    initState();
    return this;
  }

  AudioPlayerState _convertToAudioPlayerState(PlayerState state) {
    switch (state) {
      case PlayerState.stopped:
        return AudioPlayerState.stopped;
      case PlayerState.playing:
        return AudioPlayerState.playing;
      case PlayerState.paused:
        return AudioPlayerState.paused;
      case PlayerState.completed:
        return AudioPlayerState.completed;
      default:
        return AudioPlayerState.stopped;
    }
  }

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
