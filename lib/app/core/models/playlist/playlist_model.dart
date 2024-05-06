
import 'dart:convert';

import 'package:hear_fy/app/core/models/playlist/playlist_items_model.dart';

class PlaylistModel {

  final int limit;
  final String next;
  final String previous;
  final List<PlaylistItemsModel> items;
  
  PlaylistModel({
    required this.limit,
    required this.next,
    required this.previous,
    required this.items,
  });
  
  Map<String, dynamic> toMap() {
    return {
      'limit': limit,
      'next': next,
      'previous': previous,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory PlaylistModel.fromMap(Map<String, dynamic> map) {
    return PlaylistModel(
      limit: map['limit']?.toInt() ?? 0,
      next: map['next'] ?? '',
      previous: map['previous'] ?? '',
      items: List<PlaylistItemsModel>.from(map['items']?.map((x) => PlaylistItemsModel.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaylistModel.fromJson(String source) => PlaylistModel.fromMap(json.decode(source));
}
