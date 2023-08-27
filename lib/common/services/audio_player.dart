import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService extends GetxService {
  static AudioPlayerService get to => Get.find();

  final audioPlayer = AudioPlayer();

  PlayerState? audioPlayerState;

  // 音量
  late double volume = 1.0;

  // 是否播放
  late bool isPlaying = false;

  void initState() {
    audioPlayer.onPlayerStateChanged.listen((event) {
      audioPlayerState = event;
    });
  }

  // 播放
  void playMusic(String url) {
    audioPlayer.play(url as Source);
    isPlaying = true;
  }

  // 终止
  void pauseMusic() {
    audioPlayer.pause();
    isPlaying = false;
  }

  // 暂停
  void stopMusic() {
    audioPlayer.stop();
    isPlaying = false;
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
}
