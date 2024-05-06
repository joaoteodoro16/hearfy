import 'dart:convert';

class ArtistModel {
  final String href;
  final String id;
  final String name;
  final String type;
  final String uri;
  ArtistModel({
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });

  Map<String, dynamic> toMap() {
    return {
      'href': href,
      'id': id,
      'name': name,
      'type': type,
      'uri': uri,
    };
  }

  factory ArtistModel.fromMap(Map<String, dynamic> map) {
    return ArtistModel(
      href: map['href'] ?? '',
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      uri: map['uri'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtistModel.fromJson(String source) => ArtistModel.fromMap(json.decode(source));
}
