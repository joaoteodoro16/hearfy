
import 'package:get/get.dart';
import 'package:hear_fy/app/core/rest_client/spotify_rest_client.dart';
import 'package:just_audio/just_audio.dart';

class ApplicationBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SpotifyRestClient(), fenix: true);
    Get.put(AudioPlayer(), permanent: true); //Um Player só para a aplicação toda
  }
  
}