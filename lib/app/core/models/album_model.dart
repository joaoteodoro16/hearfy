import 'dart:convert';

import 'package:hear_fy/app/core/models/playlist/playlist_banner_model.dart';

class AlbumModel {

  final String type;
  final String album_type;
  final String href;
  final String id;
  final List<PlaylistBannerModel> images;
  final String name;
  
  AlbumModel({
    required this.type,
    required this.album_type,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'album_type': album_type,
      'href': href,
      'id': id,
      'images': images.map((x) => x.toMap()).toList(),
      'name': name,
    };
  }

  factory AlbumModel.fromMap(Map<String, dynamic> map) {
    return AlbumModel(
      type: map['type'] ?? '',
      album_type: map['album_type'] ?? '',
      href: map['href'] ?? '',
      id: map['id'] ?? '',
      images: List<PlaylistBannerModel>.from(map['images']?.map((x) => PlaylistBannerModel.fromMap(x)) ?? const []),
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumModel.fromJson(String source) => AlbumModel.fromMap(json.decode(source));
}
