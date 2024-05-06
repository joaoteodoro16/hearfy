import 'package:get/get.dart';
import 'package:hear_fy/app/core/exceptions/app_rate_limits_exception.dart';
import 'package:hear_fy/app/core/exceptions/expired_token_exception.dart';
import 'package:hear_fy/app/core/exceptions/oauth_incorrect_exception.dart';
import 'package:hear_fy/app/core/mixins/loading_mixin.dart';
import 'package:hear_fy/app/core/mixins/messages_mixin.dart';
import 'package:hear_fy/app/core/models/playlist/playlist_track_model.dart';
import 'package:hear_fy/app/modules/track/widgets/player_widget.dart';
import 'package:hear_fy/app/services/tracks/track_service.dart';
import 'package:just_audio/just_audio.dart';

class TrackController extends GetxController with LoadingMixin, MessagesMixin {
  final TrackService _trackService;
  final AudioPlayer _audio_player;

  var tracks = <PlaylistTrackModel>[].obs;
  final _message = Rxn<MessageModel>();
  final _loading = false.obs;
  var playing = false.obs;
  final trackPlaying = "".obs;

  TrackController(
      {required TrackService trackService,
      required AudioPlayer audioPlayer})
      : _trackService = trackService,
        _audio_player = audioPlayer;

  @override
  void onClose() async {
    await _audio_player.stop();
    super.onClose();
  }

  @override
  void onInit() async {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> getTracks(String urlPlaylist) async {
    try {
      _loading.toggle();
      tracks.value = await _trackService.getTracks(urlPlaylist);
      _loading.toggle();
    } on ExpiredTokenException catch (e) {
      _loading.toggle();
      _message(MessageModel(
          title: 'Erro', message: e.toString(), type: MessageType.error));
    } on OauthIncorrectException catch (e) {
      _loading.toggle();
      _message(MessageModel(
          title: 'Erro', message: e.toString(), type: MessageType.error));
    } on AppRateLimitsException catch (e) {
      _loading.toggle();
      _message(MessageModel(
          title: 'Erro', message: e.toString(), type: MessageType.error));
    } catch (e) {
      _loading.toggle();
      _message(MessageModel(
          title: 'Erro', message: e.toString(), type: MessageType.error));
    }
  }

  Future<void> playSound(PlaylistTrackModel track) async {
    final isCurrentlyPlaying = playing.value;
    final isSameTrackPlaying = trackPlaying.value == track.preview_url;

    if (isCurrentlyPlaying && isSameTrackPlaying) {
      playing.value = false;
      trackPlaying.value = "";
      await _audio_player.pause();
    } else {
      if (isCurrentlyPlaying) {
        await _audio_player.stop();
      }

      playing.value = true;
      trackPlaying.value = track.preview_url;

      await _audio_player.setUrl(track.preview_url);
      await _audio_player.play();
    }
  }

  Future<void> setInitialStatusSound(String previewUrl) async {
    if (previewUrl == trackPlaying.value) {
      playing.value = true;
    } else {
      playing.value = false;
    }
  }

  Future<void> nextSound(PlaylistTrackModel track) async {
    final index = tracks.lastIndexOf(track);
    PlaylistTrackModel newTrack;
    
    Get.back();
    trackPlaying.value = "";

    if (index == tracks.length - 1) {
      newTrack = tracks.first;
    } else {
      newTrack = tracks[index + 1];
    } 

    PlayerWidget(track: newTrack).showPlayer();
    await playSound(newTrack);
  }

  Future<void> previousSound(PlaylistTrackModel track) async {
    final index = tracks.lastIndexOf(track);
    PlaylistTrackModel newTrack;

    Get.back();
    trackPlaying.value = "";

    if (index == 0) {
      newTrack = tracks.last;
    } else {
      newTrack = tracks[index - 1];
    } 

    PlayerWidget(track: newTrack).showPlayer();
    await playSound(newTrack);
  }
}
