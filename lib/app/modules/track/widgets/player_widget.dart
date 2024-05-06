import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hear_fy/app/core/models/playlist/playlist_track_model.dart';
import 'package:hear_fy/app/core/ui/app_colors.dart';
import 'package:hear_fy/app/modules/track/track_controller.dart';

class PlayerWidget {
  final PlaylistTrackModel track;

  PlayerWidget({
    required this.track,
  });

  Future<void> showPlayer() async {
    final controller = Get.find<TrackController>();
    final artistis = track.artists.map((artist) => artist.name).join(", ");

    Get.bottomSheet(
        Container(
          color: AppColors.primary,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 14, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    child: Image.network(
                      track.album.images.first.url,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    track.name,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    artistis,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppColors.mediumGrey),
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () async => controller.previousSound(track),
                            child: CircleAvatar(
                              child: Icon(
                                Icons.skip_previous,
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            child: CircleAvatar(
                              maxRadius: 30,
                              child: Icon(
                                !controller.playing.value
                                    ? Icons.play_arrow
                                    : Icons.pause,
                                color: AppColors.secondary,
                                size: 50,
                              ),
                            ),
                            onTap: () async {
                              await controller.playSound(track);
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () async => controller.nextSound(track),
                            child: CircleAvatar(
                              child: Icon(
                                Icons.skip_next,
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        elevation: 0,
        isScrollControlled: true);
  }
}
