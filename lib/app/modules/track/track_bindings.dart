import 'package:get/get.dart';
import 'package:hear_fy/app/modules/track/track_controller.dart';
import 'package:hear_fy/app/repositories/tracks/tracks_repository.dart';
import 'package:hear_fy/app/repositories/tracks/tracks_repository_impl.dart';
import 'package:hear_fy/app/services/tracks/track_service.dart';
import 'package:hear_fy/app/services/tracks/track_service_impl.dart';

class TrackBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TracksRepository>(() => TracksRepositoryImpl(spotifyRestClient: Get.find()));
    Get.lazyPut<TrackService>(() => TrackServiceImpl(tracksRepository: Get.find()));
    
    Get.lazyPut(() => TrackController(trackService: Get.find(),audioPlayer: Get.find()));
  }
}