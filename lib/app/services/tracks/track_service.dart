
import 'package:hear_fy/app/core/models/playlist/playlist_track_model.dart';

abstract interface class TrackService {
  Future<List<PlaylistTrackModel>> getTracks(String urlPlaylist);
}