import 'package:hear_fy/app/core/models/playlist/playlist_track_model.dart';
import 'package:hear_fy/app/repositories/tracks/tracks_repository.dart';

import './track_service.dart';

class TrackServiceImpl implements TrackService {
  
  final TracksRepository _tracksRepository;

  TrackServiceImpl({required TracksRepository tracksRepository}) : _tracksRepository = tracksRepository;
  
  @override
  Future<List<PlaylistTrackModel>> getTracks(String urlPlaylist) async{
    final newList = <PlaylistTrackModel>[];
    final tracks = await _tracksRepository.getTracks(urlPlaylist);

    for (var track in tracks) {
      if(track.preview_url != ""){ //Adiciona na lista somente as músicas que contem um link para reprodução!
        newList.add(track);
      }
    }
    return newList;
  }
  
}