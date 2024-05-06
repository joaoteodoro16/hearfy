
import 'dart:convert';

import 'package:hear_fy/app/core/models/playlist/playlist_banner_model.dart';
import 'package:hear_fy/app/core/models/playlist/playlist_tracks_model.dart';

class PlaylistItemsModel {
  
  final bool collaborative;
  final String description;
  final List<PlaylistBannerModel> images;
  final String name;
  final bool public;
  final PlaylistTracksModel tracks;
  PlaylistItemsModel({
    required this.collaborative,
    required this.description,
    required this.images,
    required this.name,
    required this.public,
    required this.tracks,
  });

  Map<String, dynamic> toMap() {
    return {
      'collaborative': collaborative,
      'description': description,
      'images': images.map((x) => x.toMap()).toList(),
      'name': name,
      'public': public,
      'tracks': tracks.toMap(),
    };
  }

  factory PlaylistItemsModel.fromMap(Map<String, dynamic> map) {
    return PlaylistItemsModel(
      collaborative: map['collaborative'] ?? false,
      description: map['description'] ?? '',
      images: List<PlaylistBannerModel>.from(map['images']?.map((x) => PlaylistBannerModel.fromMap(x)) ?? const []),
      name: map['name'] ?? '',
      public: map['public'] ?? false,
      tracks: PlaylistTracksModel.fromMap(map['tracks']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaylistItemsModel.fromJson(String source) => PlaylistItemsModel.fromMap(json.decode(source));
}
