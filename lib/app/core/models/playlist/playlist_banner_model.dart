import 'dart:convert';


class PlaylistBannerModel {
  
  final String url;
  final int height;
  final int width;
  
  PlaylistBannerModel({
    required this.url,
    required this.height,
    required this.width,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'height': height,
      'width': width,
    };
  }

  factory PlaylistBannerModel.fromMap(Map<String, dynamic> map) {
    return PlaylistBannerModel(
      url: map['url'] ?? '',
      height: map['height']?.toInt() ?? 0,
      width: map['width']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaylistBannerModel.fromJson(String source) => PlaylistBannerModel.fromMap(json.decode(source));
}
