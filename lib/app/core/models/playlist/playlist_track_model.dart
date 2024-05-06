
import 'dart:convert';

import 'package:hear_fy/app/core/models/album_model.dart';
import 'package:hear_fy/app/core/models/playlist/artist_model.dart';

class PlaylistTrackModel {
  final String preview_url;
  final bool explicit;
  final String type;
  final List<ArtistModel> artists;
  final int duration_ms;
  final String href;
  final String name;
  final String uri;
  final AlbumModel album;
  
  PlaylistTrackModel({
    required this.preview_url,
    required this.explicit,
    required this.type,
    required this.artists,
    required this.duration_ms,
    required this.href,
    required this.name,
    required this.uri,
    required this.album,
  });


  Map<String, dynamic> toMap() {
    return {
      'preview_url': preview_url,
      'explicit': explicit,
      'type': type,
      'artists': artists.map((x) => x.toMap()).toList(),
      'duration_ms': duration_ms,
      'href': href,
      'name': name,
      'uri': uri,
      'album': album.toMap(),
    };
  }

  factory PlaylistTrackModel.fromMap(Map<String, dynamic> map) {
    return PlaylistTrackModel(
      preview_url: map['preview_url'] ?? '',
      explicit: map['explicit'] ?? false,
      type: map['type'] ?? '',
      artists: List<ArtistModel>.from(map['artists']?.map((x) => ArtistModel.fromMap(x)) ?? const []),
      duration_ms: map['duration_ms']?.toInt() ?? 0,
      href: map['href'] ?? '',
      name: map['name'] ?? '',
      uri: map['uri'] ?? '',
      album: AlbumModel.fromMap(map['album']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaylistTrackModel.fromJson(String source) => PlaylistTrackModel.fromMap(json.decode(source));
}
