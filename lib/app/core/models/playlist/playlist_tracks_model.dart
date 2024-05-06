import 'dart:convert';

class PlaylistTracksModel {
  final String href;
  final int total;
  PlaylistTracksModel({
    required this.href,
    required this.total,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'href': href,
      'total': total,
    };
  }

  factory PlaylistTracksModel.fromMap(Map<String, dynamic> map) {
    return PlaylistTracksModel(
      href: map['href'] ?? '',
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaylistTracksModel.fromJson(String source) => PlaylistTracksModel.fromMap(json.decode(source));
}
