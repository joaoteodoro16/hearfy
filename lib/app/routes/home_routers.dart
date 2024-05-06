
import 'package:get/get.dart';
import 'package:hear_fy/app/modules/home/home_bindings.dart';
import 'package:hear_fy/app/modules/home/home_page.dart';

class HomeRouters {
  
  HomeRouters._();

  static final routers = <GetPage> [
    GetPage(
      name: '/',
      page: () => const HomePage(),
      binding: HomeBindings()
    )
  ];

}