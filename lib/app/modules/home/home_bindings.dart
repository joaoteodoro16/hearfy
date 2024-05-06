
import 'package:get/get.dart';
import 'package:hear_fy/app/modules/home/home_controller.dart';
import 'package:hear_fy/app/repositories/playlist/playlist_repository.dart';
import 'package:hear_fy/app/repositories/playlist/playlist_repository_impl.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PlaylistRepository>(() => PlaylistRepositoryImpl(spotifyRestClient: Get.find()));
    Get.lazyPut(() => HomeController(playlistRepository: Get.find()));
  }
  
}