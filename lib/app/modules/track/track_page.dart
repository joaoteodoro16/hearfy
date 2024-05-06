import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hear_fy/app/core/ui/app_colors.dart';
import 'package:hear_fy/app/modules/track/track_controller.dart';
import 'package:hear_fy/app/modules/track/widgets/track_item_widget.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  final _controller = Get.find<TrackController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _controller.getTracks(Get.arguments['tracks']);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
        title:  Text(
          Get.arguments['playlistName'],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Obx(
          () {
            return ListView.builder(
              itemCount: _controller.tracks.length,
              itemBuilder: (context, index) {
                final track = _controller.tracks[index];
                return TrackItemWidget(
                  track: track,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
