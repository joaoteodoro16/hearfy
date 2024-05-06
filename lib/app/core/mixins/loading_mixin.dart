import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hear_fy/app/core/ui/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin LoadingMixin on GetxController {
  void loaderListener(RxBool loading) {
    ever(
      loading,
      (_) async {
        if (loading.isTrue) {
          await Get.dialog(
              PopScope(
                onPopInvoked: (didPop) => false,
                child: Center(
                  child: LoadingAnimationWidget.waveDots(
                    color: AppColors.secondary,
                    size: 50,
                  ),
                ),
              ),
              barrierDismissible: false);
        } else {
          Get.back();
        }
      },
    );
  }
}
