import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hear_fy/app/core/models/playlist/playlist_items_model.dart';
import 'package:hear_fy/app/core/ui/app_colors.dart';

class PlaylistItemWidget extends StatelessWidget {
  final PlaylistItemsModel item;
  const PlaylistItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: () async {
          Get.toNamed('/tracks/', arguments: {
            'tracks': item.tracks.href,
            'playlistName': item.name
          });
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 13, top: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                Image.network(
                  item.images.first.url,
                  width: 60,
                  height: 60,
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        '${item.tracks.total} Musics',
                        style: TextStyle(color: AppColors.mediumGrey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
