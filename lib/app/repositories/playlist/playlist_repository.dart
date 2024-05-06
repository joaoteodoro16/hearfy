import 'package:hear_fy/app/core/models/playlist/playlist_model.dart';

abstract interface class PlaylistRepository {

  Future<PlaylistModel> getAllByUser();
}