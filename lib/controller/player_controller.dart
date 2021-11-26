import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

final assetsAudioPlayer = AssetsAudioPlayer();

class PlayerController extends GetxController {
  RxString imageAdress = "".obs;
  RxBool isPlaying = false.obs;
  RxString songName = "".obs;
  RxInt position = 0.obs;
  final Rx<Duration> duration = Duration.zero.obs;

  void loadSong() async {
    await assetsAudioPlayer.open(
      Audio("assets/audio/song.mp3"),
    );
    duration.value = assetsAudioPlayer.current.value!.audio.duration;
    isPlaying.value = !isPlaying.value;
    currentPosition();
  }

  void setImage(String address) {
    imageAdress.value = address;
  }

  void playPause() async {
    await assetsAudioPlayer.playOrPause();
    isPlaying.value = !isPlaying.value;
  }

  void currentPosition() {
    assetsAudioPlayer.currentPosition.asBroadcastStream().forEach((element) {
      position.value = element.inSeconds;
    });
  }

  void seekTo(Duration duration) async {
    print(duration);
    assetsAudioPlayer.seek(Duration(seconds: duration.inSeconds));
  }

  void setName(String name) {
    songName.value = name;
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
