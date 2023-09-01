import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:nestease_cloud_music/common/index.dart';

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

  // 是否循环播放
  RxBool isLoop = false.obs;

  // progress
  RxDouble progress = 0.0.obs;

  // current time
  RxString currentTime = '00:00'.obs;

  // total time
  RxString totalTime = '00:00'.obs;

  Rx<Duration> duration = Duration.zero.obs;

  // speed
  String speed = '1.0x';

  // 当前歌曲的信息
  List<SongDetailModel> songDetail = <SongDetailModel>[].obs;

  // 当前歌曲 URL
  List<MusicUrlModel> musicUrl = <MusicUrlModel>[].obs;

  // 歌曲列表
  List<SongListMusicModel> musicList = <SongListMusicModel>[].obs;

  // 播放索引
  RxInt currentIndex = 0.obs;

  // 设置索引
  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void initState() {
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      audioPlayerState = _convertToAudioPlayerState(state);
    });

    audioPlayer.onDurationChanged.listen((Duration audioDuration) {
      duration.value = audioDuration;
      totalTime.value = _formatTime(audioDuration);
    });

    audioPlayer.onPositionChanged.listen((Duration position) {
      if (duration.value.inMilliseconds > 0) {
        progress.value = position.inMilliseconds.toDouble() /
            duration.value.inMilliseconds.toDouble();
        currentTime.value = _formatTime(position);
        if (currentTime.value == totalTime.value) {
          if (isLoop.value == false) {
            isPlaying.value = false;
          }
        }
      }
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

  // 跳到指定位置
  void jumpToPosition(int value) {
    audioPlayer.seek(
      Duration(seconds: value),
    );
  }

  // 设置速度
  void setPlaySpeed(double speed) {
    audioPlayer.setPlaybackRate(speed);
  }

  // 设置循环模式
  void setLoopPlayMode() {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    isLoop.value = true;
  }

  // 设置随机模式
  void setReleasePlayMode() {
    audioPlayer.setReleaseMode(ReleaseMode.release);
    isLoop.value = false;
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
