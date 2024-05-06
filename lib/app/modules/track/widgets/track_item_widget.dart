import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hear_fy/app/core/models/playlist/playlist_track_model.dart';
import 'package:hear_fy/app/core/ui/app_colors.dart';
import 'package:hear_fy/app/modules/track/track_controller.dart';
import 'package:hear_fy/app/modules/track/widgets/player_widget.dart';

class TrackItemWidget extends StatelessWidget {
  final PlaylistTrackModel track;
  const TrackItemWidget({super.key, required this.track});

  @override
  Widget build(BuildContext context) {
    final artistis = track.artists.map((artist) => artist.name).join(", ");

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: () async {
          Get.find<TrackController>().setInitialStatusSound(track.preview_url);
          final player = PlayerWidget(track: track);
          await player.showPlayer();
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 13, top: 10, right: 13, bottom: 10),
            child: Row(
              children: [
                Image.network(track.album.images.first.url),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        track.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        artistis,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: AppColors.mediumGrey),
                        maxLines: 1,
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
