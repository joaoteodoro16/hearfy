import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hear_fy/app/core/ui/app_colors.dart';
import 'package:hear_fy/app/modules/home/widgets/playlist_item_widget.dart';
import 'package:hear_fy/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.find<HomeController>();


  @override
  void initState() {
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      await homeController.findAllPlaylists();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text(
          'Minhas Playlists',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Obx(
                    () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeController.playlists.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var item = homeController.playlists[index];
                        return PlaylistItemWidget(
                          item: item,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
