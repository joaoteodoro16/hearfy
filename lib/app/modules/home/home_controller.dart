import 'package:get/get.dart';
import 'package:hear_fy/app/core/exceptions/app_rate_limits_exception.dart';
import 'package:hear_fy/app/core/exceptions/expired_token_exception.dart';
import 'package:hear_fy/app/core/exceptions/oauth_incorrect_exception.dart';
import 'package:hear_fy/app/core/mixins/loading_mixin.dart';
import 'package:hear_fy/app/core/mixins/messages_mixin.dart';
import 'package:hear_fy/app/core/models/playlist/playlist_items_model.dart';
import 'package:hear_fy/app/repositories/playlist/playlist_repository.dart';

class HomeController extends GetxController with MessagesMixin, LoadingMixin {
  final PlaylistRepository _playlistRepository;

  final _message = Rxn<MessageModel>();
  final _loading = false.obs;
  var playlists = <PlaylistItemsModel>[].obs;

  HomeController({required PlaylistRepository playlistRepository})
      : _playlistRepository = playlistRepository;

  @override
  void onInit() async {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> findAllPlaylists() async {
    try {
      _loading.toggle();
      final data = await _playlistRepository.getAllByUser();
      playlists.value = data.items;
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
}
