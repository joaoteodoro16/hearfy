import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hear_fy/app/core/bindings/application_bindings.dart';
import 'package:hear_fy/app/routes/home_routers.dart';
import 'package:hear_fy/app/routes/track_routers.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HearFy',
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        ...HomeRouters.routers,
        ...TrackRouters.routers
      ],
    );
  }
}
